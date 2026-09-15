"""Replays the testbench trace slowly in the terminal: each shot's detection events laid out by stabiliser position, every decoder's guess, and the truth."""

import pathlib
import time

import stim

ROOT = pathlib.Path(__file__).resolve().parents[1]
DELAY = 0.6
LIT = "●"
QUIET = "○"


def layout():
    coords = stim.Circuit.from_file(ROOT / "data" / "circuit.stim").get_detector_coordinates()
    return {i: (int(c[2]), int(c[1]) // 2, int(c[0]) // 2) for i, c in coords.items()}


def draw(shot, bits, guesses, truth, places):
    grids = [[[" "] * 4 for _ in range(4)] for _ in range(4)]
    for i, (layer, row, col) in places.items():
        grids[layer][row][col] = LIT if bits[i] == "1" else QUIET
    lines = [f"shot {shot}", "", "  ".join(f"layer {k}  " for k in range(4))]
    for row in range(4):
        lines.append("  ".join(" ".join(grids[k][row]) + " " * 2 for k in range(4)))
    lines.append("")
    for name, guess in zip(("union-find", "weightless", "recurrent"), guesses):
        lines.append(f"{name} {guess} {'right' if guess == truth else 'WRONG'}")
    lines.append(f"truth {truth}")
    print("\033[2J\033[H" + "\n".join(lines), flush=True)


def main():
    places = layout()
    for line in open(ROOT / "data" / "trace.txt"):
        shot, det, union_find, weightless, recurrent, truth = line.split()
        bits = det[::-1]
        if "1" not in bits:
            continue
        draw(shot, bits, (union_find, weightless, recurrent), truth, places)
        time.sleep(DELAY)


if __name__ == "__main__":
    main()
