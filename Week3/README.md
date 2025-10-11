# GLS OF BABYSOC
## POST-SYNTHESIS SIMULATION

### Purpose of GLS:
Gate-Level Simulation is used to verify the functionality of a design after the synthesis process. Unlike behavioral or RTL (Register Transfer Level) simulations, which are performed at a higher level of abstraction, GLS works on the netlist generated post-synthesis. This netlist includes the actual gates and connections used to implement the design.

### Key Aspects of GLS for BabySoC:
1. **Verification with Timing Information:**
   - GLS is performed using Standard Delay Format (SDF) files to ensure timing correctness.
   - This checks if the SoC behaves as expected under real-world timing constraints.

2. **Design Validation Post-Synthesis:**
   - Confirms that the design's logical behavior remains correct after mapping it to the gate-level representation.
   - Ensures that the design is free from issues like metastability or glitches.

3. **Simulation Tools:**
   - Tools like Icarus Verilog or a similar simulator can be used for compiling and running the gate-level netlist.
   - Waveforms are typically analyzed using GTKWave.

4. **Importance for BabySoC:**
   - BabySoC consists of multiple modules like the RISC-V processor, PLL, and DAC. GLS ensures that these modules interact correctly and meet the timing requirements in the synthesized design.


Here is the step-by-step execution plan for running the  commands manually:
---
### **Step 1: Load the Top-Level Design and Supporting Modules**
```bash
yosys
```
<img width="867" height="409" alt="Screenshot 2025-10-11 220233" src="https://github.com/user-attachments/assets/5a13fcff-c03c-4b7e-b271-bb8037d8803f" />

Inside the Yosys shell, run:
```yosys
read_verilog /home/vboxuser/vsdflow/VSDBabySoC/src/module/vsdbabysoc.v
read_verilog -I /home/vboxuser/vsdflow/VSDBabySoC/src/include /home/vboxuser/vsdflow/VSDBabySoC/src/module/rvmyth.v
read_verilog -I /home/vboxuser/vsdflow/VSDBabySoC/src/include /home/vboxuser/vsdflow/VSDBabySoC/src/module/clk_gate.v

```

<img width="858" height="134" alt="Screenshot 2025-10-11 173009" src="https://github.com/user-attachments/assets/38589514-4600-40ad-b2a5-72e2a990284f" />

<img width="845" height="262" alt="Screenshot 2025-10-11 173015" src="https://github.com/user-attachments/assets/9c348585-837c-4ad9-96eb-78f8db1e4e79" />

<img width="862" height="165" alt="Screenshot 2025-10-11 173020" src="https://github.com/user-attachments/assets/4d2d031c-f9b2-42f4-b783-60a606a458ff" />

---

