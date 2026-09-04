"""Trains a differentiable weightless neural network to predict the logical observable flip from detection events."""

import pathlib
import sys

import pymatching
import torch
import torch_dwn as dwn

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import build_circuit
from results import RESULTS, mcnemar, record

DISTANCE = 3
NOISE = 0.001
WIDTHS = (1024, 512, 128, 32)
FANIN = 6
TAU = 3.33
EPOCHS = 60
SHOTS_PER_EPOCH = 1_000_000
TEST_SHOTS = 2_000_000
BATCH = 512
LR = 1e-2
SEED = 31
DEV = "cuda"


def build(inputs):
    layers, prev = [], inputs
    for width in WIDTHS:
        layers.append(dwn.LUTLayer(prev, width, n=FANIN, mapping="learnable"))
        prev = width
    return torch.nn.Sequential(*layers, dwn.GroupSum(2, tau=TAU)).to(DEV)


def tensors(sampler, n):
    dets, truth = sampler.sample(n, separate_observables=True)
    x = torch.tensor(dets, dtype=torch.float32, device=DEV)
    y = torch.tensor(truth[:, 0], dtype=torch.long, device=DEV)
    return x, y


def train(model, sampler):
    opt = torch.optim.Adam(model.parameters(), lr=LR)
    sched = torch.optim.lr_scheduler.CosineAnnealingLR(opt, T_max=EPOCHS)
    for _ in range(EPOCHS):
        x, y = tensors(sampler, SHOTS_PER_EPOCH)
        for i in range(0, len(x), BATCH):
            loss = torch.nn.functional.cross_entropy(model(x[i : i + BATCH]), y[i : i + BATCH])
            opt.zero_grad()
            loss.backward()
            opt.step()
        sched.step()
    return model


def predict(model, x):
    with torch.no_grad():
        chunks = [model(x[i : i + 8192]).argmax(1) for i in range(0, len(x), 8192)]
    return torch.cat(chunks).cpu().numpy().astype(bool)


def main():
    circuit = build_circuit(DISTANCE, DISTANCE, NOISE)
    sampler = circuit.compile_detector_sampler(seed=SEED)
    dets, truth = sampler.sample(TEST_SHOTS, separate_observables=True)
    x = torch.tensor(dets, dtype=torch.float32, device=DEV)
    y = torch.tensor(truth[:, 0], dtype=torch.long, device=DEV)

    model = train(build(circuit.num_detectors), sampler)
    torch.save(model.state_dict(), RESULTS / f"dwn-d{DISTANCE}-p{NOISE}.pt")

    matcher = pymatching.Matching.from_detector_error_model(
        circuit.detector_error_model(decompose_errors=True)
    )
    answer = truth[:, 0]
    mwpm_prediction = matcher.decode_batch(dets)[:, 0].astype(bool)
    our_prediction = predict(model, x)
    weightless = (our_prediction != answer).mean()
    reference = (mwpm_prediction != answer).mean()
    ours, theirs, sigma = mcnemar(our_prediction, mwpm_prediction, answer)

    print(f"d={DISTANCE} p={NOISE} {circuit.num_detectors} detectors, {EPOCHS * SHOTS_PER_EPOCH / 1e6:.0f}M presentations")
    print(f"  weightless {weightless:.5f}")
    print(f"  pymatching {reference:.5f}")
    print(f"  discordant weightless only wrong {ours}, pymatching only wrong {theirs}, {sigma:+.1f} sigma")
    record(
        decoder="weightless",
        distance=DISTANCE,
        p=NOISE,
        shots=TEST_SHOTS,
        seed=SEED,
        config=f"{WIDTHS}, fan-in {FANIN}, tau {TAU}, batch {BATCH}",
        float_rate=f"{weightless:.5f}",
        pymatching=f"{reference:.5f}",
        decoder_only_wrong=ours,
        mwpm_only_wrong=theirs,
        sigma=f"{sigma:+.1f}",
    )


if __name__ == "__main__":
    main()
