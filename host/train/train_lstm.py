"""Replicates Yang's recurrent decoder: one LSTM layer over per-round Z-stabilizer detection events, 6-bit weights, clipped activations."""

import pathlib
import sys

import numpy as np
import pymatching
import torch

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import build_circuit
from results import RESULTS, mcnemar, record

DISTANCE = 3
NOISE = 0.001
HIDDEN = 32
WEIGHT_BITS = 6
TIMESTEPS = 20
ROUNDS = range(1, TIMESTEPS)
SHOTS = 2_000_000
TEST_FRACTION = 0.2
BATCH = 256
LR = 1e-3
MAX_EPOCHS = 50
PATIENCE = 5
SEED = 31
DEV = "cuda"


def quantize(w, bits):
    step = w.abs().max().clamp_min(1e-12) / (2 ** (bits - 1) - 1)
    return (w / step).round().clamp(-2 ** (bits - 1), 2 ** (bits - 1) - 1) * step


def fake_quant(w, bits):
    return w if bits is None else w + (quantize(w, bits) - w).detach()


def hard_sigmoid(x):
    return (0.5 * x + 0.5).clamp(0.0, 1.0)


def hard_tanh(x):
    return x.clamp(0.0, 1.0)


class Decoder(torch.nn.Module):
    def __init__(self, width, bits):
        super().__init__()
        self.bits = bits
        k = HIDDEN ** -0.5
        self.wi = torch.nn.Parameter(torch.empty(4 * HIDDEN, width).uniform_(-k, k))
        self.wh = torch.nn.Parameter(torch.empty(4 * HIDDEN, HIDDEN).uniform_(-k, k))
        self.b = torch.nn.Parameter(torch.zeros(4 * HIDDEN))
        self.wd = torch.nn.Parameter(torch.empty(1, HIDDEN).uniform_(-k, k))
        self.bd = torch.nn.Parameter(torch.zeros(1))

    def forward(self, x, mask):
        wi, wh, b, wd, bd = (
            fake_quant(p, self.bits) for p in (self.wi, self.wh, self.b, self.wd, self.bd)
        )
        h = x.new_zeros(len(x), HIDDEN)
        c = h
        for t in range(x.shape[1]):
            i, f, u, o = (x[:, t] @ wi.T + h @ wh.T + b).chunk(4, 1)
            step = mask[:, t : t + 1]
            c = torch.where(step, hard_sigmoid(f) * c + hard_sigmoid(i) * hard_tanh(u), c)
            h = torch.where(step, hard_sigmoid(o) * hard_tanh(c), h)
        return (h @ wd.T + bd).squeeze(1)


def z_layers(circuit):
    groups = {}
    for index, coord in circuit.get_detector_coordinates().items():
        groups.setdefault(int(coord[2]), []).append((coord[0], coord[1], index))
    first = {(x, y) for x, y, _ in groups[0]}
    return [
        [i for x, y, i in sorted(groups[t]) if (x, y) in first] for t in sorted(groups)
    ]


def dataset(rounds, shots):
    circuit = build_circuit(DISTANCE, rounds, NOISE)
    layers = z_layers(circuit)
    dets, truth = circuit.compile_detector_sampler(seed=SEED + rounds).sample(
        shots, separate_observables=True
    )
    x = np.full((shots, TIMESTEPS, len(layers[0])), -1.0, dtype=np.float32)
    mask = np.zeros((shots, TIMESTEPS), dtype=bool)
    for t, indices in enumerate(layers):
        x[:, t] = dets[:, indices]
        mask[:, t] = True
    return x, mask, truth[:, 0], circuit, dets


def batches(x, mask, y, size, shuffle):
    order = torch.randperm(len(x)) if shuffle else torch.arange(len(x))
    for i in range(0, len(x), size):
        pick = order[i : i + size]
        yield (
            torch.tensor(x[pick.numpy()], device=DEV),
            torch.tensor(mask[pick.numpy()], device=DEV),
            torch.tensor(y[pick.numpy()], dtype=torch.float32, device=DEV),
        )


def predict(model, x, mask):
    with torch.no_grad():
        out = [
            model(
                torch.tensor(x[i : i + 8192], device=DEV),
                torch.tensor(mask[i : i + 8192], device=DEV),
            )
            > 0
            for i in range(0, len(x), 8192)
        ]
    return torch.cat(out).cpu().numpy()


