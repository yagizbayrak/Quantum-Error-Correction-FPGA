"""Builds the surface code circuit, its decoding graph, and the sampled shots."""

import pathlib

import numpy as np
import stim

DISTANCE = 7
ROUNDS = 7
NOISE = 0.001
SHOTS = 10_000
CHUNK = 100_000
SEED = 1234

DATA = pathlib.Path(__file__).resolve().parents[2] / "data"


def build_circuit(distance, rounds, noise):
    return stim.Circuit.generated(
        "surface_code:rotated_memory_z",
        distance=distance,
        rounds=rounds,
        after_clifford_depolarization=noise,
        before_round_data_depolarization=noise,
        before_measure_flip_probability=noise,
        after_reset_flip_probability=noise,
    )


def write_ascii(handle, bits):
    out = np.full((bits.shape[0], bits.shape[1] + 1), ord("\n"), dtype=np.uint8)
    out[:, :-1] = np.where(bits, ord("1"), ord("0"))
    out.tofile(handle)


def read_ascii(path):
    lines = open(path, "rb").read().split(b"\n")[:-1]
    flat = np.frombuffer(b"".join(lines), dtype=np.uint8) - ord("0")
    return flat.reshape(len(lines), -1).astype(bool)


def sample(circuit, shots, det_path, obs_path):
    sampler = circuit.compile_detector_sampler(seed=SEED)
    lit = 0
    with open(det_path, "wb") as det, open(obs_path, "wb") as obs:
        remaining = shots
        while remaining:
            n = min(CHUNK, remaining)
            dets, truth = sampler.sample(n, separate_observables=True)
            write_ascii(det, dets)
            write_ascii(obs, truth)
            lit += dets.sum()
            remaining -= n
    return lit / (shots * circuit.num_detectors)


def main():
    DATA.mkdir(exist_ok=True)
    circuit = build_circuit(DISTANCE, ROUNDS, NOISE)
    model = circuit.detector_error_model(decompose_errors=True)

    circuit.to_file(DATA / "circuit.stim")
    model.to_file(DATA / "model.dem")
    density = sample(circuit, SHOTS, DATA / "detectors.txt", DATA / "observables.txt")

    print(f"qubits       {circuit.num_qubits}")
    print(f"detectors    {circuit.num_detectors}")
    print(f"observables  {circuit.num_observables}")
    print(f"shots        {SHOTS}")
    print(f"lit fraction {density:.4f}")


if __name__ == "__main__":
    main()
