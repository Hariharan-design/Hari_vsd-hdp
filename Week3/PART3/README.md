# Week 3 – Post-Synthesis GLS & STA Fundamentals

## Steps

1. **Load your synthesized netlist and constraints into OpenSTA.**  
   - Launch OpenSTA and load the necessary files:  
     ```tcl
     read_lib typical.lib
     read_verilog synth_netlist.v
     read_sdc constraints.sdc
     set_top top_module_name
     link_design
     update_timing
     ```

2. **Generate timing graphs (setup/hold paths, slack, etc.).**  
   - Use OpenSTA commands to generate timing reports and identify critical paths:  
     ```tcl
     report_timing -sort_by_slack -n 5 > timing_report.txt
     report_checks -path_delay min_max > timing_checks.txt
     ```

3. **Capture at least one timing report and corresponding graph.**  
   - Take screenshots of the outputs including your **user ID** and **timestamp**:  
     ```bash
     whoami
     date
     ```
   - Example: screenshot of `report_timing` showing the critical path and slack.
