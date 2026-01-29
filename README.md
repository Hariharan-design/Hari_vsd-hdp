🏆 #IIT Gandhinagar – VSD RISC-V SoC Tapeout Program

<img width="300" height="300" alt="image" src="https://github.com/user-attachments/assets/799c16ad-9e69-4c35-8e1e-2be1aaeaadb3" />


🚀 Overview

A silicon-proven, open-source SoC design journey where I learned the complete RTL-to-GDS flow on Sky130 PDK, starting from Verilog RTL, simulation, synthesis, optimizations, GLS, and tapeout methodologies.
This program by VSD and IIIT Gandhinagar gave me hands-on exposure to industry-grade open-source EDA tools and real fabrication-ready workflows.

🔧 Tools & Technologies Used


<img height="28" src="https://img.shields.io/badge/Icarus%20Verilog-FF4500?logo=verilog&logoColor=white"> <img height="28" src="https://img.shields.io/badge/GtkWave-4B8BBE?logo=waveform&logoColor=white"> <img height="28" src="https://img.shields.io/badge/Yosys-FFD700?logo=logic&logoColor=black"> <img height="28" src="https://img.shields.io/badge/OpenSTA-1E90FF?logo=timing&logoColor=white"> <img height="28" src="https://img.shields.io/badge/OpenROAD-228B22?logo=flow&logoColor=white"> <img height="28" src="https://img.shields.io/badge/Magic%20VLSI-6A0DAD?logo=magic&logoColor=white"> <img height="28" src="https://img.shields.io/badge/KLayout-FF0000?logo=layout&logoColor=white"> <img height="28" src="https://img.shields.io/badge/OpenLane-007ACC?logo=eda&logoColor=white"> <img height="28" src="https://img.shields.io/badge/SKY130%20PDK-FF6600?logo=chip&logoColor=white">


📚 Key Concepts Learned

📐 Verilog RTL Design & Simulation

RTL coding best practices (blocking vs non-blocking, sensitivity lists)

Writing testbenches with Icarus Verilog

Waveform analysis & debugging with GTKWave

⚙️ Logic Synthesis & Mapping

RTL → Gate-level mapping using Yosys

Flat vs Hierarchical synthesis

Timing-aware synthesis using Sky130 standard cells

⏱ Timing & Libraries

Understanding .lib files (TT, SS, FF)

Setup, hold, and timing arcs with OpenSTA

Effect of timing constraints on synthesis

🔄 Optimizations

Combinational optimizations → boolean simplification, dead logic removal

Sequential optimizations → retiming, removal of unused flops

Power–delay–area trade-offs with different coding styles

🧩 Simulation Mismatches & GLS

Gate-level simulation with back-annotated netlists

Debugging simulation-synthesis mismatches

Blocking vs Non-blocking pitfalls

🏭 RTL to GDSII Flow

Placement & routing with OpenROAD/OpenLane

Layout vs schematic (LVS) checks with Magic + Netgen

DRC, parasitic extraction, and timing closure

Tapeout preparation (Sky130 PDK signoff flow)

🧪 Lab Work Done

Verilog RTL Labs → designed good_mux, counters, flops with proper coding styles

Yosys Synthesis Labs → synthesized mux, flops, if/case constructs

Timing Labs → analyzed .lib, TT/SS/FF timing variations

Optimization Labs → experimented with combinational + sequential optimizations

GLS Labs → verified gate-level netlists and mismatches

RTL-GDS Flow Labs → ran OpenLane flow on synthesized blocks, viewed layouts in Magic/KLayout



📝 Projects & Contributions

RTL & GLS Verification → clean Verilog + gate-level validated designs

Synthesis Reports → timing, area, and power comparisons

Optimization Studies → coding styles impact on synthesis results

RTL-to-GDSII Demo → complete flow on Sky130 using OpenLane

# RISC-V Tapeout SoC by VSD and IIT Gandhinagar

**Program:** RISC-V Reference SoC Tapeout Program  
**Organized by:** VSD & IIT Gandhinagar  

---

