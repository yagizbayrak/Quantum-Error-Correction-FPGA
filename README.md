# Quantum Error Correction FPGA

Three decoders for a distance-3 rotated surface code, side by side on one Artix-7
behind a syndrome frontend: Union-Find, a weightless neural network and a recurrent
neural network. Each one is scored against minimum-weight perfect matching
(PyMatching) on identical shots. **The weightless network makes 10.2 % fewer logical
errors than minimum-weight perfect matching (+28.4σ), in 636 LUTs, with no
multipliers, answering in 21 ns.**

## What this is

**Quantum error correction.** Physical qubits pick up errors all the time. Quantum
error correction stores one logical qubit across many physical qubits so those
errors can be found and undone. Here that is the distance-3 rotated surface code:
9 data qubits hold the logical qubit and 8 ancilla qubits sit between them. Every
round, each ancilla measures a parity check on its neighbouring data qubits, which
reveals errors without reading out the stored state. A check whose result changes
between rounds is a detection event.

**Decoding.** Detection events show where errors happened, not which errors. The
decoder turns the pattern of detection events into one decision: did the errors
flip the logical qubit? It has to answer while the quantum computer keeps running,
which is why it is built in hardware.

**The FPGA's role.** In a real system it sits next to the quantum computer's
control electronics, takes the raw measurements as they arrive and returns that
decision. Here the measurements come from Stim simulations.

| | Signal | Width | When |
| --- | --- | --- | --- |
| In | `round` | 8 bits, one per ancilla | once per round, 3 rounds |
| In | `data` | 9 bits, one per data qubit | once, after the last round |
| Internal | `det` | 24 detection events | from the syndrome frontend, once all measurements are in |
| Out | `union_find_flip`, `weightless_flip`, `recurrent_flip` | 1 bit each | when each decoder finishes; 1 means the logical qubit was flipped, so its readout is inverted |

Every input and output has its own valid signal.

## Target device: AMD Artix-7 100T

| Resource | Available |
| --- | --- |
| Part | xc7a100tcsg324-1 |
| LUTs | 63,400 |
| Flip-flops | 126,800 |
| DSP48E1 | 240 |
| Block RAM tiles | 135 |

## The code

| Quantity | Value |
| --- | --- |
| Circuit | Stim `surface_code:rotated_memory_z` |
| Distance, rounds | 3, 3 |
| Noise | circuit-level, p = 0.005 on all four Stim noise parameters |
| Measurements per shot | 33 (8 ancillas × 3 rounds, 9 data qubits) |
| Detectors | 24, in four layers of 4 / 8 / 8 / 4 |
| Output | 1 bit: was the logical observable flipped |

There is no idle noise, so this is quieter than the SD6 model used in some papers.
Every claim here is against PyMatching on the same shots.

## Decoders

| Module | Does | Size |
| --- | --- | --- |
| `syndrome_frontend` | Holds the previous round's ancilla outcomes and forms the 24 detection events from raw measurements | 19 LUT, 35 FF |
| `union_find_decoder` | Hand-written Union-Find over a 25-node, 78-edge decoding graph | 2,393 LUT, 734 FF |
| `dwn_decoder` | Generated weightless network, 1696 six-input lookup tables | 636 LUT, 619 FF |
| `recurrent_decoder` | 32-unit LSTM generated through hls4ml | 18,005 LUT, 31,366 FF, 177 DSP, 44.5 BRAM |
| `qec_decoder` | Top level, the frontend feeding all three decoders | |

**Union-Find** is a four-state machine. `GROW` extends every cluster edge in one
cycle, `MERGE` joins one fully grown edge per cycle over a flat root table, `BFS`
builds a spanning forest one child per cycle, and `PEEL` walks it backwards to one
flip bit. Growth is unweighted and capped at 10 iterations, which bounds a decode
at 167 cycles: 1 load, 11 grow, 78 merge, 51 BFS and 26 peel.

