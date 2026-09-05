"""Trains Yang's recurrent decoder over both detector families in clipped and standard activation variants, resuming from the last completed epoch."""

import pathlib
import sys

import numpy as np
import pymatching
import torch

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import build_circuit
from results import RESULTS, mcnemar, record

DISTANCE = 3
HIDDEN = 32
WEIGHT_BITS = 6
TIMESTEPS = 20
ROUNDS = range(1, TIMESTEPS)
NOISES = (0.005,)
SHOTS = 2_000_000
TEST_FRACTION = 0.2
BATCH = 256
LR = 1e-3
MAX_EPOCHS = 50
PATIENCE = 5
SEED = 31
DEV = "cuda"
ABSENT = -1.0


def clipped_sigmoid(x):
    return (0.5 * x + 0.5).clamp(0.0, 1.0)


def clipped_relu(x):
    return x.clamp(0.0, 1.0)


ACTIVATIONS = {
    "clipped": (clipped_sigmoid, clipped_relu),
    "standard": (torch.sigmoid, torch.tanh),
}


def quantize(w, bits):
    step = w.abs().max().clamp_min(1e-12) / (2 ** (bits - 1) - 1)
    return (w / step).round().clamp(-2 ** (bits - 1), 2 ** (bits - 1) - 1) * step


def fake_quant(w, bits):
    return w if bits is None else w + (quantize(w, bits) - w).detach()


class Decoder(torch.nn.Module):
    def __init__(self, width, bits, activation):
        super().__init__()
        self.bits = bits
        self.gate, self.cell = ACTIVATIONS[activation]
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
            c = torch.where(step, self.gate(f) * c + self.gate(i) * self.cell(u), c)
            h = torch.where(step, self.gate(o) * self.cell(c), h)
        return (h @ wd.T + bd).squeeze(1)


def detector_columns(circuit):
    places = {(c[0], c[1]) for c in circuit.get_detector_coordinates().values()}
    return {place: column for column, place in enumerate(sorted(places))}


def dataset(rounds, shots, columns, noise):
    circuit = build_circuit(DISTANCE, rounds, noise)
    coords = circuit.get_detector_coordinates()
    dets, truth = circuit.compile_detector_sampler(seed=SEED + rounds).sample(
        shots, separate_observables=True
    )
    x = np.full((shots, TIMESTEPS, len(columns)), ABSENT, dtype=np.float32)
    mask = np.zeros((shots, TIMESTEPS), dtype=bool)
    for index, coord in coords.items():
        layer = int(coord[2])
        x[:, layer, columns[(coord[0], coord[1])]] = dets[:, index]
        mask[:, layer] = True
    return x, mask, truth[:, 0], circuit, dets


def resident(x, mask, y):
    return (
        torch.tensor(x, device=DEV),
        torch.tensor(mask, device=DEV),
        torch.tensor(y, dtype=torch.float32, device=DEV),
    )


def batches(x, mask, y, size, shuffle):
    order = torch.randperm(len(x)).to(DEV) if shuffle else torch.arange(len(x), device=DEV)
    for i in range(0, len(x), size):
        pick = order[i : i + size]
        yield x[pick], mask[pick], y[pick]


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


def checkpoint(path, model, opt, epoch, best, waited, best_state):
    staged = path.with_suffix(".staged")
    torch.save(
        {
            "model": model.state_dict(),
            "opt": opt.state_dict(),
            "epoch": epoch,
            "best": best,
            "waited": waited,
            "best_state": best_state,
            "rng": torch.get_rng_state(),
        },
        staged,
    )
    staged.replace(path)


def train(model, train_set, validation_set, path, label):
    opt = torch.optim.Adam(model.parameters(), lr=LR)
    start, best, waited = 0, float("inf"), 0
    best_state = {k: v.clone() for k, v in model.state_dict().items()}
    if path.exists():
        state = torch.load(path, map_location=DEV)
        model.load_state_dict(state["model"])
        opt.load_state_dict(state["opt"])
        start, best, waited = state["epoch"], state["best"], state["waited"]
        best_state = state["best_state"]
        torch.set_rng_state(state["rng"].cpu())
        print(f"{label}  resuming at epoch {start + 1}", flush=True)
        if start >= MAX_EPOCHS or waited >= PATIENCE:
            model.load_state_dict(best_state)
            return model
    for epoch in range(start, MAX_EPOCHS):
        seen = running = 0
        for xb, mb, yb in batches(*train_set, BATCH, True):
            loss = torch.nn.functional.binary_cross_entropy_with_logits(model(xb, mb), yb)
            opt.zero_grad()
            loss.backward()
            opt.step()
            running += loss.item() * len(xb)
            seen += len(xb)
        with torch.no_grad():
            total = sum(
                torch.nn.functional.binary_cross_entropy_with_logits(
                    model(xb, mb), yb, reduction="sum"
                ).item()
                for xb, mb, yb in batches(*validation_set, 8192, False)
            )
        validation = total / len(validation_set[0])
        if validation < best:
            best, waited = validation, 0
            best_state = {k: v.clone() for k, v in model.state_dict().items()}
        else:
            waited += 1
        print(
            f"{label}  epoch {epoch + 1}/{MAX_EPOCHS}"
            f"  train {running / seen:.5f}  validation {validation:.5f}"
            f"  best {best:.5f}  patience {waited}/{PATIENCE}",
            flush=True,
        )
        checkpoint(path, model, opt, epoch + 1, best, waited, best_state)
        if waited == PATIENCE:
            break
    model.load_state_dict(best_state)
    return model