def train(model, train_set, validation_set):
    opt = torch.optim.Adam(model.parameters(), lr=LR)
    best, waited, state = float("inf"), 0, None
    for _ in range(MAX_EPOCHS):
        for xb, mb, yb in batches(*train_set, BATCH, True):
            loss = torch.nn.functional.binary_cross_entropy_with_logits(model(xb, mb), yb)
            opt.zero_grad()
            loss.backward()
            opt.step()
        with torch.no_grad():
            total = sum(
                torch.nn.functional.binary_cross_entropy_with_logits(
                    model(xb, mb), yb, reduction="sum"
                ).item()
                for xb, mb, yb in batches(*validation_set, 8192, False)
            )
        validation = total / len(validation_set[0])
        if validation < best:
            best, waited, state = validation, 0, {k: v.clone() for k, v in model.state_dict().items()}
        else:
            waited += 1
            if waited == PATIENCE:
                break
    model.load_state_dict(state)
    return model


def epsilon(rates):
    rounds = np.array(sorted(rates), dtype=float)
    fidelity = np.array([1 - 2 * rates[int(n)] for n in rounds])
    keep = fidelity > 0
    slope = np.polyfit(rounds[keep], np.log(fidelity[keep]), 1)[0]
    return (1 - np.exp(slope)) / 2


def main():
    torch.manual_seed(SEED)
    per_round = SHOTS // len(ROUNDS)
    split = int(per_round * (1 - TEST_FRACTION))

    train_x, train_mask, train_y = [], [], []
    held = {}
    for rounds in ROUNDS:
        x, mask, y, circuit, dets = dataset(rounds, per_round)
        train_x.append(x[:split]); train_mask.append(mask[:split]); train_y.append(y[:split])
        held[rounds] = (x[split:], mask[split:], y[split:], circuit, dets[split:])

    train_set = (np.concatenate(train_x), np.concatenate(train_mask), np.concatenate(train_y))
    validation_set = tuple(np.concatenate([held[r][i] for r in ROUNDS]) for i in range(3))

    width = train_set[0].shape[2]
    reference = train(Decoder(width, None).to(DEV), train_set, validation_set)
    aware = train(Decoder(width, WEIGHT_BITS).to(DEV), train_set, validation_set)
    torch.save(reference.state_dict(), RESULTS / f"recurrent-d{DISTANCE}-p{NOISE}-float.pt")
    torch.save(aware.state_dict(), RESULTS / f"recurrent-d{DISTANCE}-p{NOISE}-{WEIGHT_BITS}bit.pt")

    float_rates, aware_rates, mwpm_rates = {}, {}, {}
    ours_total = theirs_total = 0
    for rounds in ROUNDS:
        x, mask, y, circuit, dets = held[rounds]
        matcher = pymatching.Matching.from_detector_error_model(
            circuit.detector_error_model(decompose_errors=True)
        )
        mwpm_prediction = matcher.decode_batch(dets)[:, 0].astype(bool)
        aware_prediction = predict(aware, x, mask)
        float_rates[rounds] = float((predict(reference, x, mask) != y).mean())
        aware_rates[rounds] = float((aware_prediction != y).mean())
        mwpm_rates[rounds] = float((mwpm_prediction != y).mean())
        ours, theirs, _ = mcnemar(aware_prediction, mwpm_prediction, y)
        ours_total += ours
        theirs_total += theirs

    sigma = (theirs_total - ours_total) / (ours_total + theirs_total) ** 0.5
    float_eps, aware_eps, mwpm_eps = (epsilon(r) for r in (float_rates, aware_rates, mwpm_rates))

    print(f"d={DISTANCE} p={NOISE} rounds {ROUNDS.start}..{ROUNDS.stop - 1}, {width} Z stabilizers, {HIDDEN} units")
    print(f"  per-round logical error rate, fit to F(n) = (1 - 2 eps)^n")
    print(f"    float32          {float_eps:.5f}")
    print(f"    {WEIGHT_BITS}-bit aware      {aware_eps:.5f}")
    print(f"    pymatching       {mwpm_eps:.5f}")
    print(f"  per-shot rate at {ROUNDS.stop - 1} rounds: {WEIGHT_BITS}-bit {aware_rates[ROUNDS.stop - 1]:.5f}, pymatching {mwpm_rates[ROUNDS.stop - 1]:.5f}")
    print(f"  discordant       {ours_total} against {theirs_total}, {sigma:+.1f} sigma")
    record(
        decoder="recurrent",
        distance=DISTANCE,
        p=NOISE,
        shots=len(validation_set[0]),
        seed=SEED,
        config=f"{HIDDEN} units, {WEIGHT_BITS} bit, rounds 1-{ROUNDS.stop - 1}, per-round eps",
        float_rate=f"{float_eps:.5f}",
        quantized_rate=f"{aware_eps:.5f}",
        pymatching=f"{mwpm_eps:.5f}",
        decoder_only_wrong=ours_total,
        mwpm_only_wrong=theirs_total,
        sigma=f"{sigma:+.1f}",
    )


if __name__ == "__main__":
    main()