## Table of Contents  
- [About](#about)  
- [Day 1 - Introduction to Verilog RTL Design and Synthesis](#day-1---introduction-to-verilog-rtl-design-and-synthesis)  
- [Day 2 - Timing libs, Hierarchical vs Flat Synthesis and Efficient Flop Coding Styles](#day-2---timing-libs-hierarchical-vs-flat-synthesis-and-efficient-flop-coding-styles)  
- [Day 3 - Combinational and Sequential Optimizations](#day-3---combinational-and-sequential-optimizations)  
- [Day 4 - GLS, Blocking vs Non-blocking and Synthesis-Simulation Mismatch](#day-4---gls-blocking-vs-non-blocking-and-synthesis-simulation-mismatch)  
- [Day 5 - Optimization in Synthesis](#day-5---optimization-in-synthesis)  

---

## About  
This repository captures my learning journey through the **RISC-V Reference SoC Tapeout Program** organized by **VSD & IIT Gandhinagar**, covering Verilog RTL design, synthesis, labs, and optimization techniques.  
Here I’ll document lecture notes, labs, examples, code, screenshots, and reflections as I move through each day.

---

# Day 1 - Introduction to Verilog RTL Design and Synthesis  

### 🔹 Introduction to Open-Source Simulator Iverilog  
- **2-SKY130RTL D1SK1 L1** → Introduction to Iverilog: Design & Testbench
  
  🔹 Simulator

Tool that mimics hardware behavior of HDL (Verilog/SystemVerilog) code.

Lets you check functionality before actual hardware implementation.

🔹 Design

Your RTL/Verilog/SystemVerilog code (the circuit you want to build).

Example: counter, ALU, FSM, etc.

🔹 Testbench

A verification code that stimulates the design with inputs.

Checks whether outputs match expected behavior.

Doesn’t synthesize → used only for simulation.

🔹 How Simulator Works

Compiles both design and testbench.

Executes testbench inputs on design.

Produces output + optional waveform data.

🔹 Icarus Verilog (iverilog) Simulation Flow

Write design + testbench.

Compile: iverilog -o sim_out design.v testbench.v

Run: vvp sim_out

Generate waveform (VCD): $dumpfile("wave.vcd"); $dumpvars; inside testbench.

🔹 VCD File (Value Change Dump)

File format storing signal transitions over time.

Generated during simulation for waveform viewing.

🔹 GTKWave

GUI tool to visualize VCD files.

Run: gtkwave wave.vcd

Lets you see signals, timing, glitches, and debug your logic.

  <img width="1913" height="999" alt="Screenshot 2025-09-27 165011" src="https://github.com/user-attachments/assets/64d378b6-740c-4bb4-a2ea-01bacf04fcc6" />

### 🔹 Labs using Iverilog and GTKWave  
- **3-SKY130RTL D1SK2 L1** → Lab1: Introduction to lab

Design And Testbench Of 2:1 Multiplexer (MUX) Using Iverilog & GTKWAVE

Circuit Function: A multiplexer selects one input from multiple inputs based on a control signal.

Working:

If sel = 0 → Output y = a

If sel = 1 → Output y = b

Use Case: Data selection, routing signals, implementing logic functions.

Simulation: Implemented in Verilog with a testbench; simulated using Icarus Verilog (iverilog) and waveform observed in GTKWave.

  <img width="1138" height="801" alt="Screenshot 2026-01-29 203202" src="https://github.com/user-attachments/assets/348e8148-e45c-4eb3-86be-9e4a2caf086b" />

- **4-SKY130RTL D1SK2 L2** → Lab2: Iverilog & GTKWave (Part 1)
  
  Commands Snapshot Of Implementation Of Commands To Run Mux Design
  
  <img width="1072" height="741" alt="Screenshot 2026-01-29 203602" src="https://github.com/user-attachments/assets/863c2d07-1e69-44e7-88dd-12f3d475d8d8" />

  Output Of Mux In GTKWAVE

  <img width="996" height="628" alt="Screenshot 2026-01-29 204147" src="https://github.com/user-attachments/assets/28f304b2-6acd-405b-b461-a57d3d7674ab" />


- **5-SKY130RTL D1SK2 L3** → Lab2: Iverilog & GTKWave (Part 2)
  
  Iverilog Code and Test Bench For Mux Design
  
  <img width="942" height="625" alt="Screenshot 2025-09-21 144627" src="https://github.com/user-attachments/assets/2ae8094b-d0b0-4f0a-af14-ebd7fc077907" />

### 🔹 Introduction to Yosys and Logic Synthesis  
- **6-SKY130RTL D1SK3 L1** → Introduction to Yosys
  Yosys

What it is: Open-source framework for RTL synthesis.

Use: Converts Verilog RTL code into a gate-level netlist.

Flow:

Read design (read_verilog)

Run synthesis (synth)

Map to standard cells (abc, dfflibmap)

Write output netlist (write_verilog)

Supports: FPGA flows + ASIC flows (like SKY130).

Why important: First step in RTL → GDSII design flow.

  <img width="1308" height="675" alt="image" src="https://github.com/user-attachments/assets/59dc3b02-59ea-4f82-aa6a-f727f8a0998a" />

🔹 Verifying Synthesis with Icarus Verilog & GTKWave

Step 1: Simulate RTL design with testbench → generate wave.vcd → check logic in GTKWave.

Step 2: Run synthesis in Yosys → get gate-level netlist.

Step 3: Simulate the netlist with same testbench using iverilog → generate new wave.vcd.

Step 4: Compare RTL waveform vs Gate-level waveform in GTKWave.

If both match → synthesis is correct.

  <img width="1311" height="673" alt="image" src="https://github.com/user-attachments/assets/638d40e7-7172-4a7f-8c29-47b811164cf2" />


- **7-SKY130RTL D1SK3 L2** → Logic Synthesis (Part 1)

🔹 Synthesis

Definition: Process of converting RTL (Register Transfer Level) design into a gate-level representation using standard cell library.

Input:

Verilog RTL code

Technology library (.lib)

Constraints (timing, area, power)

Output:

Gate-level netlist (Verilog)

Reports (timing, area, power)

  <img width="985" height="672" alt="image" src="https://github.com/user-attachments/assets/d35a28e1-e94c-4a0d-a4d7-d8b8f2c00c7b" />

  🔹 What is .lib?

A timing library file used in synthesis.

Describes each standard cell:

Function (logic equation)

Timing (delay, setup, hold)

Power consumption

Area

Input to synthesis → helps tool map RTL to real gates.

Why Different Flavours of Gates?

Same logic gate (e.g., NAND2) can have different drive strengths/sizes (like NAND2_X1, NAND2_X2, NAND2_X4).

Reason:

Faster cells → handle high load but consume more area/power.

Slower cells → smaller area, less power, but higher delay.

Synthesis tool chooses based on timing + power constraints.


<img width="985" height="638" alt="image" src="https://github.com/user-attachments/assets/cd6c3d71-4b54-4a07-9f51-d62a3ed2d5a8" />

 Why We Need Slower Cells?

Hold Violation: Happens when data travels too fast and reaches the next flip-flop before the hold time is satisfied.

Fix: Add delay in the path → one way is to use slower cells instead of fast cells.

Result: Slower cells increase path delay, preventing data from arriving too early → hold violation removed.

- **8-SKY130RTL D1SK3 L3** → Logic Synthesis (Part 2)

🔹 Fast Cells vs Slow Cells

| Feature               | Fast Cell                             | Slow Cell                                  |
| --------------------- | ------------------------------------- | -------------------------------------------- |
| **Delay**             | Low (quick switching)                 | High (slower switching)                      |
| **Power Consumption** | High (more dynamic power)             | Low (less power)                             |
| **Area**              | Large (bigger transistors)            | Small (smaller transistors)                  |
| **Use Case**          | Critical paths (timing-sensitive)     | Non-critical paths (hold/power optimization) |
| **Hold/Setup Effect** | May cause hold violations if too fast | Helps fix hold violations by adding delay    |


### 🔹 Labs using Yosys and Sky130 PDKs  
- **9-SKY130RTL D1SK4 L1** → Lab3: Yosys Good Mux (Part 1)

 1. Start Yosys
yosys

2. Read your Verilog design
read_verilog design.v

3. Run generic synthesis
synth

4. Map to a standard cell library (example: SKY130)
dfflibmap -liberty sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib

 5. Check design
stat

 6. Write gate-level netlist
write_verilog gatelevel.v

7. Visualize netlist
show gatelevel.v

  Snap Shot Of Commands To invoke Yosys
  
  <img width="1164" height="471" alt="Screenshot 2026-01-29 204542" src="https://github.com/user-attachments/assets/2a504e6f-44ab-4066-b340-b17e37416ea6" />

  
- **10-SKY130RTL D1SK4 L2** → Lab3: Yosys Good Mux (Part 2)

<img width="1190" height="363" alt="image" src="https://github.com/user-attachments/assets/96ebefb2-4a4f-403c-8368-8cadf6d9138a" />

  This is a gate-level netlist view from Yosys showing technology mapping. Here’s a short explanation of the mapping shown in your image:

Inputs & Buffers

i0, i1, and sel are inputs.

Each input goes through a BUF (buffer) which strengthens the signal for further gates.

Mapped Standard Cells

$53 → sky130_fd_sc_hd__clkinv_1 : This is an inverter applied on i0.

$54 → sky130_fd_sc_hd__nand2_1 : This is a 2-input NAND gate applied on i1 and sel.

AOI Gate (Complex Mapping)

$55 → sky130_fd_sc_hd__o21ai_0 : Yosys has mapped the combination of inverter and NAND into a complex gate (OR-AND-Invert) to optimize area/delay.

Inputs A1, A2, B1 are connected from previous cells.

Output Buffer

The final output y goes through a BUF for clean output drive.

✅ Summary:

Yosys converts RTL (like assign y = sel ? i1 : i0) into standard cells.

Simple logic (i0 inverter, i1 NAND) is mapped to basic cells.

Logic combination is optimized into complex cells (o21ai) to reduce area/delay.

Buffers are added for proper driving of signals.

- **11-SKY130RTL D1SK4 L3** → Lab3: Yosys Good Mux (Part 3)
  
This file is a gate‑level Verilog netlist written by a synthesis tool after mapping RTL to real SKY130 standard cells.

The top comment records the synthesis tool/version; the module line shows the block name and its ports (inputs like i0, i1, sel and outputs like y).

Internal wire declarations create nets that connect the pins of instantiated cells inside the design.

Instances such as clkinv (inverter), nand2 (2‑input NAND), and o21ai (Y = NAND(OR(A1,A2), B1)) implement the logic using SKY130 HD cells.

Pin maps like .A(sig) or .A1(sig) connect signals to each cell’s pins; each instance drives or consumes the declared wires.

Final assign statements hook the module’s outputs to the appropriate internal nets driven by those cell instances.

Functionally, this particular mix realizes a 2:1 mux structure, so tracing from inputs through these gates to the outputs reveals the mux behaviour


  <img width="901" height="503" alt="image" src="https://github.com/user-attachments/assets/3f888ce5-f776-40e9-8601-6cf03e741823" />


---

# Day 2 - Timing libs, Hierarchical vs Flat Synthesis and Efficient Flop Coding Styles  

### 🔹 Introduction to Timing .libs  
- **12-SKY130RTL D2SK1 L1** → Lab4: Introduction to .lib (Part 1)
  
    📌 What is a .lib file?

.lib = Library Exchange Format (LEF/Liberty format) file.

It is an ASCII text file provided by the standard cell vendor.

It describes timing, power, and functional behavior of standard cells used in ASIC/SoC design.

Input to logic synthesis, timing analysis, and PnR tools.

📌 What is present inside .lib?

Cell Definitions

Each standard cell (INV, NAND, Flip-Flop, etc.) has a block.

Functional description of the cell (Boolean equation).

Timing Information

Delay tables (rise/fall delays, setup/hold, clk→Q, etc.).

Slew-dependent and load-dependent delay data.

Power Information

Dynamic power (switching power).

Leakage power.

Internal power.

Operating Conditions (PVT)

Process corner (TT, SS, FF, etc.).

Voltage values.

Temperature values.

Other info

Pin capacitance.

Input/output constraints.

Cell area.


📌 What Is PVT = Process, Voltage, Temperature
1. Process

Variation due to fabrication (doping, lithography, etc.).

Corners: FF (fast), SS (slow), TT (typical).

Effect:

FF → gates are faster (low delay, more leakage).

SS → gates are slower (high delay, less leakage).

2. Voltage

Supply voltage fluctuations.

Effect:

High Vdd → faster switching, more power.

Low Vdd → slower switching, less power.

3. Temperature

Operating environment heat.

Effect:

High Temp → slower switching, more leakage.

Low Temp → faster switching, less leakage.
- **13-SKY130RTL D2SK1 L2** → Lab4: Introduction to .lib (Part 2)
  
  Snapshot Of .lib file

<img width="318" height="477" alt="image" src="https://github.com/user-attachments/assets/108e978e-04c4-4324-8b02-05ff6fa01344" />

<img width="747" height="412" alt="image" src="https://github.com/user-attachments/assets/efd25a85-352b-4092-a370-e5f9d4e1d9fa" />

- **14-SKY130RTL D2SK1 L3** → Lab4: Introduction to .lib (Part 3)
  
  📌 Cells with Different Features

Same logic cell (e.g., AND gate) can have different variants.

Example: AND2_X1, AND2_X2, AND2_X4 …

X1 → small area, low power, slow.

X4 → larger area, higher power, faster.

Below is the snapshot of different features for same and cell they have different area,power and many more features which vary.

  <img width="1192" height="397" alt="image" src="https://github.com/user-attachments/assets/1bf5cb30-2b69-41ec-8973-d09b9d9c3bf2" />
 

### 🔹 Hierarchical vs Flat Synthesis  
- **15-SKY130RTL D2SK2 L1** → Lab5: Hierarchical vs Flat (Part 1)
  📌 Flat vs Hierarchical Synthesis
1. Flat Synthesis

Entire RTL → flattened into one big netlist.

No module boundaries preserved.

Pros:

Better optimization (tool sees whole design).

Can reduce area/delay.

Cons:

Very large netlist → high runtime + memory.

Debugging harder (lost hierarchy).

2. Hierarchical Synthesis

RTL modules synthesized separately → then connected at top level.

Module boundaries are preserved.

Pros:

Easier debug & reuse.

Faster runtime, less memory.

Useful for very large designs (SoCs).

Cons:

Less global optimization.

May lead to slightly worse area/timing than flat.

Verilog to code to understand the hierarchical synthesis:

<img width="541" height="196" alt="image" src="https://github.com/user-attachments/assets/79b1e0f9-6a95-4dc1-ae28-39595e8c419f" />

It consiste of two modules and their conncetion are shown in Netlist.There is hierarchy between modules so it is hierarchical synthesis.Synthesis is done by tool called yosys.

<img width="336" height="172" alt="image" src="https://github.com/user-attachments/assets/09b6525b-1809-4434-a4af-faa86d2bcc26" />

Netlist:

<img width="363" height="410" alt="image" src="https://github.com/user-attachments/assets/65b3139c-7ff0-4cab-8fbb-67b83579f296" />



- **16-SKY130RTL D2SK2 L2** → Lab5: Hierarchical vs Flat (Part 2)
The Snapshot below shows difference between flat and hierarchical synthesis netlists.

Left side of snapshot is hierarchical synthesis in which hierarchy is preserved as we can see different modules but in right side diagram hierarchy is not preserved so it is flat synthesis.

<img width="842" height="488" alt="image" src="https://github.com/user-attachments/assets/e12a578b-d15d-41af-b893-8fb00ef149e4" />

The gatelevel netlist for flat synthesis is shown below

<img width="1257" height="322" alt="image" src="https://github.com/user-attachments/assets/28294ef0-f055-4ad5-bb5d-bfce41fbc29e" />

📌 Why Module-Level (Hierarchical) Synthesis is Needed

Scalability

Big SoCs have millions of gates → flat synthesis is too heavy (runtime, memory).

Breaking into modules makes synthesis manageable.

Reusability

Standard IPs (e.g., UART, SPI, CPU cores) are pre-synthesized and reused in multiple projects.

No need to resynthesize every time.

Debug & ECO (Engineering Change Order)

Easier to locate and fix issues at module level.

Flat netlist = one giant blob (hard to debug).

Parallel Development

Different teams can work on different modules simultaneously.

Later integrate at top level.

Runtime Efficiency

Hierarchical synthesis reduces compile time drastically.

Useful during iterative design flows.

### 🔹 Flop Coding Styles & Optimization  
- **17-SKY130RTL D2SK3 L1** → Why Flops? Flop coding styles (Part 1)

📌 What are Flops?

Flop = Flip-Flop (usually D-FF in digital design).

A sequential element that stores 1 bit of data.

Captures input at clock edge (positive or negative).

📌 Why Flops are Used (Advantages)

Avoid Glitches

Combinational logic can create glitches due to unequal path delays.

Flops sample data only at clock edge → glitches in between are ignored.

Synchronization

Aligns signals with the clock → ensures stable timing.

Break Long Paths

Insert flops (pipelining) → reduce critical path delay, improve frequency.

Data Storage

Used to hold states in FSMs, registers, counters, etc.

Reliable Design

Makes design predictable for STA (Static Timing Analysis).

- **18-SKY130RTL D2SK3 L2** → Flop coding styles (Part 2)

 📌 Asynchronous vs Synchronous Reset
 
| Feature                | **Asynchronous Reset**                     | **Synchronous Reset**                    |
| ---------------------- | ------------------------------------------ | ---------------------------------------- |
| **When it acts**       | Immediately, **independent of clock**      | Only at **active clock edge**            |
| **Timing**             | Can reset FF **anytime**                   | Reset happens **with clock**             |
| **Glitch sensitivity** | May cause glitches if not handled properly | Safer from glitches                      |
| **Design use**         | For **fast, immediate reset**              | For **predictable, clock-aligned reset** |
| **Example in Verilog** | `always @(posedge clk or posedge rst)`     | `always @(posedge clk)` with `if (rst)`  |

The snapshot shows different D-FF implementations with synchronous and asynchronous resets, written in Verilog and simulated using Iverilog

<img width="572" height="431" alt="image" src="https://github.com/user-attachments/assets/f9607eae-2120-46a2-af1e-5c33a787baad" />



- **19-SKY130RTL D2SK3 L3** → Lab: Flop synthesis simulations (Part 1)
  
  Snapshot Of command window to run the flipflop code and simulation.

<<img width="753" height="169" alt="Screenshot 2026-01-29 221839" src="https://github.com/user-attachments/assets/ff44ce9b-a0bd-443b-8e95-e1cdec704156" />

Snapshot of how output of asynchronous dff in gtkwave.

<img width="1085" height="357" alt="image" src="https://github.com/user-attachments/assets/9cad8af5-65af-4ca8-b480-c6360c8e008c" />

Snapshot of how output of synchronous dff in gtkwave.

<img width="618" height="217" alt="image" src="https://github.com/user-attachments/assets/8b1de7bc-f6db-4928-a6bc-5e6ca00c4e76" />

- **20-SKY130RTL D2SK3 L4** → Lab: Flop synthesis simulations (Part 2)

Snapshot Of commands to run synthesis

<img width="867" height="352" alt="image" src="https://github.com/user-attachments/assets/738f0136-ac5f-4481-b9c1-730f1b13cc40" />


Gate level netlist of asynchronous reset.

  <img width="1152" height="346" alt="image" src="https://github.com/user-attachments/assets/636f01d8-f3ad-4b65-b93d-e647097f447d" />

Gate level netlist of synchronous reset.

<img width="1265" height="373" alt="image" src="https://github.com/user-attachments/assets/8c016bb8-a2df-49ff-bd15-9c1985e8d6ad" />


  
- **21-SKY130RTL D2SK3 L5** → Interesting optimizations (Part 1)
  
📌 Multiplication by 2ⁿ Optimization

Observation: Multiplying a binary number by 2, 4, 8… (2ⁿ) can be done by simple left shift.

Logic optimization:

Instead of using a multiplier hardware, just append zeros to the LSB.

Example: A * 2 → A << 1 (shift left by 1 bit)

Example: A * 8 → A << 3 (shift left by 3 bits)

Benefit:

No complex multiplier needed.

Saves area, power, and delay.

So we can see clearly in snapshot that no memory cells process are requied.

<img width="522" height="497" alt="image" src="https://github.com/user-attachments/assets/2da85481-aa39-4072-bb30-b7220b31dc83" />

We can clearly see in netlist which is shown below there is no complex hardware these what is the benefit of the optimization.

<img width="347" height="298" alt="image" src="https://github.com/user-attachments/assets/d5f2949e-7f32-4369-90d4-98949ed27ac9" />


- **22-SKY130RTL D2SK3 L6** → Interesting optimizations (Part 2)  

We can clearly see in netlist which is shown below there is no complex hardware these what is the benefit of the optimization.

<img width="347" height="298" alt="image" src="https://github.com/user-attachments/assets/d5f2949e-7f32-4369-90d4-98949ed27ac9" />

---

# Day 3 - Combinational and Sequential Optimizations  

### 🔹 Introduction to Optimizations  
- **23-SKY130RTL D3SK1 L1** → Optimizations (Part 1)
 Combinational Logic Optimization

Definition:
Simplifying a digital circuit to reduce the number of gates, levels, or inputs without changing its functionality.

Purpose:

Reduce chip area

Increase speed (lower propagation delay)

Reduce power consumption

Make design cost-effective

Techniques:

Boolean algebra simplification

Karnaugh Map (K-map)

Quine–McCluskey method

Example 1: Multiplication by 2

Original: Use a multiplier to compute Y = A × 2

Optimized: Use a left shift operation: Y = A << 1 (no multiplier needed)

Example 2: Logic simplification

Original: F = A·B + A·~B

Constant Propagation

Definition:
Constant propagation is a technique where constant values (0 or 1) in a circuit are used to simplify logic expressions, eliminating unnecessary gates.

Why it is used:

Reduces the number of gates

Simplifies the circuit

Improves speed and power efficiency

Example:

Original logic:

F = A·1 + B·0


Step-by-step simplification using constant propagation:

A·1 = A (anything AND 1 is itself)

B·0 = 0 (anything AND 0 is 0)

So, the optimized logic:

F = A + 0
F = A


Key idea: The constants (1 and 0) “propagate” through the logic and simplify the circuit.

Optimized: F = A

- **24-SKY130RTL D3SK1 L2** → Optimizations (Part 2)

  Sequential Logic Optimization

Definition:
Sequential logic optimization improves circuits that have memory elements (flip-flops, latches) along with combinational logic, aiming to reduce area, increase speed, or lower power without changing functionality.

Why it is used:

Reduce critical path delay → faster circuits

Minimize number of flip-flops and gates → smaller area

Optimize power consumption

Improve timing and throughput



Definition:
In sequential circuits, constant optimization uses known constant inputs or states to simplify flip-flops and combinational logic that depends on them.

Example:

Suppose we have a sequential circuit with:

DFF1: Q1 = D1
D1 = A · 1


Here, 1 is a constant.

Optimization: D1 = A · 1 = A

Flip-flop still stores Q1 = A, but the AND gate is removed.

Another example (state-based):

State machine table:

Current State	Input	Next State
S0	0	S0
S0	1	S1

If we know input is always 1 during a certain operation, we can propagate this constant:

Remove transitions that depend on 0

Simplify logic for next state computation

Key Idea:

Constants propagate through combinational logic between flip-flops.

Eliminates unnecessary gates and sometimes reduces flip-flop usage.

- **25-SKY130RTL D3SK1 L3** → Optimizations (Part 3)

  Advanced Techniques

Retiming

What: Moving flip-flops across combinational logic to balance path delays.

Why: Reduces the critical path and increases maximum clock frequency.

Example:

Before Retiming: FF -> combinational logic -> FF
After Retiming: combinational logic -> FF -> combinational logic


This can allow the circuit to run at a higher clock without changing behavior.

Cloning (or Register Cloning)

What: Duplicating combinational logic blocks so multiple registers can share computations.

Why: Reduces fan-out and load on critical paths, improving timing.

Example:

One logic block feeds 4 FFs → clone the logic so each FF gets its own block → faster clock


Other common sequential optimizations

Clock gating: Turn off flip-flops that are not needed to save power

State encoding optimization: Reduce flip-flop count by smart encoding of states

Pipeline balancing: Evenly distribute logic between stages to improve throughput

Sequential Constant Optimization

### 🔹 Combinational Logic Optimizations  
- **26-SKY130RTL D3SK2 L1** → Lab6: Combinational Logic (Part 1)
Snapshot of Verilog code for and gate using mux

<img width="337" height="62" alt="image" src="https://github.com/user-attachments/assets/c67e0d5f-469e-4052-8542-153585b13581" />
  
Snapshot of Verilog code for or gate using mux
 
<img width="298" height="61" alt="image" src="https://github.com/user-attachments/assets/0c23bb02-a970-403e-bf3b-0f7ce9308159" />
 
Commands window Snapshot of  synthesis of & and or gate using mux

<img width="883" height="328" alt="image" src="https://github.com/user-attachments/assets/29ecc0e1-db56-41c2-ad9b-5b3d1b7b6fca" />

Gate level netlist of and gate using mux

<img width="352" height="227" alt="image" src="https://github.com/user-attachments/assets/3250ce44-d5f1-400f-bfff-a95e1816cf6e" />


- **27-SKY130RTL D3SK2 L2** → Lab6: Combinational Logic (Part 2)  
Gate level netlist for or gate using mux

<img width="673" height="200" alt="image" src="https://github.com/user-attachments/assets/7a288056-1f91-42d9-94fa-6f5f0481592e" />
 
 Verilod code for 3 input and gat using mux
 
<img width="368" height="67" alt="image" src="https://github.com/user-attachments/assets/72089e39-b930-48be-982b-0b1d7772be96" />

Gatelevel netlist for 3 input and gate usign mux

<img width="352" height="200" alt="image" src="https://github.com/user-attachments/assets/5937a937-9300-4fd0-a75a-951215bbcf49" />


### 🔹 Sequential Logic Optimizations  
- **28-SKY130RTL D3SK3 L1** → Lab7: Sequential Logic (Part 1)
  Verilog code for dff to understand the sequential logic optimizations
  
  <img width="365" height="167" alt="image" src="https://github.com/user-attachments/assets/818449c0-9ab8-4599-878d-3911e15bd51b" />
  
 Commands to run waveform on gtkwave for dff 

<img width="1237" height="386" alt="image" src="https://github.com/user-attachments/assets/ee994722-5455-4daa-ab27-369b9329b2bf" />

Snapshot of improper output of dff on gtkwave

<img width="1081" height="172" alt="image" src="https://github.com/user-attachments/assets/3acc3852-0caa-4991-a21b-2c2462931d4d" />

Gate level netlist for dff using synthesis on yosys

<img width="1262" height="356" alt="image" src="https://github.com/user-attachments/assets/9dc65fde-906c-4389-a611-7a510369c406" />


- **29-SKY130RTL D3SK3 L2** → Lab7: Sequential Logic (Part 2)
  Gate level netlist for design secod case output is optimized becasue be rremoved flip flops from netlist using logic so it is sequential optimization
  
  <img width="366" height="301" alt="image" src="https://github.com/user-attachments/assets/08dcbd18-2ba2-480e-8a0e-dc556b55d4d5" />

- **30-SKY130RTL D3SK3 L3** → Lab7: Sequential Logic (Part 3)
  Verilog code to understand thrid logic optimizations
  
<img width="461" height="262" alt="image" src="https://github.com/user-attachments/assets/00e46f74-764d-41bb-a7c0-217fdd3ecaa6" />

### 🔹 Sequential Optimizations for Unused Outputs  
- **31-SKY130RTL D3SK4 L1** → Seq Optimisation unused outputs (Part 1)  '
Snapshot of command window for observing output of above that thrid design
  
  <img width="744" height="131" alt="Screenshot 2026-01-29 222149" src="https://github.com/user-attachments/assets/3808b8ac-7b15-4635-8c9b-bf7866f2ab88" />

Snapshot Output of gtkwave for above design

<img width="1090" height="151" alt="image" src="https://github.com/user-attachments/assets/02734d29-ab88-483e-9750-87b0359387e7" />

Snapshot of command window to do synthesis of above design

<img width="877" height="272" alt="image" src="https://github.com/user-attachments/assets/e505f868-b73a-45db-81bd-0b25e0f3f324" />

Gate level netlist for above design

<img width="1256" height="458" alt="image" src="https://github.com/user-attachments/assets/13d90983-1ddc-4676-bb99-a579c459b714" />

- **32-SKY130RTL D3SK4 L2** → Seq Optimisation unused outputs (Part 2)
  
Verilog code for counter is shown in these snapshot
<img width="486" height="197" alt="image" src="https://github.com/user-attachments/assets/dca530d7-9f96-43fd-b03e-f6411ccc31c6" />

Snapshot of commands used ton  synthesis of conter.These design shows how hardware can be optimized there are unoptimized states in design

<img width="498" height="502" alt="image" src="https://github.com/user-attachments/assets/53daa04f-b7b7-408a-a4c5-658c50ddcaae" />

The below figuare shows gatelevel netlist for counter and for 3 bit counter we usually rquire 3 flipflop but they are some unused state in design then we can do it using  one flop also which exactly these lab provided to show

<img width="1262" height="423" alt="image" src="https://github.com/user-attachments/assets/f6c16d30-f19d-43bb-a2c4-baa14b4407cf" />

---

# Day 4 - GLS, Blocking vs Non-blocking and Synthesis-Simulation Mismatch  

### 🔹 GLS, Synthesis-Simulation Mismatch and Blocking/Non-blocking Statements  
- **33-SKY130RTL D4SK1 L1** → GLS Concepts & Flow using Iverilog
  
Gate Level Simulation (GLS)

Definition: GLS is simulation of the synthesized gate-level netlist instead of the RTL code.

After synthesis, your design is represented using logic gates (AND, OR, FFs, MUX, etc.) from the technology library.

GLS uses these gate models + optional timing info to verify correctness at the gate level.

🔹 Why GLS is needed?

Equivalence Check: Ensure synthesized netlist behaves the same as RTL.

Timing Verification: With SDF (delays), ensures design meets setup/hold timing.

X-Propagation Checks: Detect uninitialized registers, reset issues, glitches.

Library Mapping: Verify actual cells (from .lib) are functioning as expected.

Confidence before Layout: Ensures no mismatch before place-and-route.

GLS using Icarus Verilog

<img width="1227" height="547" alt="image" src="https://github.com/user-attachments/assets/e95a2986-18f1-4640-8f8c-3f8f9d0e1972" />

- **34-SKY130RTL D4SK1 L2** → Synthesis-Simulation Mismatch
  
🔹 Simulation Mismatches

A simulation mismatch occurs when the RTL simulation result ≠ GLS simulation result.

👉 This usually means the RTL code was written in a way that did not model real hardware correctly, so synthesis interpreted it differently.

Common causes:

Missing sensitivity list (biggest reason in Verilog).

Blocking (=) vs Non-blocking (<=) misuse in sequential logic.

Latch inference due to incomplete assignments.

Uninitialized signals – GLS may show X where RTL showed 0.

Timing differences (RTL ignores delays, GLS includes gate delays).

🔹 Missing Sensitivity Problem

Example (wrong code):
always @(a) begin   // Missing 'b' in sensitivity list
  y = a & b;
end


In RTL simulation:
y will update only when a changes. If b changes alone → no update, so simulation output is stale.

In Synthesis (GLS):
Tool infers a combinational gate AND(a, b), so y changes whenever a or b changes.

👉 Result = RTL vs GLS mismatch.

Correct code (fix):
always @(*) begin    // or always @(a or b)
  y = a & b;
end


@(*) automatically adds all signals in RHS (a, b) → consistent with synthesized hardware.

Now both RTL and GLS match.

🔹 Why this is dangerous?

During RTL sim, you might think design is fine (no bugs).

But after synthesis → GLS shows mismatch (functional failure).

This is why coding guidelines recommend using always @(*) for combinational logic and always @(posedge clk or negedge rst) for sequential logic.
- **35-SKY130RTL D4SK1 L3** → Blocking vs Non-Blocking Statements in Verilog
  🔹 Simulation Mismatches in Blocking vs Non-Blocking Assignments
1. Blocking (=)

Executes immediately in the given order inside always.

Acts like software statements.

Can cause unintended behavior in RTL sim if used in sequential always blocks.

👉 Example of mismatch

// Sequential block with blocking assignment
always @(posedge clk) begin
  q = d;
  r = q;   // Uses the updated q immediately (in RTL sim)
end


RTL Simulation:
r gets the new value of d in the same clock cycle (because q updated immediately).

Synthesis/GLS:
Hardware is two flip-flops in series (q → r). r should get the old value of q.
→ Mismatch!

✅ Correct way: use non-blocking (<=) in sequential logic.

2. Non-Blocking (<=)

Executes in parallel at the end of the always block.

Models real flip-flop behavior.

Ensures all RHS values are sampled first, then updates happen together.

👉 Example (correct)

always @(posedge clk) begin
  q <= d;
  r <= q;  // r gets old q, as expected
end


RTL Simulation: Matches real hardware.

GLS: No mismatch.

🔹 Common Caveats (Gotchas)
🟢 Blocking (=) Caveats

Good for combinational logic (always @(*)) → ensures step-by-step evaluation.

Dangerous in sequential blocks (always @(posedge clk)) → can cause mismatches.

Can lead to simulation race conditions if multiple always blocks depend on same signal.

🔵 Non-Blocking (<=) Caveats

Must be used for sequential logic (FFs).

If used in combinational always blocks, can cause unexpected latches or unintended parallelism.

always @(*) begin
  y <= a & b;   // BAD: synthesizer may infer latch or strange behavior
end


Order of statements does not matter (all update in parallel). Sometimes makes debugging harder.

🔹 Quick Rule of Thumb

Combinational logic → use = (blocking).

Sequential (clocked) logic → use <= (non-blocking).

Never mix them in the same always block (unless you really know why).
- **36-SKY130RTL D4SK1 L4** → Caveats with Blocking Statements

🔹 Disadvantages of Blocking Assignments (=) in Sequential Logic

One-Cycle Mismatch

RTL sim: values propagate instantly inside same always block.

Real circuit: flip-flops update only on clock edge → output lags by 1 cycle.

❌ Causes wrong pipelining (data looks 1 cycle early in sim).

Race Conditions

If multiple always blocks use blocking assignments, execution order in sim matters.

Real hardware updates in parallel → mismatch.

Hard Debugging

Sim shows design working fine, but on FPGA/ASIC, behavior is different → time lost in bring-up.

🔹 Disadvantages of Non-Blocking Assignments (<=) in Combinational Logic

Latch Inference

Incomplete assignments with <= can create unintended storage elements.

❌ Extra area, timing failures, higher power.

Glitchy Outputs

Since updates happen at end of block, combinational outputs may hold old values → wrong intermediate behavior.

Loss of Ordering Control

In combinational blocks, sometimes order of execution matters (e.g., priority logic).

With <=, all updates happen in parallel → wrong circuit implementation.

🔹 Mixing = and <= in Same Block

❌ Very risky → synthesis tool may still build correct flip-flops, but simulation will show different values depending on ordering.

Leads to unpredictable mismatches → hardest to debug.

### 🔹 Labs on GLS and Synthesis-Simulation Mismatch  
- **37-SKY130RTL D4SK2 L1** → Lab: GLS Synth-Sim Mismatch (Part 1)
  
Verilog code to Understand Ternary operator working
  
<img width="432" height="71" alt="image" src="https://github.com/user-attachments/assets/673d99af-2956-468b-9426-fb2633680d74" />
  
Gatelevel netlist for ternary oprator

<img width="1270" height="321" alt="image" src="https://github.com/user-attachments/assets/add87964-434a-4bd2-b5de-3e0e93056534" />

- **38-SKY130RTL D4SK2 L2** → Lab: GLS Synth-Sim Mismatch (Part 2)
  
GLS output for Ternary mux on gtk wave

<img width="1046" height="152" alt="image" src="https://github.com/user-attachments/assets/c6e491f6-f596-45d4-9690-fbfbad6d8f6f" />


### 🔹 Labs on Synth-Sim Mismatch for Blocking Statements  
- **39-SKY130RTL D4SK3 L1** → Lab: Synth-Sim mismatch (Blocking, Part 1)
  
  Verilog code to showcase simulation mismatch and how it cna affect our design
  
  <img width="500" height="146" alt="image" src="https://github.com/user-attachments/assets/d4290a0e-b865-47f5-b553-e73801c1d4a6" />
  
Output of GTKWAVE Of above design and it shows that mux in above design working as flipflop not like mux output is not sensitive to inputs it is only depends on the  select it will change only if there is activity on select.

<img width="1101" height="267" alt="image" src="https://github.com/user-attachments/assets/74f702ba-3cb6-4944-a7f1-f420b45d0b5e" />
The snapshot shows the output is make valid using GLS simulation to remove simulation mismatch.In the figuare output is changing when inputs and sel is changing while in previous case it was depending upon sel only

<img width="1122" height="162" alt="image" src="https://github.com/user-attachments/assets/89df641d-7084-488e-9b3b-4e177bce8964" />


- **40-SKY130RTL D4SK3 L2** → Lab: Synth-Sim mismatch (Blocking, Part 2)
  
Verilog code to show simulation mismatch due to the blocking statements.

<img width="460" height="160" alt="image" src="https://github.com/user-attachments/assets/4b84c7e5-125f-47c1-84da-00d33c44a158" />

As you can see output of above verilog code on gtkwave it is not the proper output because of simulation mismatch becasue we are getting low output when input a is high it should be low that is
due to simulation mismatch

<img width="1072" height="113" alt="image" src="https://github.com/user-attachments/assets/2ebf7093-cea8-4b49-bb06-cb4a943dab5c" />

These is the output of GLS on gtkwave we can see the simulation mismatches which where there in previous case are removed and we are getting high output when a input is high that we can clearly see in ouput below

<img width="1096" height="202" alt="image" src="https://github.com/user-attachments/assets/abac8c43-ec57-42a7-8aba-dff0a0f35203" />

---

# Day 5 - Optimization in Synthesis  

### 🔹 If-Case Constructs  

- **41-SKY130RTL D5SK1 L1** → IF-CASE Constructs (Part 1)
  
🔹 if-else Construct

Used inside always blocks to describe conditional behavior.

Example:

always @(*) begin
  if (sel)
    y = a;
  else
    y = b;
end


👉 Synthesizer infers a MUX (y = sel ? a : b).

🔹 Inferred Latch with if-else

Latch gets inferred when not all cases assign a value to the output in a combinational block.

Example (bug):

always @(*) begin
  if (en)
    y = d;   // What if en = 0? → y not assigned
end


👉 Synthesis assumes you want y to hold its old value → infers a latch.

Problems caused by latch:

Extra area + power.

Timing closure difficulties.

May cause unintended storage behavior.

🔹 Correct way

Always cover all cases in if-else:

always @(*) begin
  if (en)
    y = d;
  else
    y = 0;   // Or some default value
end


Or give a default assignment before condition:

always @(*) begin
  y = 0;        // default
  if (en)
    y = d;
end
- **42-SKY130RTL D5SK1 L2** → IF-CASE Constructs (Part 2)
  🔹 Case Construct

General form:

always @(*) begin
  case (sel)
    2'b00: y = a;
    2'b01: y = b;
    2'b10: y = c;
    default: y = d;
  endcase
end


👉 Synthesizer infers a MUX (y = f(sel)).

🔹 Caveats if default is Missing
1. Inferred Latches

If not all cases are covered and no default, then for some sel values → y not assigned → latch inferred.

always @(*) begin
  case (sel)
    2'b00: y = a;
    2'b01: y = b;
    // Missing sel=2'b10, 2'b11 → y holds old value = LATCH
  endcase
end

2. Simulation Mismatch

RTL sim may leave y as X for uncovered cases,

Synthesis may optimize differently (e.g., latch or don’t-care).
👉 GLS vs RTL mismatch.

3. Unintended Priority

If multiple case statements without default interact, synthesis might create priority logic you didn’t want.

4. Optimization Ambiguity

Tools may treat missing cases as don’t-cares.

Sometimes helpful for optimization, but dangerous → can cause wrong circuit if don’t-cares actually occur in real operation.

🔹 Best Practices

Always use default in case for combinational logic.

Or initialize outputs with a default assignment before case.

always @(*) begin
  y = 0; // default
  case (sel)
    2'b00: y = a;
    2'b01: y = b;
    2'b10: y = c;
    default: y = d;
  endcase
end


For FSMs, default can safely send design to a known reset state if an invalid state occurs.

- **43-SKY130RTL D5SK1 L3** → IF-CASE Constructs (Part 3)
  🔹 Partial Assignment in case

When inside a case block you assign only some signals, and leave others untouched, the untouched signals will retain their previous value.
👉 This causes latch inference in combinational logic.

⚠️ Example (Bug – Partial Assignment)
reg [3:0] y;

always @(*) begin
  case (sel)
    2'b00: y[0] = a;   // Only bit 0 assigned
    2'b01: y[1] = b;   // Only bit 1 assigned
    default: ;         // y[2] and y[3] never assigned
  endcase
end


For some cases, parts of y are not assigned → synthesizer adds latches to hold their old values.

✅ Correct Way (Full Assignment)

Assign entire signal in every case

always @(*) begin
  case (sel)
    2'b00: y = {3'b000, a};
    2'b01: y = {2'b00, b, 1'b0};
    default: y = 4'b0000;
  endcase
end


Or give default assignment before case

always @(*) begin
  y = 4'b0000;   // default → no latch
  case (sel)
    2'b00: y[0] = a;
    2'b01: y[1] = b;
  endcase
end

🔹 Caveats of Partial Assignment

Latch Inference → increases area, power, timing issues.

Simulation vs Synthesis Mismatch → simulation may show X while synthesis infers latch.

Unpredictable Hardware Behavior if unassigned bits are used later.

Hard Debugging → design seems fine in sim but fails in GLS/FPGA.



### 🔹 Labs on Incomplete If-Case  
- **44-SKY130RTL D5SK2 L1** → Lab: Incomplete IF (Part 1)
- 
Verilog code to understand errors can occur if not give all conditions to if else

<img width="402" height="107" alt="image" src="https://github.com/user-attachments/assets/0cb43b1b-c14a-4d86-a771-1187e0b15b20" />
  
Diagram below shows that circuit is not working proper because we have just give condition when io is high but not mentioned what to do if io is low so due to these we get simulation mismatch is
which shown on output of gtkwave for above design 

<img width="1075" height="212" alt="image" src="https://github.com/user-attachments/assets/ec00f925-9c67-4362-bebb-5321eb95794e" />

Commands snapshot To run synthesis of above design on yosys tool.

<img width="596" height="531" alt="image" src="https://github.com/user-attachments/assets/8563503b-e120-498f-ac81-c1d59e8bb44c" />

These the gatelevel netlist for incomplete if due to not giving all conditions we got d flipflop is infered in place of mux these due to if else cavets

<img width="347" height="367" alt="image" src="https://github.com/user-attachments/assets/06178798-7b9f-4d80-b85d-b05a86bcd212" />



  
- **45-SKY130RTL D5SK2 L2** → Lab: Incomplete IF (Part 2)
  
Verilog code to understand second issue due to not giving all conditions or cavets due to if eles construct

<img width="528" height="147" alt="image" src="https://github.com/user-attachments/assets/154c9760-fa69-4e75-9c63-23fd9f0b757d" />

So below screenshot shows that we are not getting proper output on gtkwave for above design becasue we have not mentioned all the conditions of if else

<img width="1095" height="220" alt="image" src="https://github.com/user-attachments/assets/f4e6aac6-3382-4927-9f81-a0512043c675" />

So the following figuare shows netlist for second design.It shows that we get latch in place of muxes becasue of we have not mentioned else conditions for if 

<img width="1230" height="350" alt="image" src="https://github.com/user-attachments/assets/0f90fca8-94ea-4c05-9545-799255f8ee0f" />

### 🔹 Labs on Incomplete Overlapping Case  
- **46-SKY130RTL D5SK3 L1** → Lab: Incomplete Overlapping Case (Part 1)
Verilog code for case construct on Icarus Verilog

<img width="508" height="125" alt="image" src="https://github.com/user-attachments/assets/35e1c7e1-234e-458d-af09-de8ecf4e0fc1" />

Functional simulation for case construct on gtkwave it shows that if we not give all conditions in case then we will not get proper output or output is latched.In the above figuare we can clearly see that we are getting proper output for i0 and i1 but in case of i2 and i3 ouput is not getting  properly it is only becasue we have not mentioned what do for these in case statement written in verilog
code

<img width="1090" height="117" alt="image" src="https://github.com/user-attachments/assets/0f31461a-017e-4b05-bc85-8603088586b8" />

The above figuare shows the gate level netlist for case construct 

<img width="1262" height="315" alt="image" src="https://github.com/user-attachments/assets/6ee0b2aa-d8d9-4e73-a56e-e76917491a50" />


- **47-SKY130RTL D5SK3 L2** → Lab: Incomplete Overlapping Case (Part 2)
  
It is the verilog to handle case construct using default statement to avoid improper working of circuit it will help to make proper wworking of circuit
 
<img width="502" height="148" alt="image" src="https://github.com/user-attachments/assets/96a258c4-246e-43a3-8cc2-61aff31aead6" />

Following is Simulation  of case construct handling using default statement on gtkwave  to maintain proper working of circuit. 

<img width="1090" height="172" alt="image" src="https://github.com/user-attachments/assets/a9407c29-8a0d-4662-b2f3-ecc5c1ea2d58" />

The following is gatelevel netlist of above design it clearly shows that if we use default condition it infer will not infer latch so it is importent to use default to maintain proper output for
unused states otherwise there might be possibility of lock out due to it

<img width="1267" height="460" alt="image" src="https://github.com/user-attachments/assets/8efd9480-4d11-4ed4-b324-4dfb543a40bd" />

- **48-SKY130RTL D5SK3 L3** → Lab: Incomplete Overlapping Case (Part 3)
- 
The below image shows the code verilog code to understand partial dependency issues in case construct

<img width="670" height="197" alt="image" src="https://github.com/user-attachments/assets/4edbde34-24bf-4ef1-a902-2cbd178bf128" />

The Figuare below shows the gate level netlist for above verilog code

<img width="1257" height="508" alt="image" src="https://github.com/user-attachments/assets/21f17d55-7d0c-414a-a8d7-1a864d101c76" />



- **49-SKY130RTL D5SK3 L4** → Lab: Incomplete Overlapping Case (Part 4)

The verilog code for case construct if we mention  same conditions.Ex  like sel =00 twice or we use sel=1? so synthesizer will get confused what to use chose and it will affect the out pur it is called bad case construct so we need avoid repetition of sel inputs to generate desired output

<img width="657" height="207" alt="image" src="https://github.com/user-attachments/assets/98933284-1635-4930-9934-a00bbf6c1faf" />

Snapshots of commands to do synthesis of case construct for bad case construct

<img width="962" height="517" alt="image" src="https://github.com/user-attachments/assets/93b4e618-8c64-4034-a65e-b6a080f7864f" />


### 🔹 For Loop and For Generate  
- **50-SKY130RTL D5SK4 L1** → For Loop & For Generate (Part 1)
  
for Loop in Procedural Blocks (always, initial)

Used for simulation/behavioral modeling.

Executes sequentially during simulation.

Example:

always @(posedge clk) begin
    for (i=0; i<8; i=i+1)
        shift_reg[i] <= shift_reg[i-1];
end


Applications:

Repeated assignments inside always block

Testbench stimulus

Compact behavioral code

Hardware is not replicated — just sequential description.

🔹 generate for Loop

Used in RTL synthesis to replicate hardware.

Works at elaboration/compile-time, not at run-time.

Example:

genvar i;
generate 
  for (i=0; i<8; i=i+1) begin : gen_block
      dff d1 (.d(d[i]), .clk(clk), .q(q[i]));
  end
endgenerate


Applications:

Instantiating multiple modules (e.g., N flip-flops, adders)

Parametric hardware design (scalable design)

Creates real hardware copies, unlike procedural for.

Aspect	Procedural for (always/initial)	Generate for
Execution Time	Run-time (simulation)	Compile/elaboration time
Purpose	Compact coding in behavior	Replicate hardware structurally
Use Case	Loops inside processes, testbenches	Multiple module instances, parametric RTL

| Aspect         | Procedural `for` (`always/initial`) | Generate `for`                            |
| -------------- | ----------------------------------- | ----------------------------------------- |
| Execution Time | Run-time (simulation)               | Compile/elaboration time                  |
| Purpose        | Compact coding in behavior          | Replicate hardware structurally           |
| Use Case       | Loops inside processes, testbenches | Multiple module instances, parametric RTL |


- **51-SKY130RTL D5SK4 L2** → For Loop & For Generate (Part 2)
  
🔹 Proper Uses of generate for

Replicating Modules/Hardware

Example: Creating an N-bit register by instantiating multiple D-FFs.

genvar i;
generate 
  for (i=0; i<N; i=i+1) begin : reg_array
    dff d1 (.d(d[i]), .clk(clk), .q(q[i]));
  end
endgenerate


Bus/Array of Adders, Multipliers, Comparators

Example: Ripple-carry adder → chain of 1-bit full adders.

genvar j;
generate 
  for (j=0; j<N; j=j+1) begin : adder_chain
    full_adder fa (.a(a[j]), .b(b[j]), .cin(c[j]), .s(sum[j]), .cout(c[j+1]));
  end
endgenerate


Parameterized & Scalable Designs

Change N parameter → hardware scales automatically.

Used in IP blocks like ALUs, multipliers, memories.

Conditional Hardware Generation

With if-generate inside → include/exclude hardware based on parameters.

generate 
  if (WIDTH == 8) begin 
     // 8-bit version hardware
  end else begin 
     // 16-bit version hardware
  end
endgenerate

- **52-SKY130RTL D5SK4 L3** → For Loop & For Generate (Part 3)
  
Normal for (inside always / initial)

Runs at simulation time.

Used for iterative assignments/operations.

Does not replicate hardware → just a compact way to describe behavior.

Example: shift register update inside an always block.

🔹 Generate for (outside always, with genvar)

Runs at elaboration/compile time.

Used to replicate hardware modules/blocks.

Creates real hardware instances (N copies).

Example: generate N flip-flops, adders, multiplexers.
### 🔹 Labs on For Loop and For Generate  
- **53-SKY130RTL D5SK5 L1** → Lab: For & For Generate (Part 1)

The following is the verilog code to understand use case of for loop inside always block it it works

<img width="686" height="136" alt="image" src="https://github.com/user-attachments/assets/f8b382a4-0066-442e-88a7-dc040fa7ed62" />

The below diagram shows the output verilog code for loop inside always block in gtkwave.

<img width="1076" height="268" alt="image" src="https://github.com/user-attachments/assets/08e17dd7-e379-47f8-91c0-8f80e6fcb637" />



- **54-SKY130RTL D5SK5 L2** → Lab: For & For Generate (Part 2)
  
🔹 Why for is preferred over case 

Scalability → for easily handles large bit-widths (e.g., 128-bit bus), while case becomes too long.

Parameterization → works smoothly with parameters/generics for flexible designs.

Compact Code → avoids repetitive code that case would require.

Less Error-Prone → no risk of missing cases (which can infer latches).

Synthesis Friendly → tools unroll for into equivalent hardware automatically.

Verilog code for demux using case

<img width="825" height="240" alt="image" src="https://github.com/user-attachments/assets/5947b47e-a392-4d76-a166-2c4da8b14da6" />

Verilog code for demux using for loop it is prefered over case for large demux like 1:256 mux and larger than these also

<img width="922" height="167" alt="image" src="https://github.com/user-attachments/assets/f5abf477-0089-420b-a37d-2f70a5100fcb" />

Output of demux on gtkwace using case statement

<img width="1092" height="226" alt="image" src="https://github.com/user-attachments/assets/dd4b87d6-574a-4b5c-89d9-b2b663bae0ab" />


- **55-SKY130RTL D5SK5 L3** → Lab: For & For Generate (Part 3)
  
🔹 Why prefer for-generate over manual structural instantiation

Scalability → avoids writing hundreds of repetitive module instances manually.

Parameterization → design size changes automatically with a parameter (N).

Readability & Maintainability → much cleaner and less error-prone code.

Consistency → guarantees identical hardware replication without copy-paste mistakes.

The following is the code for ripple carry adder using for generate it is very useful in case large design help us to reduce the thousands line of code

<img width="682" height="227" alt="image" src="https://github.com/user-attachments/assets/8ba3ba49-7760-4662-8291-cca025dd6df4" />


- **56-SKY130RTL D5SK5 L4** → Lab: For & For Generate (Part 4)
  
It shows the output of full adder implemented using for generate on gtkwave

<img width="580" height="121" alt="image" src="https://github.com/user-attachments/assets/3161adcd-9bff-4f79-8b7d-b09bf0f04f5b" />

---

