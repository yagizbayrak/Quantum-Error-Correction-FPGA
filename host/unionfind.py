"""Unweighted Union-Find decoder: grows clusters until every lit detector has a partner, then peels the spanning forest to a single logical bit."""

import collections

import numpy as np
import stim

from generate import DATA


def build_graph(dem):
    boundary = dem.num_detectors
    edges = {}
    for inst in dem.flattened():
        if inst.type != "error":
            continue
        dets, obs = [], False
        for t in list(inst.targets_copy()) + [None]:
            if t is None or t.is_separator():
                if dets:
                    u = dets[0]
                    v = dets[1] if len(dets) == 2 else boundary
                    edges[(min(u, v), max(u, v))] = obs
                dets, obs = [], False
            elif t.is_relative_detector_id():
                dets.append(t.val)
            elif t.is_logical_observable_id():
                obs = True

    keys = list(edges)
    adj = collections.defaultdict(list)
    for i, (u, v) in enumerate(keys):
        adj[u].append((v, i))
        adj[v].append((u, i))
    return adj, keys, np.array([edges[k] for k in keys], dtype=bool), boundary


class UnionFind:
    def __init__(self, dem):
        self.adj, self.keys, self.obs, self.boundary = build_graph(dem)

    def decode(self, syndrome):
        lit = np.flatnonzero(syndrome)
        if len(lit) == 0:
            return False

        root = {int(v): int(v) for v in lit}
        odd = {int(v): True for v in lit}
        members = {int(v): [int(v)] for v in lit}
        border = {int(v): [e for _, e in self.adj[v]] for v in lit}
        growth = collections.Counter()

        def find(x):
            while root[x] != x:
                root[x] = root[root[x]]
                x = root[x]
            return x

        fully_grown = set()
        while True:
            active = [r for r in odd if odd[r] and root[r] == r]
            if not active:
                break
            fused = []
            for r in active:
                keep = []
                for e in border[r]:
                    if e in fully_grown:
                        continue
                    growth[e] += 1
                    if growth[e] >= 2:
                        fully_grown.add(e)
                        fused.append(e)
                    else:
                        keep.append(e)
                border[r] = keep

            for e in fused:
                u, v = self.keys[e]
                for node in (u, v):
                    if node not in root:
                        root[node] = node
                        odd[node] = False
                        members[node] = [node]
                        border[node] = [x for _, x in self.adj[node]] if node != self.boundary else []
                ru, rv = find(u), find(v)
                if ru == rv:
                    continue
                if len(members[ru]) < len(members[rv]):
                    ru, rv = rv, ru
                root[rv] = ru
                members[ru] += members[rv]
                border[ru] += border[rv]
                odd[ru] = odd[ru] ^ odd[rv]
                if self.boundary in (u, v) or self.boundary in members[ru]:
                    odd[ru] = False
                odd[rv] = False

        return self.peel(lit, fully_grown)

    def peel(self, lit, fully_grown):
        tree = collections.defaultdict(list)
        for e in fully_grown:
            u, v = self.keys[e]
            tree[u].append((v, e))
            tree[v].append((u, e))

        defect = {int(v): True for v in lit}
        flip = False
        seen, order, parent = set(), [], {}
        starts = ([self.boundary] if self.boundary in tree else []) + list(tree)
        for start in starts:
            if start in seen:
                continue
            seen.add(start)
            queue = [start]
            parent[start] = None
            while queue:
                u = queue.pop(0)
                order.append(u)
                for v, e in tree[u]:
                    if v not in seen:
                        seen.add(v)
                        parent[v] = (u, e)
                        queue.append(v)

        for u in reversed(order):
            if defect.get(u) and parent[u] is not None:
                p, e = parent[u]
                flip ^= bool(self.obs[e])
                defect[u] = False
                defect[p] = not defect.get(p, False)
        return flip

    def decode_batch(self, dets):
        return np.array([self.decode(s) for s in dets], dtype=bool)


if __name__ == "__main__":
    import sys, time, pymatching
    from generate import read_ascii

    dem = stim.DetectorErrorModel.from_file(DATA / "model.dem")
    uf = UnionFind(dem)
    mwpm = pymatching.Matching.from_detector_error_model(dem)

    dets = read_ascii(DATA / "detectors.txt")
    truth = read_ascii(DATA / "observables.txt")[:, 0]
    t0 = time.time()
    pred = uf.decode_batch(dets)
    ref = mwpm.decode_batch(dets)[:, 0].astype(bool)
    print(f"shots        {len(truth)}   ({len(truth)/(time.time()-t0):.0f} shots/s)")
    print(f"union-find   {(pred != truth).sum()} errors")
    print(f"pymatching   {(ref != truth).sum()} errors")
    print(f"disagree     {(pred != ref).sum()}")
