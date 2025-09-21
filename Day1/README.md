
# Day 1 — RTL Design & Simulation

**Goal:**  
Learn basic Verilog RTL design; write a simple design + testbench; simulate and inspect waveform.  

---

## Topics covered

- Verilog modules, ports, wires, regs  
- Testbenches  
- Simulation using Icarus Verilog or any other simulator  

---

## Files in this folder

| Name | Purpose |
|------|---------|
| `code/top.v` | The main design module (e.g. simple ALU / adder / state machine) |
| `code/tb_top.v` | The testbench for `top.v` |
| `scripts/run_sim.sh` | Script to run simulation + produce waveform |
| `Makefile` | Build targets: `make sim`, `make clean` |
| `results/` | Output waveforms / log files |

---

## Commands

```bash
# simulate
cd Day1
./scripts/run_sim.sh

# or via Makefile
make sim
