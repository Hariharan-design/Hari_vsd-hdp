# Week 3 Task – Post-Synthesis GLS & STA Fundamentals

## 🎯 Objective
To understand and perform Gate-Level Simulation (GLS) after synthesis, validate functionality, and get introduced to Static Timing Analysis (STA) concepts with practical experiments using OpenSTA.

---

## 🧭 Steps

1. **Load your synthesized netlist and constraints into OpenSTA**  
   - Launch OpenSTA and import the required files:
     ```tcl
     read_lib typical.lib
     read_verilog synth_netlist.v
     read_sdc constraints.sdc
     set_top top_module_name
     link_design
     update_timing
     ```

2. **Generate timing graphs (setup/hold paths, slack, etc.)**  
   - Use OpenSTA commands to analyze timing:
     ```tcl
     report_timing -sort_by_slack -n 5 > timing_report.txt
     report_checks -path_delay min_max > timing_checks.txt
     ```

3. **Capture at least one timing report and corresponding graph**  
   - Take screenshots showing:
     - Critical path and slack from `report_timing`
     - Setup/hold violations from `report_checks`
     - Your **user ID** and **timestamp**:
       ```bash
       whoami
       date
       ```

---

**Author:** Hariharan  
**Repository:** [Hari_vsd-hdp](https://github.com/Hariharan-design/Hari_vsd-hdp)
