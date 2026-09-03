"""Locates the results folder, scores a decoder against a baseline on identical shots, and appends one row per run."""

import csv
import pathlib

RESULTS = pathlib.Path(__file__).resolve().parents[2] / "results"
RESULTS.mkdir(exist_ok=True)
COLUMNS = [
    "decoder",
    "distance",
    "p",
    "shots",
    "seed",
    "config",
    "float_rate",
    "quantized_rate",
    "pymatching",
    "decoder_only_wrong",
    "mwpm_only_wrong",
    "sigma",
]


def record(**row):
    path = RESULTS / "decoders.csv"
    fresh = not path.exists()
    with open(path, "a", newline="") as f:
        writer = csv.DictWriter(f, COLUMNS)
        if fresh:
            writer.writeheader()
        writer.writerow(row)


def mcnemar(decoder, baseline, truth):
    missed = decoder != truth
    baseline_missed = baseline != truth
    only_decoder = int((missed & ~baseline_missed).sum())
    only_baseline = int((~missed & baseline_missed).sum())
    total = only_decoder + only_baseline
    return only_decoder, only_baseline, (only_baseline - only_decoder) / total**0.5 if total else 0.0
