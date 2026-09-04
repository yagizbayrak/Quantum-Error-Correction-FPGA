"""Reduces a trained weightless checkpoint to the fixed wiring and truth tables inference actually needs."""

import argparse
import json
import pathlib

import torch


def layer_indices(sd):
    return sorted(int(k.split(".", 1)[0]) for k in sd if k.endswith(".luts"))


def main():
    parser = argparse.ArgumentParser(description="Export a weightless checkpoint to JSON")
    parser.add_argument("checkpoint", type=pathlib.Path)
    parser.add_argument("-o", "--out", type=pathlib.Path)
    args = parser.parse_args()

    sd = torch.load(args.checkpoint, map_location="cpu")
    indices = layer_indices(sd)

    layers, sizes = [], []
    for i in indices:
        luts = (sd[f"{i}.luts"] > 0).to(torch.int64)
        num_luts, table = luts.shape
        n = table.bit_length() - 1
        assert 1 << n == table, f"layer {i}: table {table} is not a power of two"
        mapping = sd[f"{i}.mapping.weights"].argmax(dim=0).reshape(num_luts, n)
        layers.append({"mapping": mapping.tolist(), "luts": luts.tolist()})
        sizes.append(num_luts)

    assert sizes[-1] % 2 == 0, f"final layer {sizes[-1]} does not split into two groups"
    model = {
        "meta": {
            "checkpoint": args.checkpoint.name,
            "input_size": sd[f"{indices[0]}.mapping.weights"].size(0),
            "n": n,
            "group_size": sizes[-1] // 2,
            "layer_sizes": sizes,
            "address_order": "little_endian (pin k -> weight 2**k)",
        },
        "layers": layers,
    }

    out = args.out or args.checkpoint.with_suffix(".json")
    out.write_text(json.dumps(model))
    print(f"{out}  input {model['meta']['input_size']}, n {n}, layers {sizes}")


if __name__ == "__main__":
    main()
