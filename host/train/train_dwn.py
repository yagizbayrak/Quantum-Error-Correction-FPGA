"""Trains a differentiable weightless neural network to predict the logical observable flip from detection events."""

import pathlib
import sys

import pymatching
import torch
import torch_dwn as dwn

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import build_circuit

DISTANCE = 7
NOISE = 0.001
WIDTHS = (1024, 512, 128, 32)
FANIN = 6
TAU = 3.33
EPOCHS = 60
SHOTS_PER_EPOCH = 1_000_000
TEST_SHOTS = 200_000
BATCH = 2048
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


def error_rate(model, x, y):
    with torch.no_grad():
        wrong = sum(
            (model(x[i : i + 8192]).argmax(1) != y[i : i + 8192]).sum().item()
            for i in range(0, len(x), 8192)
        )
    return wrong / len(x)


def main():
    circuit = build_circuit(DISTANCE, DISTANCE, NOISE)
    sampler = circuit.compile_detector_sampler(seed=SEED)
    dets, truth = sampler.sample(TEST_SHOTS, separate_observables=True)
    x = torch.tensor(dets, dtype=torch.float32, device=DEV)
    y = torch.tensor(truth[:, 0], dtype=torch.long, device=DEV)

    model = train(build(circuit.num_detectors), sampler)
    matcher = pymatching.Matching.from_detector_error_model(
        circuit.detector_error_model(decompose_errors=True)
    )
    reference = (matcher.decode_batch(dets)[:, 0].astype(bool) != truth[:, 0]).mean()

    print(f"d={DISTANCE} p={NOISE} {circuit.num_detectors} detectors, {EPOCHS * SHOTS_PER_EPOCH / 1e6:.0f}M presentations")
    print(f"  weightless {error_rate(model, x, y):.5f}")
    print(f"  pymatching {reference:.5f}")


if __name__ == "__main__":
    main()
