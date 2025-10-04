iverilog -o PRE_SYNTH_SIM sp_verilog.vh sandpiper_gen.vh vsdbabysoc.v testbench.v
./PRE_SYNTH_SIM
gtkwave pre_synth_sim.vcd 


sudo mount -t vboxsf VBox ~/VBox/
