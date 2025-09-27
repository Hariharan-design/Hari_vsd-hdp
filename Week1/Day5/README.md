
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

<img width="801" height="322" alt="Screenshot 2025-09-27 221615" src="https://github.com/user-attachments/assets/9a81e27f-39c9-4eda-b75d-58712f95f362" />


#### Caution

<img width="797" height="412" alt="Screenshot 2025-09-27 221638" src="https://github.com/user-attachments/assets/b1a581ea-f20b-4fb5-b3f3-0a0a8878eff2" />


#### Synthesized Diagram

<img width="882" height="644" alt="Screenshot 2025-09-27 210538" src="https://github.com/user-attachments/assets/9b7f46be-a745-43fe-bb8f-0db7e985df33" />


### Bad case Example

#### Verilog

<img width="757" height="721" alt="Screenshot 2025-09-27 210848" src="https://github.com/user-attachments/assets/cc4883c0-9a69-4875-8acc-522a1c188d48" />


#### Waveform

<img width="865" height="681" alt="Screenshot 2025-09-27 211136" src="https://github.com/user-attachments/assets/09888e10-e1c0-4045-a844-b03d605dc0c6" />


#### Caution

<img width="804" height="351" alt="Screenshot 2025-09-27 221854" src="https://github.com/user-attachments/assets/c1afc31e-0beb-4794-a74d-f133650e4f89" />


#### Synthesized Diagram

<img width="608" height="645" alt="Screenshot 2025-09-27 211328" src="https://github.com/user-attachments/assets/0d14d140-5dc5-432d-bcc4-e6aa7da2e784" />

### Complete case Example

#### Verilog

<img width="764" height="724" alt="Screenshot 2025-09-27 205630" src="https://github.com/user-attachments/assets/c0d0868e-94a0-4b08-88d4-93643fe1e17d" />


#### Waveform

<img width="881" height="681" alt="Screenshot 2025-09-27 205840" src="https://github.com/user-attachments/assets/bd1aefc1-581f-44ef-a2e3-4aed43b34873" />


#### Synthesized Diagram

<img width="608" height="644" alt="Screenshot 2025-09-27 205955" src="https://github.com/user-attachments/assets/2a0c7c93-fc1a-42e3-9438-d037eb309443" />

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

<img width="760" height="724" alt="Screenshot 2025-09-27 213631" src="https://github.com/user-attachments/assets/66093b9c-f474-4c73-9985-6fb3c1c07a16" />


#### Waveform

<img width="882" height="684" alt="Screenshot 2025-09-27 214034" src="https://github.com/user-attachments/assets/c86d64d9-2107-440e-a3db-ca4b7ece4d70" />

#### Synthesized Diagram

<img width="782" height="353" alt="Screenshot 2025-09-27 222223" src="https://github.com/user-attachments/assets/0d88cd7d-1945-4af7-a855-aca81b168edb" />


### for - generate (RCA)

#### Verilog

<img width="757" height="556" alt="Screenshot 2025-09-27 215422" src="https://github.com/user-attachments/assets/47861dcb-5063-476e-9b12-f601335f0c10" />


#### Waveform

<img width="863" height="681" alt="Screenshot 2025-09-27 220325" src="https://github.com/user-attachments/assets/d8710fa1-c676-4f30-8fa3-03ffc53dbcfc" />


#### Synthesized Diagram

<img width="680" height="603" alt="Screenshot 2025-09-27 222621" src="https://github.com/user-attachments/assets/bcd08587-505c-4844-95e0-8ae70e8e75c3" />
