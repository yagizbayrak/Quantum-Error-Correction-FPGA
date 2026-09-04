"""Pure-integer weightless decoder read from an exported model: the golden reference the RTL must match bit for bit."""

import json

import numpy as np


class HWModel:
    def __init__(self, path):
        with open(path) as f:
            model = json.load(f)
        self.meta = model["meta"]
        self.group = self.meta["group_size"]
        self.layers = [
            (np.asarray(l["mapping"], dtype=np.int64), np.asarray(l["luts"], dtype=np.uint8))
            for l in model["layers"]
        ]
        self.weight = 1 << np.arange(self.meta["n"], dtype=np.int64)

    def live(self):
        reach = [None] * len(self.layers)
        reach[-1] = set(range(len(self.layers[-1][0])))
        for i in range(len(self.layers) - 1, 0, -1):
            reach[i - 1] = {int(v) for j in reach[i] for v in self.layers[i][0][j]}
        return [len(s) for s in reach]

    def decode(self, dets):
        x = np.asarray(dets, dtype=np.uint8)
        for mapping, luts in self.layers:
            addr = np.zeros((len(x), len(mapping)), dtype=np.int64)
            for k in range(mapping.shape[1]):
                addr |= x[:, mapping[:, k]].astype(np.int64) << k
            x = luts[np.arange(len(mapping))[None, :], addr]
        counts = x.astype(np.int64)
        return counts[:, self.group :].sum(1) > counts[:, : self.group].sum(1)

    def decode_batch(self, dets, chunk=16384):
        return np.concatenate([self.decode(dets[i : i + chunk]) for i in range(0, len(dets), chunk)])


if __name__ == "__main__":
    import pathlib
    import sys

    import torch
    import torch_dwn as dwn

    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))
    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "train"))

    from generate import build_circuit
    from train_dwn import DEV, DISTANCE, FANIN, SEED, TAU, WIDTHS, predict

    export, checkpoint, noise, shots = sys.argv[1], sys.argv[2], float(sys.argv[3]), int(sys.argv[4])
    hw = HWModel(export)

    prev, modules = hw.meta["input_size"], []
    for width in WIDTHS:
        modules.append(dwn.LUTLayer(prev, width, n=FANIN, mapping="learnable"))
        prev = width
    reference = torch.nn.Sequential(*modules, dwn.GroupSum(2, tau=TAU)).to(DEV)
    reference.load_state_dict(torch.load(checkpoint, map_location=DEV))
    reference.eval()

    circuit = build_circuit(DISTANCE, DISTANCE, noise)
    dets, truth = circuit.compile_detector_sampler(seed=SEED).sample(shots, separate_observables=True)
    torch_prediction = predict(reference, torch.tensor(dets, dtype=torch.float32, device=DEV))
    frozen = hw.decode_batch(dets)

    print(f"shots        {shots}")
    print(f"mismatches   {int((frozen != torch_prediction).sum())}")
    print(f"torch  rate  {(torch_prediction != truth[:, 0]).mean():.5f}")
    print(f"frozen rate  {(frozen != truth[:, 0]).mean():.5f}")
    print(f"lut nodes    {sum(hw.meta['layer_sizes'])} total, {sum(hw.live())} reach the output {hw.live()}")
