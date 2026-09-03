"""Trains Yang's single-layer recurrent decoder to predict the logical observable flip from per-round detection events."""

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

    def forward(self, x):
        wi, wh, b, wd, bd = (
            fake_quant(p, self.bits) for p in (self.wi, self.wh, self.b, self.wd, self.bd)
        )
        h = x.new_zeros(len(x), HIDDEN)
        c = h
        for t in range(x.shape[1]):
            i, f, u, o = (x[:, t] @ wi.T + h @ wh.T + b).chunk(4, 1)
            c = f.sigmoid() * c + i.sigmoid() * u.tanh()
            h = o.sigmoid() * c.tanh()
        return (h @ wd.T + bd).squeeze(1)


def layer_groups(circuit):
    groups = {}
    for index, coord in circuit.get_detector_coordinates().items():
        groups.setdefault(int(coord[2]), []).append(index)
    return [sorted(groups[t]) for t in sorted(groups)]


def sequence(dets, groups, width):
    out = np.zeros((len(dets), len(groups), width), dtype=np.float32)
    for t, indices in enumerate(groups):
        out[:, t, : len(indices)] = dets[:, indices]
    return torch.tensor(out, device=DEV)


def predict(model, x):
    with torch.no_grad():
        chunks = [model(x[i : i + 8192]) > 0 for i in range(0, len(x), 8192)]
    return torch.cat(chunks).cpu().numpy()


def train(model, x, y, vx, vy):
    opt = torch.optim.Adam(model.parameters(), lr=LR)
    best, waited, state = float("inf"), 0, None
    for _ in range(MAX_EPOCHS):
        for i in range(0, len(x), BATCH):
            loss = torch.nn.functional.binary_cross_entropy_with_logits(
                model(x[i : i + BATCH]), y[i : i + BATCH]
            )
            opt.zero_grad()
            loss.backward()
            opt.step()
        with torch.no_grad():
            validation = sum(
                torch.nn.functional.binary_cross_entropy_with_logits(
                    model(vx[i : i + 8192]), vy[i : i + 8192], reduction="sum"
                ).item()
                for i in range(0, len(vx), 8192)
            ) / len(vx)
        if validation < best:
            best, waited = validation, 0
            state = {k: v.clone() for k, v in model.state_dict().items()}
        else:
            waited += 1
            if waited == PATIENCE:
                break
    model.load_state_dict(state)
    return model


def main():
    torch.manual_seed(SEED)
    circuit = build_circuit(DISTANCE, DISTANCE, NOISE)
    groups = layer_groups(circuit)
    width = max(len(g) for g in groups)

    dets, truth = circuit.compile_detector_sampler(seed=SEED).sample(
        SHOTS, separate_observables=True
    )
    split = int(SHOTS * (1 - TEST_FRACTION))
    x = sequence(dets[:split], groups, width)
    y = torch.tensor(truth[:split, 0], dtype=torch.float32, device=DEV)
    vx = sequence(dets[split:], groups, width)
    vy = torch.tensor(truth[split:, 0], dtype=torch.float32, device=DEV)

    reference = train(Decoder(width, None).to(DEV), x, y, vx, vy)
    aware = train(Decoder(width, WEIGHT_BITS).to(DEV), x, y, vx, vy)

    torch.save(reference.state_dict(), RESULTS / f"recurrent-d{DISTANCE}-p{NOISE}-float.pt")
    torch.save(aware.state_dict(), RESULTS / f"recurrent-d{DISTANCE}-p{NOISE}-{WEIGHT_BITS}bit.pt")

    matcher = pymatching.Matching.from_detector_error_model(
        circuit.detector_error_model(decompose_errors=True)
    )
    answer = truth[split:, 0]
    mwpm_prediction = matcher.decode_batch(dets[split:])[:, 0].astype(bool)
    quantized_prediction = predict(aware, vx)
    float_rate = (predict(reference, vx) != answer).mean()
    quantized_rate = (quantized_prediction != answer).mean()
    mwpm = (mwpm_prediction != answer).mean()
    ours, theirs, sigma = mcnemar(quantized_prediction, mwpm_prediction, answer)

    print(f"d={DISTANCE} p={NOISE} {[len(g) for g in groups]} detectors per layer, {HIDDEN} units")
    print(f"  recurrent float          {float_rate:.5f}")
    print(f"  recurrent {WEIGHT_BITS}-bit aware    {quantized_rate:.5f}")
    print(f"  pymatching               {mwpm:.5f}")
    print(f"  discordant               {WEIGHT_BITS}-bit only wrong {ours}, pymatching only wrong {theirs}, {sigma:+.1f} sigma")
    record(
        decoder="recurrent",
        distance=DISTANCE,
        p=NOISE,
        shots=len(vy),
        seed=SEED,
        config=f"{HIDDEN} units, {WEIGHT_BITS} bit",
        float_rate=f"{float_rate:.5f}",
        quantized_rate=f"{quantized_rate:.5f}",
        pymatching=f"{mwpm:.5f}",
        decoder_only_wrong=ours,
        mwpm_only_wrong=theirs,
        sigma=f"{sigma:+.1f}",
    )


if __name__ == "__main__":
    main()