### **Step 2: Load the Liberty Files for Synthesis**
Inside the same Yosys shell, run:
```yosys
read_liberty -lib /home/vboxuser/vsdflow/VSDBabySoC/src/lib/avsdpll.lib
read_liberty -lib /home/vboxuser/vsdflow/VSDBabySoC/src/lib/avsddac.lib
read_liberty -lib /home/vboxuser/vsdflow/VSDBabySoC/src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

<img width="851" height="247" alt="Screenshot 2025-10-11 173030" src="https://github.com/user-attachments/assets/1fe58e11-bcc0-4fe4-8374-f52de35aee6b" />

---

### **Step 3: Run Synthesis Targeting `vsdbabysoc`**
```yosys
synth -top vsdbabysoc
```
<img width="882" height="420" alt="Screenshot 2025-10-11 172631" src="https://github.com/user-attachments/assets/7c2013ca-2769-43de-a80d-05e8a9eb68b4" />
<img width="848" height="436" alt="Screenshot 2025-10-11 172718" src="https://github.com/user-attachments/assets/39438657-2c78-4b76-b26b-9d5fd1323b26" />
<img width="849" height="500" alt="Screenshot 2025-10-11 172747" src="https://github.com/user-attachments/assets/945ed8b7-5da5-421c-98b1-b246cf60cf6d" />
<img width="884" height="256" alt="Screenshot 2025-10-11 172759" src="https://github.com/user-attachments/assets/390333d9-1364-4430-97ff-c07facbf43fb" />
<img width="873" height="572" alt="Screenshot 2025-10-11 172811" src="https://github.com/user-attachments/assets/7ae38ae7-c9cb-4613-955a-b47f9f8281b6" />
<img width="855" height="117" alt="Screenshot 2025-10-11 172824" src="https://github.com/user-attachments/assets/905e5efc-7837-4dba-9bb9-3230f84c25b3" />

---

### **Step 4: Map D Flip-Flops to Standard Cells**
```yosys
dfflibmap -liberty /home/vboxuser/vsdflow/VSDBabySoC/src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
```

<img width="858" height="134" alt="Screenshot 2025-10-11 173009" src="https://github.com/user-attachments/assets/dbf54cae-e70b-4a73-9e3c-fb8a2117eb6c" />

---

### **Step 5: Perform Optimization and Technology Mapping**
```yosys
opt
abc -liberty /home/vboxuser/vsdflow/VSDBabySoC/src/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime;{D};strash;dch,-f;map,-M,1,{D}
```
<img width="876" height="496" alt="Screenshot 2025-10-11 173112" src="https://github.com/user-attachments/assets/fe339bc4-97ee-4a44-ba58-9f9aaf6da257" />
<img width="832" height="682" alt="Screenshot 2025-10-11 180945" src="https://github.com/user-attachments/assets/2f031ae5-2db6-40c8-83e4-4008bfe252df" />

---

### **Step 6: Perform Final Clean-Up and Renaming**
```yosys
flatten
setundef -zero
clean -purge
rename -enumerate
```
<img width="835" height="351" alt="Screenshot 2025-10-11 181127" src="https://github.com/user-attachments/assets/7b914efc-0021-4bf9-977f-8151ccdc1017" />

---

### **Step 7: Check Statistics**
```yosys
stat
```
<img width="835" height="673" alt="Screenshot 2025-10-11 181147" src="https://github.com/user-attachments/assets/db35e77b-1c4b-411a-9465-50a4420c2af1" />
<img width="837" height="421" alt="Screenshot 2025-10-11 181214" src="https://github.com/user-attachments/assets/9bf4bec4-4d85-4c61-8e62-a4b9151a4875" />

---

### **Step 8: Write the Synthesized Netlist**
```yosys
write_verilog -noattr /home/vboxuser/vsdflowC/VSDBabySoC/output/post_synth_sim/vsdbabysoc.synth.v
```
<img width="848" height="102" alt="Screenshot 2025-10-11 181727" src="https://github.com/user-attachments/assets/d8d46983-d1c1-4a8f-81d8-f77fa07e9745" />


---

## POST_SYNTHESIS SIMULATION AND WAVEFORMS
---

### **Step 1: Compile the Testbench**
Run the following `iverilog` command to compile the testbench:
```bash
iverilog -o /home/vboxuser/vsdflow/VSDBabySoC/output/post_synth_sim/post_synth_sim.out -DPOST_SYNTH_SIM -DFUNCTIONAL -DUNIT_DELAY=#1 -I /home/vboxuser/vsdflow/VSDBabySoC/src/include -I /home/vboxuser/vsdflow/VSDBabySoC/src/module /home/vboxuser/vsdflow/VSDBabySoC/src/module/testbench.v
```
---
### **Step 2: Navigate to the Post-Synthesis Simulation Output Directory**
```bash
cd output/post_synth_sim/
```
---
### **Step 3: Run the Simulation**

```bash
./post_synth_sim.out
```
---
### **Step 4: View the Waveforms in GTKWave**

```bash
gtkwave post_synth_sim.vcd
```
---
<img width="620" height="352" alt="Screenshot 2025-10-11 221839" src="https://github.com/user-attachments/assets/9e6b854e-588a-46a6-b45f-aefc9eb1932f" />

<img width="636" height="370" alt="Screenshot 2025-10-11 221849" src="https://github.com/user-attachments/assets/5ca853ff-15c7-4a89-a7b9-3ba993fa99bb" />
