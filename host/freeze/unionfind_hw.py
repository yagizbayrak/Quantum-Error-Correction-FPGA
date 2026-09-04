"""Fixed-width integer Union-Find over a static decoding graph: the golden reference the hand-written RTL must match."""

import numpy as np

MAX_ITERATIONS = 10
FULLY_GROWN = 2


class UnionFindHW:
    def __init__(self, dem):
        self.boundary = dem.num_detectors
        self.nodes = dem.num_detectors + 1
        edges, observable = {}, {}
        for instruction in dem.flattened():
            if instruction.type != "error":
                continue
            dets, obs = [], False
            for target in list(instruction.targets_copy()) + [None]:
                if target is None or target.is_separator():
                    if dets:
                        u = dets[0]
                        v = dets[1] if len(dets) == 2 else self.boundary
                        key = (min(u, v), max(u, v))
                        edges[key] = len(edges) if key not in edges else edges[key]
                        observable[key] = obs
                    dets, obs = [], False
                elif target.is_relative_detector_id():
                    dets.append(target.val)
                elif target.is_logical_observable_id():
                    obs = True

        keys = sorted(edges, key=edges.get)
        self.edge_ends = np.array(keys, dtype=np.int8)
        self.edge_obs = np.array([observable[k] for k in keys], dtype=np.uint8)
        self.incident = [
            np.flatnonzero((self.edge_ends == v).any(axis=1)).astype(np.int16)
            for v in range(self.nodes)
        ]
        self.node_bits = max(1, (self.nodes - 1).bit_length())
        self.edge_bits = max(1, (len(keys) - 1).bit_length())

    def find(self, parent, node):
        while parent[node] != node:
            parent[node] = parent[parent[node]]
            node = parent[node]
        return node

    def decode(self, syndrome):
        parent = np.arange(self.nodes, dtype=np.int8)
        defect = np.zeros(self.nodes, dtype=np.uint8)
        defect[: len(syndrome)] = syndrome
        parity = defect.copy()
        touches = np.zeros(self.nodes, dtype=np.uint8)
        touches[self.boundary] = 1
        growth = np.zeros(len(self.edge_ends), dtype=np.uint8)
        grown = np.zeros(len(self.edge_ends), dtype=np.uint8)

        iterations = 0
        while iterations < MAX_ITERATIONS:
            roots = {
                int(self.find(parent, v))
                for v in range(self.nodes)
                if defect[v] or parent[v] != v
            }
            active = [r for r in roots if parity[r] and not touches[r]]
            if not active:
                break
            iterations += 1

            bump = np.zeros(len(growth), dtype=np.uint8)
            for root in active:
                members = [v for v in range(self.nodes) if self.find(parent, v) == root]
                edges = np.unique(np.concatenate([self.incident[v] for v in members]))
                bump[edges[grown[edges] == 0]] += 1
            growth += bump

            for edge in np.flatnonzero((growth >= FULLY_GROWN) & (grown == 0)):
                grown[edge] = 1
                u, v = (int(x) for x in self.edge_ends[edge])
                ru, rv = self.find(parent, u), self.find(parent, v)
                if ru == rv:
                    continue
                parent[rv] = ru
                parity[ru] ^= parity[rv]
                touches[ru] |= touches[rv]
                parity[rv] = 0

        return self.peel(defect, grown)

    def peel(self, defect, grown):
        tree = [[] for _ in range(self.nodes)]
        for edge in np.flatnonzero(grown):
            u, v = (int(x) for x in self.edge_ends[edge])
            tree[u].append((v, int(edge)))
            tree[v].append((u, int(edge)))

        defect = defect.copy()
        seen = np.zeros(self.nodes, dtype=np.uint8)
        parent_edge = [None] * self.nodes
        order = []
        for start in [self.boundary] + list(range(self.nodes)):
            if seen[start] or not tree[start]:
                continue
            seen[start] = 1
            queue = [start]
            while queue:
                node = queue.pop(0)
                order.append(node)
                for neighbour, edge in tree[node]:
                    if not seen[neighbour]:
                        seen[neighbour] = 1
                        parent_edge[neighbour] = (node, edge)
                        queue.append(neighbour)

        flip = 0
        for node in reversed(order):
            if defect[node] and parent_edge[node] is not None:
                up, edge = parent_edge[node]
                flip ^= int(self.edge_obs[edge])
                defect[node] = 0
                defect[up] ^= 1
        return bool(flip)

    def decode_batch(self, dets):
        return np.array([self.decode(s) for s in dets], dtype=bool)


if __name__ == "__main__":
    import pathlib
    import sys

    import pymatching
    import stim

    sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "lib"))
    from generate import DATA, read_ascii
    from unionfind import UnionFind

    dem = stim.DetectorErrorModel.from_file(DATA / "model.dem")
    hw = UnionFindHW(dem)
    dets = read_ascii(DATA / "detectors.txt")
    truth = read_ascii(DATA / "observables.txt")[:, 0]

    frozen = hw.decode_batch(dets)
    reference = UnionFind(dem).decode_batch(dets)
    mwpm = pymatching.Matching.from_detector_error_model(dem).decode_batch(dets)[:, 0].astype(bool)

    print(f"graph        {hw.nodes} nodes, {len(hw.edge_ends)} edges")
    print(f"widths       node id {hw.node_bits} bits, edge id {hw.edge_bits} bits, growth 2 bits")
    print(f"iteration    cap {MAX_ITERATIONS}")
    print(f"shots        {len(truth)}")
    print(f"vs python    {int((frozen != reference).sum())} disagreements")
    print(f"integer      {int((frozen != truth).sum())} errors")
    print(f"pymatching   {int((mwpm != truth).sum())} errors")
