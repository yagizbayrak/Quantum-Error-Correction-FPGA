"""Decodes the stored shots with PyMatching and writes its per-shot predictions as the reference every other decoder is compared against."""

import pathlib
import sys

import pymatching
import stim

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))

from generate import DATA, read_ascii, write_ascii


def main():
    dets = read_ascii(DATA / "detectors.txt")
    truth = read_ascii(DATA / "observables.txt")
    matcher = pymatching.Matching.from_detector_error_model(
        stim.DetectorErrorModel.from_file(DATA / "model.dem")
    )

    pred = matcher.decode_batch(dets).astype(bool)
    with open(DATA / "predictions.txt", "wb") as f:
        write_ascii(f, pred)

    errors = (pred[:, 0] != truth[:, 0]).sum()
    print(f"shots        {len(truth)}")
    print(f"lit shots    {dets.any(axis=1).sum()}")
    print(f"errors       {errors}")
    print(f"rate         {errors / len(truth):.6f}")


if __name__ == "__main__":
    main()
