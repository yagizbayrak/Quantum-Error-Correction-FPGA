"""Writes the Union-Find and weightless golden-model predictions for the stored shots, one bit per line, for the testbench to check against."""

import pathlib
import sys

import stim

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "host" / "lib"))
sys.path.insert(0, str(ROOT / "host" / "freeze"))

from generate import DATA, read_ascii
from hw_model import HWModel
from unionfind_hw import UnionFindHW


def write_bits(path, bits):
    path.write_text("".join(f"{int(b)}\n" for b in bits))


def main():
    dets = read_ascii(DATA / "detectors.txt")
    truth = read_ascii(DATA / "observables.txt")[:, 0]
    union_find = UnionFindHW(stim.DetectorErrorModel.from_file(DATA / "model.dem")).decode_batch(dets)
    weightless = HWModel(ROOT / "results" / "dwn-d3-p0.005.json").decode_batch(dets)
    write_bits(DATA / "union_find_expected.txt", union_find)
    write_bits(DATA / "weightless_expected.txt", weightless)
    print(f"shots        {len(dets)}")
    print(f"union-find   {int((union_find != truth).sum())} errors")
    print(f"weightless   {int((weightless != truth).sum())} errors")


if __name__ == "__main__":
    main()
