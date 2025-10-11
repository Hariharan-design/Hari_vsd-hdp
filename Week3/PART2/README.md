# Week 3 Task – Post-Synthesis GLS & STA Fundamentals

## 🎯 Objective
To understand and perform Gate-Level Simulation (GLS) after synthesis, validate functionality, and get introduced to Static Timing Analysis (STA) concepts with practical experiments using OpenSTA.

---

## 🧠 Static Timing Analysis (STA) – Key Concepts

### 🔹 Setup and Hold Checks
- **Setup Time:**  
  The minimum time before the clock edge that data must remain stable at the input of a flip-flop.  
  If data arrives too late → **Setup Violation** occurs.
  
- **Hold Time:**  
  The minimum time after the clock edge that data must remain stable at the input.  
  If data changes too soon → **Hold Violation** occurs.
  
- **Purpose:**  
  These checks ensure that data is properly captured by the destination flip-flop without corruption.

---

### 🔹 Slack
- **Definition:**  
  The difference between the required arrival time and the actual data arrival time.

  \[
  \text{Slack} = \text{Required Time} - \text{Arrival Time}
  \]

- **Types:**
  - **Positive Slack →** Timing is met (data arrives early enough).
  - **Negative Slack →** Timing violation (data arrives too late).
  - **Zero Slack →** Design meets timing exactly.

- **Use:**  
  Slack helps identify **critical paths** and areas needing optimization during synthesis or layout.

---

### 🔹 Clock Definitions
- **Clock:** The reference signal that synchronizes sequential elements (like flip-flops).  
- Defined using **constraints** in an `.sdc` file, specifying:
  - Clock **name**
  - Clock **period** or **frequency**
  - Clock **waveform** (duty cycle, rise/fall times)
  - **Generated clocks** for derived signals (like dividers or PLL outputs)
  
- Accurate clock definitions ensure proper timing checks across all design paths.

---

### 🔹 Path-Based Analysis
- **Startpoint:** Launching flip-flop or input port.  
- **Endpoint:** Capturing flip-flop or output port.  
- STA analyzes **all possible timing paths** between these points.  

- **Types of Paths:**
  - **Data Paths:** From one register to another.
  - **Clock Paths:** Between clock sources and registers.
  - **Input/Output Paths:** From input ports to internal registers or from registers to output ports.

- **Goal:**  
  Verify that all paths satisfy setup and hold constraints under given clock definitions.

---

### ✅ Summary
- **Setup & Hold Checks** ensure reliable data capture.  
- **Slack** shows how well timing is met or violated.  
- **Clock Definitions** establish accurate timing references.  
- **Path-Based Analysis** validates all timing paths across the design.  

Together, they form the foundation of **Static Timing Analysis (STA)** used for verifying post-synthesis designs.

---

**Author:** Hariharan  
**Repository:** [Hari_vsd-hdp](https://github.com/Hariharan-design/Hari_vsd-hdp)

