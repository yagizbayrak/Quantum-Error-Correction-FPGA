"""Measures the logical error rate of PyMatching across physical error rates and code distances."""

import csv
import pathlib
import sys

import numpy as np
import pymatching

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import DATA, build_circuit

DISTANCES = [3, 5, 7, 9]
P_VALUES = np.geomspace(0.001, 0.015, 10)
SHOTS = 1_000_000
CHUNK = 250_000
SEED = 1234


def measure(distance, p):
    circuit = build_circuit(distance, distance, p)
    matcher = pymatching.Matching.from_detector_error_model(
        circuit.detector_error_model(decompose_errors=True)
    )
    sampler = circuit.compile_detector_sampler(seed=SEED)
    errors = 0
    for _ in range(SHOTS // CHUNK):
        dets, truth = sampler.sample(CHUNK, separate_observables=True)
        errors += (matcher.decode_batch(dets)[:, 0] != truth[:, 0]).sum()
    return errors


def main():
    DATA.mkdir(exist_ok=True)
    rows = []
    for distance in DISTANCES:
        for p in P_VALUES:
            errors = measure(distance, p)
            if errors <= 1:
                continue
            rows.append((distance, round(p, 6), SHOTS, int(errors), errors / SHOTS))
            print(f"d={distance:<3} p={p:<9.5f} errors={errors:<8} rate={errors/SHOTS:.6f}")

    with open(DATA / "sweep.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["distance", "p", "shots", "errors", "logical_error_rate"])
        w.writerows(rows)
    print(f"\n{len(rows)} points kept, {len(DISTANCES) * len(P_VALUES) - len(rows)} discarded")


if __name__ == "__main__":
    main()