**The weightless network** is 1024 → 512 → 128 → 32 six-input lookup-table nodes,
trained with learnable mapping. The last 32 bits split into two groups of 16; the
observable is flipped if the upper group has the higher popcount, and a tie reads
as no flip. Only 643 of the 1696 tables reach the output, and synthesis prunes the
rest.

**The recurrent network** replicates Yang et al.: one LSTM layer, 32 units, 6-bit
weights. The detection events go in as four timesteps of 8 inputs, and absent
inputs read as −1. hls4ml turns it into 14-bit fixed point (7 fraction bits,
rounding, 1024-entry activation tables). The Latency strategy needs 896 DSPs, so
it is built with the Resource strategy at reuse factor 64, which needs 177 of
the 240.

## Accuracy

2,000,000 shots, seed 31, the same shots for every decoder. The rate is the
per-shot probability that the output bit is wrong over the 3-round window. σ is
McNemar's test on the shots where exactly one of the two decoders is wrong.

| Decoder | Logical error rate | vs PyMatching | Only this wrong / only PyMatching wrong | σ |
| --- | --- | --- | --- | --- |
| PyMatching | 0.01710 | | | |
| **Weightless** | **0.01535** | **−10.2 %** | 5,876 / 9,387 | **+28.4** |
| Recurrent, as trained | 0.01591 | −7.0 % | 7,273 / 9,661 | +18.4 |
| Recurrent, fixed point as built | 0.01589 | −7.1 % | 7,138 / 9,574 | +18.8 |
| Union-Find (hardware model) | 0.02148 | +25.6 % | 13,426 / 4,674 | −65.1 |

Fixed point costs nothing measurable (0.01589 against 0.01591).

## Hardware results

Vivado 2026.1, out of context, placed and routed. Each core is closed at its own
clock and the whole design at one shared clock, all with positive setup and hold
slack. Latency is from the input being valid to the flip bit being valid, at that
clock.

| Core | LUT | FF | DSP | BRAM | Clock | Latency |
| --- | --- | --- | --- | --- | --- | --- |
| Frontend | 19 | 35 | 0 | 0 | 250 MHz (4.0 ns) | 1 cycle |
| Union-Find | 2,393 | 734 | 0 | 0 | 62.5 MHz (16.0 ns) | 18.9 cycles mean (302 ns), 167 bound (2.67 µs) |
| **Weightless** | **636** | **619** | **0** | **0** | **238 MHz (4.2 ns)** | **5 cycles (21 ns)** |
| Recurrent | 18,005 | 31,366 | 177 | 44.5 | 111 MHz (9.0 ns) | 482 cycles (4.34 µs) |
| **All together** | **20,991 (33 %)** | **32,750 (26 %)** | **177 (74 %)** | **44.5 (33 %)** | **58.8 MHz (17.0 ns)** | |

In context:

- **Weightless.** 21 ns is below Yang's 124 ns neural-network decoding latency
  (at 250 MHz on a Kintex-7 XC7K410T) and below the lookup-table decoder LILLIPUT's
  29 to 42 ns.
- **Recurrent.** 4.34 µs is about 35× slower than Yang for the same kind of network.
  Yang parallelises the matrix products on DSP blocks; the Artix-7's 240 DSPs force
  every multiplier here to be shared 64 times. HLS reports that the 28-bit add in
  its shared multiply-accumulate cannot meet the clock.
- **Union-Find.** The clock is below Helios's (100 MHz for most experiments,
  75 MHz at d = 17). The critical path is one full BFS step: queue read, a pick
  among 78 edges, neighbour lookup and queue write, 71 % of it routing.

The commonly used real-time budget for superconducting qubits is 1 µs per round
(Battistel et al.), about 3 µs for this 3-round window.

## Verification

Every decoder has a golden model, and every RTL result is checked bit for bit
against it.

