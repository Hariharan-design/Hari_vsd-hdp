
#  DAY 5

## if Construct

- The if statement is a conditional construct used to make decisions in Verilog.

- It checks conditions and executes the corresponding block of code.

- Can be nested or combined with else and else if.

### Syntax

```bash
$ if (condition)
$    statement1;
$ else if (condition2)
$    statement2;
$ else
$    statement3;
```
### Key Points:

- Use if-else when checking ranges or multiple conditions.

- Missing else may infer a latch in synthesis.

- Works well for priority-based decisions (one condition has higher priority).

### Incomple "if" Example

#### Verilog code

<img width="764" height="659" alt="Screenshot 2025-09-27 200449" src="https://github.com/user-attachments/assets/f88e0daa-387b-413a-89d1-deefd61aecf8" />

#### Cautions

<img width="804" height="432" alt="Screenshot 2025-09-27 220837" src="https://github.com/user-attachments/assets/99099d6e-01ba-4100-9dcb-4ce4c88fb1d6" />


#### Waveform

<img width="865" height="679" alt="Screenshot 2025-09-27 200933" src="https://github.com/user-attachments/assets/03b73648-1ff7-428a-9cce-20cf6b2fbcd5" />

#### Synthesised Diagram

<img width="603" height="642" alt="Screenshot 2025-09-27 201143" src="https://github.com/user-attachments/assets/a643dae0-b073-4e18-b3a4-ea63e470d1c4" />

## Case Construct

- The case statement is a multi-way branching construct.

- It compares an expression with multiple possible values and executes the matching branch.

### Syntax

```bash
$ case (expression)
$    value1: statement1;
$    value2: statement2;
$    default: statement_default;
$ endcase
```
### Key POints
- Use case when checking discrete values of a signal (like mux, FSM states).

- Always include a default case to avoid latch inference.

- Variants:

    - casez → Treats z or ? as don’t-care.

    - casex → Treats both x and z as don’t-care. (⚠ not recommended in synthesis due to ambiguity).

### Incomplete case Example

#### Verilog code

<img width="763" height="715" alt="Screenshot 2025-09-27 202648" src="https://github.com/user-attachments/assets/2ce5a646-f828-43fc-b8fc-d04705d13168" />

#### Waveform

<img width="883" height="680" alt="Screenshot 2025-09-27 203013" src="https://github.com/user-attachments/assets/095659c1-829b-480b-be23-bb58f93b8242" />


#### Caution

<img width="803" height="349" alt="Screenshot 2025-09-27 221106" src="https://github.com/user-attachments/assets/02ddb435-c7c7-485d-855d-769b38d78496" />


#### Synthesized Diagram

<img width="603" height="643" alt="Screenshot 2025-09-27 203107" src="https://github.com/user-attachments/assets/df7d8f21-d306-44b6-93ba-507b3be40f98" />


### Partial Case Construct Example

#### Verilog 

<img width="761" height="722" alt="Screenshot 2025-09-27 210041" src="https://github.com/user-attachments/assets/ed45c9f4-a2f1-4fd1-9a61-9378f2222da6" />


#### Waveform

![partial_case_wave](images/wave_partial_case.png)

#### Caution

![partial_case_caution](images/partial_case.png)

#### Synthesized Diagram

![partial_case_syn_diag](images/partial_case_syn_diag.png)

### Bad case Example

#### Verilog

![bad_case_verilog](images/bad_case_verilog.png)

#### Waveform

![bad_case_wave](images/wave_bad_case.png)

#### Caution

![bad_case_caution](images/bad_case_caution.png)

#### Synthesized Diagram

![bad_case_syn_diag](images/bad_case_syn_diag.png)

### Complete case Example

#### Verilog

![complete_case_verilog](images/comp_case_verilog.png)

#### Waveform

![complete_case_wave](images/wave_comp_case.png)

#### Synthesized Diagram

![comp_case_syn](images/comp_case_syn_diag.png)

## Looping Constraint

### for Loop

- A procedural loop used inside always or initial blocks.

- Executes sequentially in simulation time (not parallel hardware).

- Useful for testbenches or repeated assignments inside procedural blocks.

### Syntax

```bash
$ for (init; condition; update) begin
$     // procedural statements
$ end

```
### Key Points

- Used inside procedural blocks (always, initial).

- Executes sequentially during simulation.

- Does not replicate hardware automatically.

### for Loop Example (mux)

#### Verilog

![for_loop_ver](images/mux_generate_using_for_verilog.png)

#### Waveform

![for_loop_wave](images/wave_mux_generate.png)

#### Synthesized Diagram

![for_loop_syn](images/mux_generate_syn_diag.png)

### for - generate (RCA)

#### Verilog

![for_generate](images/rca_verilog.png)

#### Waveform

![for_generate_wave](images/wave_rca.png)

#### Synthesized Diagram


![for_generate_rca](images/rca_syn_diag.png)
