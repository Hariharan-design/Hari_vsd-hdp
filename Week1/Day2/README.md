# VSD Hardware Design Program

## Timing libs, hierarchical vs flat synthesis and efficient flop coding styles

## 📚 Contents

- [Liberty Format](#liberty-format)
- [Standard Cell Example: `a2111o_1`](#standard-cell-example-a2111o_1)
- [Standard Cell Comparison: `and2_1`, `and2_2`, and `and2_4`](#standard-cell-comparison-and2_1-and2_2-and-and2_4)
- [Hierarchical vs Flat Synthesis (Yosys)](#hierarchical-vs-flat-synthesis-yosys)
- [Why Do We Use Flops? (To Avoid Glitches)](#why-do-we-use-flops-to-avoid-glitches)
- [DFF with Asynchronous Reset](#d-flip-flop-with-asynchronous-reset)
- [DFF with Asynchronous Set](#d-flip-flop-with-asynchronous-set)
- [DFF with Synchronous Reset](#d-flip-flop-with-synchronous-reset)
- [DFF with Both Asynchronous and Synchronous Reset](#d-flip-flop-with-both-asynchronous-and-synchronous-reset)
- [Synthesis of DFF with Async Set](#synthesis-of-d-flip-flop-with-asynchronous-set)
- [Synthesis of DFF with Async Reset](#synthesis-of-d-flip-flop-with-asynchronous-reset)
- [Synthesis of DFF with Sync Reset](#synthesis-of-d-flip-flop-with-synchronous-reset)
- [Synthesis of DFF with Both Async and Sync Reset](#synthesis-of-d-flip-flop-with-both-asynchronous-and-synchronous-reset)
- [Interesting Optimisations](#interesting-optimisations)
- [Part 1 - Synthesis of `mul2`](#part1---synthesis-of-mul2)
- [Part 2 - Synthesis of `mult8`](#part2---synthesis-of-mult8)

##  Liberty Format

The Liberty format is an industry-standard ASCII format, typically stored in a .lib file, that serves as a "black box" description for library cells like standard cells or IO buffers. It provides crucial model information without detailing the internal circuitry, including timing data, power estimates, and attributes like area and functionality. The structure of a Liberty file is divided into two primary sections, with the first part containing all the common information and global operating conditions that apply universally to every cell within the library. Liberty is an ASCII format, usually represented in a text file with the extension `.lib`.

<img width="869" height="660" alt="Screenshot 2025-09-24 183006" src="https://github.com/user-attachments/assets/c64484c6-f3f4-4026-a824-c7e7fca7ffd2" />


A Liberty (.lib) file has two main parts. The first part contains common information like the library name, units, and operating conditions (PVT), which is why there are separate Max, Min, and Typical library files. The second part contains the specific details for each individual cell.

<img width="813" height="433" alt="Screenshot 2025-09-26 225643" src="https://github.com/user-attachments/assets/5b624063-eae5-4b1d-b566-cd43f515ae54" />


## Standard Cell Example: `a2111o_1`

The cell `a2111o_1` from the `sky130_fd_sc_hd__tt_025C_1v80.lib` library implements the following logic:

X = ((A1 & A2) | B1 | C1 | D1)

<img width="562" height="406" alt="Screenshot 2025-09-26 225719" src="https://github.com/user-attachments/assets/38ce3073-e694-4a0d-b227-0d7d5aee2f90" />


## Hierarchical vs Flat Synthesis (Yosys)
A Hierarchical Design contains of multiple sub-modules,instantiated in the 'top' module. 

Hierachical design approach is taken for large designs, to gain the advantage of divide and conquer approach. This leads to better utilization of tool resources for proper optimzation of smaller designs,as a larger design is difficult for a tool to optimize efficiently.

It helps in better utilization of compute resources utilized during design process,and also leads to faster runtime and debugging operations.

This leads to faster runtime, better optimization results, and simpler debugging. Conversely, a flat design approach, where the entire circuit is optimized as one unit, is preferred only for small and simple ASICs because it becomes computationally infeasible and inefficient for larger designs.

### Design : multiple_modules.v

<img width="871" height="686" alt="Screenshot 2025-09-24 190147" src="https://github.com/user-attachments/assets/54e8ad59-4a68-41d3-a81d-0082ebbe1f13" />


### Hierarchical Flow:
```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog multiple_modules.v
synth -top multiple_modules
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show multiple_modules
write_verilog -noattr multiple_modules.v
```

It Preserves module hierarchy:

Top: multiple_modules

Submodules: sub_module1, sub_module2

<img width="606" height="642" alt="Screenshot 2025-09-24 191012" src="https://github.com/user-attachments/assets/1402f3d8-e8a5-4ef9-b8fe-e5420722b630" />


### Flattened Flow:
A flat design is a representation where all hierarchical module structures are collapsed into a single level, eliminating submodules and integrating their logic directly into the top-level module.

No submodules are preserved.

```bash
flatten
write_verilog -noattr multiple_modules_flat.v
```
<img width="885" height="776" alt="Screenshot 2025-09-24 200129" src="https://github.com/user-attachments/assets/020b5f7f-71a1-4524-9014-0ce5ebc556d8" />

<img width="704" height="710" alt="Screenshot 2025-09-24 192406" src="https://github.com/user-attachments/assets/f8a2a3fb-c945-4854-a59b-5e3f756cb729" />


### Why Do We Use Flops? (To Avoid Glitches)
Combinational circuits can produce glitches — short, unwanted changes in output — when the inputs change at slightly different times. This happens because the logic takes a little time to settle when multiple signals arrive with different delays.

These glitches can cause problems, especially if they are captured by other parts of the circuit.

To solve this, we insert flip-flops between combinational blocks. Flip-flops are edge-sensitive, which means they only capture data at a specific moment (like the rising edge of a clock). This helps ensure that only stable, correct data is passed forward, and any glitches that happened before the clock edge are ignored.


## D Flip-Flop with Asynchronous Reset

This module defines a D Flip-Flop with an asynchronous reset. It captures the input d on the rising edge of the clock, unless the asynchronous reset is activated.

<img width="886" height="742" alt="Screenshot 2025-09-26 230642" src="https://github.com/user-attachments/assets/155df8b7-3d9e-443a-bf03-8b1f6f79f51b" />


In the dff_asyncres module, the asynchronous reset has higher priority than the clock.

async_reset is checked first, so if it is high (1), it immediately resets q to 0.

The clock (clk) only matters when async_reset is low (inactive).

<img width="886" height="592" alt="Screenshot 2025-09-25 193317" src="https://github.com/user-attachments/assets/57101377-6995-4729-84e7-0cecf858b9c6" />

## D Flip-Flop with Asynchronous set

This module defines a D Flip-Flop with an asynchronous set. It captures input d on the rising edge of the clock, unless the asynchronous set is active.

<img width="881" height="742" alt="Screenshot 2025-09-26 230916" src="https://github.com/user-attachments/assets/d6506977-7465-4c67-b4d3-5bd6aa121ca9" />


The flip-flop responds to either the positive edge of clk or async_set.

If async_set is high, the output q is immediately set to 1, regardless of the clock.

If async_set is low (inactive), then q takes the value of d on the rising edge of the clock.

<img width="883" height="700" alt="Screenshot 2025-09-25 193937" src="https://github.com/user-attachments/assets/1ddf1cec-26c7-47ae-a423-1410bd2df1f3" />

## D Flip-Flop with Synchronous Reset

This module defines a D Flip-Flop with a synchronous reset. The flip-flop captures the value of d on the rising edge of the clock, unless the synchronous reset is active.

<img width="885" height="746" alt="Screenshot 2025-09-26 231118" src="https://github.com/user-attachments/assets/63fe9385-54b6-4c76-8577-1ff73f026bf8" />

The always block triggers only on the rising edge of the clock.

If sync_reset is high at the time of the clock edge, the output q is set to 0.

If sync_reset is low, the output q is updated with the input d. 

<img width="881" height="629" alt="Screenshot 2025-09-25 200751" src="https://github.com/user-attachments/assets/3c6f9703-cb01-41c0-8e8f-96f1c5de0c93" />


## D Flip-Flop with Both Asynchronous and Synchronous Reset

This design supports both asynchronous and synchronous reset behavior.

Asynchronous reset has higher priority and takes effect immediately, while synchronous reset is evaluated at the clock edge.

<img width="886" height="743" alt="Screenshot 2025-09-26 231305" src="https://github.com/user-attachments/assets/d827756d-9890-4bb3-b177-b8cc94229908" />


## Synthesis of D Flip-Flop with Asynchronous set

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_async_set.v
synth -top dff_async_set
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

#### Note:
abc -liberty <.lib file path> : This command is used for for technology mapping of yosys’s internal gate library to a target architecture.

synth -top <module_name> : This command runs the yosys synthesis script on the mentioned module name of our design

dfflibmap -liberty <.lib file path> : This command maps internal flipflop cells to the flipflop cells in the technology library specified in the given liberty file.

<img width="837" height="645" alt="Screenshot 2025-09-25 231031" src="https://github.com/user-attachments/assets/10e566eb-ddc1-4e46-a8e3-d28cdced56cf" />

## Synthesis of D Flip-Flop with Asynchronous Reset

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_asyncres.v 
synth -top dff_asyncres
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="830" height="640" alt="Screenshot 2025-09-25 230728" src="https://github.com/user-attachments/assets/36966ca3-0484-4ea5-9f95-5743715db5e0" />


## Synthesis of D Flip-Flop with Synchronous Reset

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_syncres.v 
synth -top dff_syncres
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="835" height="648" alt="Screenshot 2025-09-25 231308" src="https://github.com/user-attachments/assets/b56b4bba-a8a6-4799-b8f7-6c845be39d44" />


## Synthesis of D Flip-Flop with Both Asynchronous and Synchronous Reset

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog dff_asyncres_syncres.v
synth -top dff_asyncres_syncres
dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```
<img width="822" height="702" alt="Screenshot 2025-09-26 231847" src="https://github.com/user-attachments/assets/a41d476c-b30b-4617-9b6c-2a08750be08d" />


## Interesting optimisations

Optimization in synthesis refers to simplifying the RTL logic to make the design more efficient. In the below examples, you can see that the Yosys removes redundant logic, simplifies expressions, and reduces gate count without changing functionality.

## part1 - Synthesis of mul2

<img width="876" height="739" alt="Screenshot 2025-09-26 122942" src="https://github.com/user-attachments/assets/07908c0f-912a-41ac-996f-35b44b0324c6" />

```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog mult_2.v
synth -top mul2
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib # no need to do this step becoz no cells are used #
show
write_verilog -noattr mult2_net.v
```
<img width="609" height="641" alt="Screenshot 2025-09-26 221747" src="https://github.com/user-attachments/assets/e5937b9e-9011-4308-b8fe-8780524555ea" />

<img width="887" height="742" alt="Screenshot 2025-09-26 222336" src="https://github.com/user-attachments/assets/fbd18713-02dc-4679-95e5-01d75ea07ff4" />


## part2  - Synthesis of mult8

<img width="884" height="742" alt="Screenshot 2025-09-26 232315" src="https://github.com/user-attachments/assets/cff6695d-96b4-4bb2-a6d9-6058d2d080b2" />


```bash
yosys
read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog mult_8.v
synth -top mult8
show
write_verilog -noattr mult8_net.v
```

<img width="606" height="645" alt="Screenshot 2025-09-26 222809" src="https://github.com/user-attachments/assets/80625cf7-2fba-455d-a8c2-f01fef0c7b11" />

<img width="885" height="743" alt="Screenshot 2025-09-26 223103" src="https://github.com/user-attachments/assets/6a3aaa65-08d7-4234-a6eb-962ac98d2de1" />