| Decoder | Golden model | Checked |
| --- | --- | --- |
| Union-Find | `host/freeze/unionfind_hw.py`, fixed-width integer | Agrees with `host/lib/unionfind.py` on 100k shots. RTL: 0 mismatches over 200k shots at p = 0.005, 20k each at p = 0.01, 0.02, 0.04 and 0.1, and 30k dense random syndromes |
| Weightless | `host/freeze/hw_model.py`, pure integer | Agrees with PyTorch on 200k shots. Generated RTL: 0 mismatches over 5,000 vectors |
| Recurrent | hls4ml's compiled C++ | 522 disagreements with the network in 2M shots |

`tb/tb_qec_decoder.sv` replays the 10k stored shots as raw measurements through the
frontend and all three decoders together:

| 10k stored shots | Mismatches | Logical errors |
| --- | --- | --- |
| Frontend | 0 | |
| Union-Find | 0 | 217 |
| Weightless | 0 | 179 |
| Recurrent | 0 | 182 |

`tb/show.py` replays the trace slowly in the terminal: the detection events laid out
by stabiliser position, each decoder's guess, and the truth.

## Running

Data, training and freezing. Training needs a CUDA GPU:

```sh
python host/lib/generate.py
python host/train/train_dwn.py
python host/train/train_lstm.py
python host/freeze/export.py results/dwn-d3-p0.005.pt
```

RTL generation. The recurrent step needs Vitis HLS reachable as `vitis-run`:

```sh
python rtl/frontend/generate_rtl.py data/circuit.stim
python rtl/union_find/generate_rtl.py data/model.dem
python rtl/dwn/generate_rtl.py results/dwn-d3-p0.005.json
python rtl/recurrent/generate_rtl.py results/recurrent-d3-p0.005-standard-6bit.pt
python tb/expected.py
```

Simulation, from the repository root:

```sh
verilator --binary --timing -Wno-fatal -Wno-lint -Wno-style -Irtl/union_find -Irtl/frontend -Irtl/dwn/generated -Irtl/recurrent --Mdir build/sim --top-module tb_qec_decoder -j 8 tb/tb_qec_decoder.sv rtl/qec_decoder.sv rtl/frontend/syndrome_frontend.sv rtl/union_find/union_find_decoder.sv rtl/dwn/*.sv rtl/dwn/generated/*.sv rtl/recurrent/recurrent_decoder.sv rtl/recurrent/generated/*.v
build/sim/Vtb_qec_decoder
python tb/show.py
```

Synthesis, one core at a time (`syndrome_frontend`, `union_find_decoder`,
`dwn_decoder` or `recurrent_decoder`) or the whole design (`qec_decoder`):

```sh
vivado -mode batch -source synth/synth.tcl -tclargs union_find_decoder
```

Reports land in `synth/reports/`.

## Toolchain

| Stage | Tool |
| --- | --- |
| Circuits and sampling | Stim |
| Baseline | PyMatching |
| Weightless training | PyTorch + `torch-dwn` (CUDA) |
| Recurrent training | PyTorch (CUDA) |
| Recurrent RTL | Keras + hls4ml 1.3.0, Vitis HLS 2026.1 |
| Simulation | Verilator 5 |
| Synthesis, place and route | Vivado 2026.1 |

## References

1. **Yang et al.**, *Real-time Surface-Code Error Correction Using an FPGA-based
   Neural-Network Decoder*, arXiv:2605.04892: the recurrent network replicated here.
2. **Bacellar et al.**, *Differentiable Weightless Neural Networks*, ICML 2024
   (PMLR 235): the weightless network.
3. **Higgott and Gidney**, *Sparse Blossom: correcting a million errors per core
   second with minimum-weight matching*, arXiv:2303.15933: PyMatching, the baseline.
4. **Liyanage et al.**, *FPGA-based Distributed Union-Find Decoder for Surface
   Codes*, arXiv:2406.08491: Helios.
5. **Das et al.**, *LILLIPUT: A Lightweight Low-Latency Lookup-Table Based Decoder
   for Near-term Quantum Error Correction*, arXiv:2108.06569.
6. **Battistel et al.**, *Real-Time Decoding for Fault-Tolerant Quantum Computing:
   Progress, Challenges and Outlook*, arXiv:2303.00054.
