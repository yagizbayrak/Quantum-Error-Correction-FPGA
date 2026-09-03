"""Runs Union-Find and PyMatching on identical shots across distances and physical error rates."""

import csv
import pathlib
import sys

import numpy as np
import pymatching

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import DATA, build_circuit
from unionfind import UnionFind

DISTANCES = [3, 5, 7, 9]
P_VALUES = np.geomspace(0.001, 0.015, 10)
SHOTS = 100_000
SEED = 1234


def main():
    rows = []
    print(f"{'d':>3} {'p':>9} {'union-find':>12} {'pymatching':>12} {'ratio':>7} {'disagree':>9}")
    for d in DISTANCES:
        for p in P_VALUES:
            circuit = build_circuit(d, d, p)
            dem = circuit.detector_error_model(decompose_errors=True)
            uf = UnionFind(dem)
            mwpm = pymatching.Matching.from_detector_error_model(dem)

            dets, truth = circuit.compile_detector_sampler(seed=SEED).sample(
                SHOTS, separate_observables=True
            )
            truth = truth[:, 0]
            a = uf.decode_batch(dets)
            b = mwpm.decode_batch(dets)[:, 0].astype(bool)
            ea, eb = (a != truth).mean(), (b != truth).mean()
            ratio = ea / eb if eb else float("nan")
            rows.append((d, p, SHOTS, ea, eb, int((a != b).sum())))
            print(f"{d:>3} {p:>9.6f} {ea:>12.5f} {eb:>12.5f} {ratio:>7.2f} {(a != b).sum():>9}")

    with open(DATA / "compare.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["distance", "p", "shots", "union_find", "pymatching", "disagree"])
        w.writerows(rows)


if __name__ == "__main__":
    main()