def epsilon(rates):
    rounds = np.array(sorted(rates), dtype=float)
    fidelity = np.array([1 - 2 * rates[int(n)] for n in rounds])
    keep = fidelity > 0
    slope = np.polyfit(rounds[keep], np.log(fidelity[keep]), 1)[0]
    return (1 - np.exp(slope)) / 2


def run(noise, activation, width, train_set, validation_set, held):
    tag = f"d{DISTANCE}-p{noise}-{activation}"
    name = f"{WEIGHT_BITS}bit"
    aware = train(
        Decoder(width, WEIGHT_BITS, activation).to(DEV),
        train_set,
        validation_set,
        RESULTS / f"recurrent-{tag}-{name}.state",
        f"{tag} {name}",
    )
    torch.save(aware.state_dict(), RESULTS / f"recurrent-{tag}-{name}.pt")

    aware_rates, mwpm_rates = {}, {}
    ours_total = theirs_total = 0
    for rounds in ROUNDS:
        x, mask, y, circuit, dets = held[rounds]
        matcher = pymatching.Matching.from_detector_error_model(
            circuit.detector_error_model(decompose_errors=True)
        )
        mwpm_prediction = matcher.decode_batch(dets)[:, 0].astype(bool)
        aware_prediction = predict(aware, x, mask)
        aware_rates[rounds] = float((aware_prediction != y).mean())
        mwpm_rates[rounds] = float((mwpm_prediction != y).mean())
        ours, theirs, _ = mcnemar(aware_prediction, mwpm_prediction, y)
        ours_total += ours
        theirs_total += theirs

    sigma = (theirs_total - ours_total) / (ours_total + theirs_total) ** 0.5
    aware_eps, mwpm_eps = (epsilon(r) for r in (aware_rates, mwpm_rates))

    print(f"\n{tag}  {width} detectors per round, {HIDDEN} units")
    print(f"  per-round logical error rate, fit to F(n) = (1 - 2 eps)^n")
    print(f"    {WEIGHT_BITS}-bit aware      {aware_eps:.5f}")
    print(f"    pymatching       {mwpm_eps:.5f}")
    print(f"  per-shot rate at {DISTANCE} rounds: {WEIGHT_BITS}-bit {aware_rates[DISTANCE]:.5f}, pymatching {mwpm_rates[DISTANCE]:.5f}")
    print(f"  per-shot rate at {ROUNDS.stop - 1} rounds: {WEIGHT_BITS}-bit {aware_rates[ROUNDS.stop - 1]:.5f}, pymatching {mwpm_rates[ROUNDS.stop - 1]:.5f}")
    print(f"  discordant       {ours_total} against {theirs_total}, {sigma:+.1f} sigma\n", flush=True)
    record(
        decoder="recurrent",
        distance=DISTANCE,
        p=noise,
        shots=len(validation_set[0]),
        seed=SEED,
        config=f"{HIDDEN} units, {WEIGHT_BITS} bit, {activation} activations, {width} detectors, rounds 1-{ROUNDS.stop - 1}, per-round eps",
        quantized_rate=f"{aware_eps:.5f}",
        pymatching=f"{mwpm_eps:.5f}",
        decoder_only_wrong=ours_total,
        mwpm_only_wrong=theirs_total,
        sigma=f"{sigma:+.1f}",
    )


def main():
    torch.manual_seed(SEED)
    columns = detector_columns(build_circuit(DISTANCE, DISTANCE, NOISES[0]))
    per_round = SHOTS // len(ROUNDS)
    split = int(per_round * (1 - TEST_FRACTION))

    for noise in NOISES:
        train_x, train_mask, train_y = [], [], []
        held = {}
        for rounds in ROUNDS:
            x, mask, y, circuit, dets = dataset(rounds, per_round, columns, noise)
            train_x.append(x[:split]); train_mask.append(mask[:split]); train_y.append(y[:split])
            held[rounds] = (x[split:], mask[split:], y[split:], circuit, dets[split:])
        train_set = resident(*(np.concatenate(a) for a in (train_x, train_mask, train_y)))
        validation_set = resident(*(np.concatenate([held[r][i] for r in ROUNDS]) for i in range(3)))
        for activation in ACTIVATIONS:
            run(noise, activation, len(columns), train_set, validation_set, held)


if __name__ == "__main__":
    main()
