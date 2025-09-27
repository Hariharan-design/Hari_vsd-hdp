# VSD Hardware Design Program

## Combinational and sequential optmizations

## 📚 Contents

- [Combinational Logic Optimization](#Combinational-Logic-Optimization)
- [Sequential Logic Optimization](#Sequential-Logic-Optimization)
- [Combinational Logic Optimization-labs](#Combinational-Logic-Optimization-examples)
- [Sequential-Logic-Optimization-labs](#Sequential-Logic-Optimization-examples)

### Combinational Logic Optimization

#### Objective:
Squeeze and simplify logic to get the most optimized design in terms of **area** and **power**.

#### Techniques:

- **Constant Propagation**
  - Replaces logic blocks with constants when input values are fixed.
  - **Example:**
    ```
    Y = ((A·B) + C)' 
    If A = 0 → Y = (0 + C)' = C'
    ```
  - **Result:** Complex gate logic (6 MOS transistors) simplifies to a single inverter (2 MOS transistors).

- **Boolean Logic Optimization**
  - Simplify Boolean expressions using:
    - Karnaugh Map (K-Map)
    - Quine McCluskey Method
  - **Example Verilog:**
    ```verilog
    assign y = a ? (b ? c : (c ? a : 0)) : (!c);
    ```
    - Optimized expression:  
      ```
      y = a ⊕ c
      ```
**Note:**  
  - The command to perform logic optimization in Yosys is `opt_clean`.  
  - Additionally, for a hierarchical design involving multiple sub-modules, the design must be flattened by running the `flatten` command before executing the `opt_clean` command.

```shell
USAGE:
After the synth -top <module_name> command is executed, do:
    opt_clean -purge

This command identifies wires and cells that are unused and removes them.
The additional switch, purge also removes the internal nets if they have a public name.
```
---

### Sequential Logic Optimization

#### Basic:
- **Sequential Constant Propagation**  
  - Propagates known constant values through flip-flops during synthesis.

#### Advanced :
- **State Optimization**
  - Reduces the number of states in FSMs to optimize area and transitions.
- **Retiming**
  - Moves registers across logic boundaries to balance delay and improve timing.
- **Sequential Logic Cloning**
  - Duplicates logic in floorplan-aware synthesis to meet timing and congestion goals.
    
## Combinational Logic Optimization examples
## lab1

<img width="775" height="406" alt="Screenshot 2025-09-27 131903" src="https://github.com/user-attachments/assets/91da3301-d3e6-4c45-a97a-577320d8a03b" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog opt_check.v 
synth -top opt_check
opt_clean -purge # Removes unused or redundant logic #
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="606" height="644" alt="Screenshot 2025-09-27 093259" src="https://github.com/user-attachments/assets/532460f3-62e5-4d4f-ba06-d5ba6d9a3231" />

## lab2

<img width="877" height="746" alt="Screenshot 2025-09-27 093618" src="https://github.com/user-attachments/assets/fab387aa-3af8-48e3-b725-b6e2fda18a4a" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog opt_check2.v 
synth -top opt_check2
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="607" height="644" alt="Screenshot 2025-09-27 093442" src="https://github.com/user-attachments/assets/4cb99317-2efd-49a6-a778-d0b4d3b97a67" />


## lab3

<img width="874" height="745" alt="Screenshot 2025-09-27 093845" src="https://github.com/user-attachments/assets/9250c4ef-fcc6-490d-90e3-18805c3b6c96" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog opt_check3.v 
synth -top opt_check3
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="614" height="645" alt="Screenshot 2025-09-27 094102" src="https://github.com/user-attachments/assets/54e2c698-4d10-4027-a5c6-08d46f0829d9" />

## lab4

<img width="886" height="749" alt="Screenshot 2025-09-27 094218" src="https://github.com/user-attachments/assets/1bc216e1-60de-4b18-bc8c-94e2a47e637b" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog opt_check4.v 
synth -top opt_check4
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="606" height="645" alt="Screenshot 2025-09-27 094424" src="https://github.com/user-attachments/assets/7a320d9c-0a88-4390-b476-c7a44fc03cf4" />


## lab5 - multiple_module_opt1

<img width="878" height="746" alt="Screenshot 2025-09-27 100134" src="https://github.com/user-attachments/assets/3b1635a9-228b-4c74-890d-f5a06093be91" />

```bash
# --------Phase 1: Flatten the hierarchical RTL design---------------

# Invoke yosys
yosys

# Load standard cell library (Liberty format)
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read hierarchical RTL design
read_verilog multiple_module_opt.v

# Synthesize top module
synth -top multiple_module_opt

# Map to standard cells using ABC
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Flatten design hierarchy 
# 🔸Essential before performing optimization on multi-module RTLs
flatten

# Write out the flattened netlist
write_verilog -noattr multiple_module_opt_flat.v
```
```bash

# ----------Phase 2: Optimize the flattened netlist-------------

# Invoke yosys
yosys

# Load standard cell library (Liberty format)
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read the flattened netlist for further optimization
read_verilog multiple_module_opt_flat.v

# Synthesize top module
synth -top multiple_module_opt

# Remove unused logic and clean netlist
opt_clean -purge   # Cleans up redundant gates and wires after flattening

# Map to standard cells using ABC
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Visualize optimized gate-level netlist
show
```

<img width="605" height="643" alt="Screenshot 2025-09-27 102151" src="https://github.com/user-attachments/assets/b80e1d7d-c492-4279-a857-ee5fdc061970" />


>One AND2 gate (a & 1)
>One A21O gate ((a & b) | c)

## lab6 - multiple_module_opt2

<img width="877" height="757" alt="Screenshot 2025-09-27 102226" src="https://github.com/user-attachments/assets/6b6999f5-a1e2-47b3-bce1-75978851968c" />

```bash
# --------Phase 1: Flatten the hierarchical RTL design---------------

# Invoke yosys
yosys

# Load standard cell library (Liberty format)
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read hierarchical RTL design
read_verilog multiple_module_opt2.v

# Synthesize top module
synth -top multiple_module_opt2

# Map to standard cells using ABC
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Flatten design hierarchy 
# 🔸Essential before performing optimization on multi-module RTLs
flatten

# Write out the flattened netlist
write_verilog -noattr multiple_module_opt2_flat.v
```
```bash

# ----------Phase 2: Optimize the flattened netlist-------------

# Invoke yosys
yosys

# Load standard cell library (Liberty format)
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Read the flattened netlist for further optimization
read_verilog multiple_module_opt2_flat.v

# Synthesize top module
synth -top multiple_module_opt2

# Remove unused logic and clean netlist
opt_clean -purge   # Cleans up redundant gates and wires after flattening

# Map to standard cells using ABC
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

# Visualize optimized gate-level netlist
show
```
<img width="614" height="643" alt="Screenshot 2025-09-27 102552" src="https://github.com/user-attachments/assets/c0751bc4-e273-4ba4-9637-d73304102ed7" />


## Sequential Logic Optimization examples

## lab1

Here, we can see value of q does not change as soon as reset=0,but q takes the value of 1’b0 at next clock edge,hence here no sequential logic optimization will occur and DFF will be inferred.

<img width="883" height="748" alt="Screenshot 2025-09-27 111522" src="https://github.com/user-attachments/assets/5fcc17ab-1f3f-48dc-95af-7f6791dbfa48" />

<img width="873" height="634" alt="Screenshot 2025-09-27 112558" src="https://github.com/user-attachments/assets/2eb4f768-bc72-40f8-a933-03c46b899f7b" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const1.v
synth -top dff_const1
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="607" height="644" alt="Screenshot 2025-09-27 113203" src="https://github.com/user-attachments/assets/f16914cb-22de-4fdc-b3ab-96265da6b2a4" />

## lab2

Here,we can observe the value of q=1'b1 independent of reset input,so upon synthesis, a DFF will not be inferred upon synthesis.

<img width="889" height="753" alt="Screenshot 2025-09-27 113403" src="https://github.com/user-attachments/assets/65c84626-a8ca-4ff6-aa72-5a8710247120" />

<img width="886" height="679" alt="Screenshot 2025-09-27 113549" src="https://github.com/user-attachments/assets/0b2ca158-9fa1-43c0-8f3c-80f02ca3a6fe" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const2.v
synth -top dff_const2
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="613" height="644" alt="Screenshot 2025-09-27 114151" src="https://github.com/user-attachments/assets/375c9593-17a5-41c4-b107-2539189c247b" />

## lab3

Here,Two DFFs will be inferred with a set flip-flop with q output and reset flip-flop with q1 output and both flip-flops will be connected back to back.

Here,the logic will be retained as the value of q depends upon the state of q1,as seen in the waveform.

<img width="876" height="743" alt="Screenshot 2025-09-27 114538" src="https://github.com/user-attachments/assets/dbf34bb3-069f-490c-912c-629f4e3ef33d" />

<img width="892" height="683" alt="Screenshot 2025-09-27 120955" src="https://github.com/user-attachments/assets/4458e240-6e21-45bd-8b31-96a9d3bcbc1d" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const3.v
synth -top dff_const3
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="830" height="571" alt="Screenshot 2025-09-27 115015" src="https://github.com/user-attachments/assets/e49e9d56-6716-481d-bc9e-47bb33442da5" />

## lab4

Here,the value of q1 and q are independent of reset input,hence no DFF will be inferred upon synthesis.

<img width="780" height="730" alt="Screenshot 2025-09-27 115057" src="https://github.com/user-attachments/assets/26c8a089-a004-4380-bb41-821176e7c59b" />

<img width="885" height="685" alt="Screenshot 2025-09-27 121106" src="https://github.com/user-attachments/assets/f3ce5858-6762-4465-bc03-b9f4c6fc89be" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const4.v
synth -top dff_const4
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="614" height="646" alt="Screenshot 2025-09-27 115446" src="https://github.com/user-attachments/assets/3f486575-983c-4ca5-b59f-30aa697d1ce3" />

## lab5

Here,after reset is deasserted,q1 is set to 1’b1 at next rising edge of clock,and we see q samples value of q1=1’b1 at the further clk edge,hence q depends upon value of q1,so even if q1 value remains constant,two DFFs will be inferred,as seen in the waveform.

<img width="778" height="741" alt="Screenshot 2025-09-27 115511" src="https://github.com/user-attachments/assets/698e30f1-bab8-4547-9b6b-76ab3f08574e" />

<img width="878" height="684" alt="Screenshot 2025-09-27 121257" src="https://github.com/user-attachments/assets/ddee93b7-fa05-4d26-84ef-e02affee128b" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_const5.v
synth -top dff_const5
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="881" height="673" alt="Screenshot 2025-09-27 120500" src="https://github.com/user-attachments/assets/0df8fe73-8567-44c2-ad72-3ee82255c52b" />

## lab6 - unused outputs

<img width="788" height="731" alt="Screenshot 2025-09-27 121459" src="https://github.com/user-attachments/assets/e5add9a9-7a59-4775-aa81-9c33d4a45a43" />
<img width="885" height="680" alt="Screenshot 2025-09-27 122017" src="https://github.com/user-attachments/assets/f7f80154-3913-47ff-940b-1cf26e42329c" />

This design demonstrates sequential logic optimization in scenarios where only a portion of a multi-bit register is utilized.

Although the RTL describes a 3-bit up counter (count[2:0]), only the least significant bit (count[0]) is used to drive the output q.

Since count[0] toggles on every clock cycle, the synthesis tool recognizes that only a single bit is functionally relevant. As a result, it optimizes the logic by eliminating the unused flip-flops and associated increment logic, reducing the design to a single flip-flop implementation.

#### Synthesis Result with opt_clean switch
```shell
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog counter_opt.v
synth -top counter_opt
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
opt_clean -purge
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="727" height="286" alt="Screenshot 2025-09-27 130559" src="https://github.com/user-attachments/assets/c84679d4-b31a-496e-b041-eee781932bba" />

<img width="887" height="696" alt="Screenshot 2025-09-27 130501" src="https://github.com/user-attachments/assets/feda764d-39ce-42fc-8c76-152656b7e01d" />

## lab7 

<img width="776" height="739" alt="Screenshot 2025-09-27 130634" src="https://github.com/user-attachments/assets/0a92c71f-d58c-46de-8cbe-0b21822170f5" />

In this design, we have a 3-bit up counter and all the bits in the counter state value, count[2:0] are used for generating the output signal, q.
q = 1, when count[2:0] = 3'b100

So when this design is synthesized, we expect 3 DFF instantiations to be present along with the count incrementing logic and the logic to generate, q.

```shell
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog counter_opt2.v
synth -top counter_opt
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="717" height="511" alt="Screenshot 2025-09-27 130728" src="https://github.com/user-attachments/assets/62180a3a-4e49-465c-bcb1-37586daad588" />

<img width="882" height="624" alt="Screenshot 2025-09-27 130808" src="https://github.com/user-attachments/assets/089439de-77df-4bca-b8ce-09eeb1855e72" />
