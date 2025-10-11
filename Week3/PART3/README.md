# Week 3 Task – Post-Synthesis GLS & STA Fundamentals

## 🎯 Objective
The goal of this task is to perform **Gate-Level Simulation (GLS)** after synthesis, validate the design’s functionality, and conduct **Static Timing Analysis (STA)** using OpenSTA.  
We aim to identify **critical paths, slack, and timing violations**, ensuring the synthesized design meets timing requirements.

---

## 🧠 Introduction to STA
**Static Timing Analysis (STA)** is a method to verify digital circuits without requiring simulation vectors. STA checks **all possible paths** between sequential elements to ensure data is captured correctly.

### 🔹 Key Concepts

#### **Setup Time**
- Minimum time before the clock edge that data must remain stable at the input of a flip-flop.  
- If data changes too late → **Setup Violation** occurs.

#### **Hold Time**
- Minimum time after the clock edge that data must remain stable at the input.  
- If data changes too soon → **Hold Violation** occurs.

#### **Slack**
- Difference between **required arrival time** and **actual arrival time**:
\[
\text{Slack} = \text{Required Time} - \text{Arrival Time}
\]
- **Positive slack:** Path meets timing.  
- **Negative slack:** Timing violation.  
- **Zero slack:** Path exactly meets timing.

#### **Critical Path**
- The **longest path** between flip-flops or sequential elements in terms of delay.  
- Determines **maximum operating frequency** of the design.

#### **Clock Definitions**
- Clock period, waveform, and uncertainty are defined in the `.sdc` file.  
- Accurate clock setup ensures proper timing analysis.

---

## 🧭 Steps Performed

### **1️⃣ Load Synthesized Netlist and Constraints**
- Files used:
  - Synthesized netlist: `synth_netlist.v`  
  - Timing constraints: `constraints.sdc`  
  - Technology library: `typical.lib`  
- Commands in OpenSTA:
```tcl
read_lib typical.lib
read_verilog synth_netlist.v
read_sdc constraints.sdc
set_top top_module_name
link_design
update_timing
