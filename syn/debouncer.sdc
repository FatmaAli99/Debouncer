###################################################################

# Created by write_sdc on Fri Aug 25 22:46:33 2023

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_max_area 0
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports rst_n]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports noisy_in]
set_load -pin_load 0.5 [get_ports debouncer_out]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_latency 0  [get_clocks clk]
set_clock_uncertainty -setup 0.2  [get_clocks clk]
set_clock_uncertainty -hold 0.1  [get_clocks clk]
set_clock_transition -max -rise 0.05 [get_clocks clk]
set_clock_transition -min -rise 0.05 [get_clocks clk]
set_clock_transition -max -fall 0.05 [get_clocks clk]
set_clock_transition -min -fall 0.05 [get_clocks clk]
group_path -name INOUT  -from [list [get_ports clk] [get_ports rst_n] [get_ports noisy_in]]  -to [get_ports debouncer_out]
group_path -name INREG  -from [list [get_ports clk] [get_ports rst_n] [get_ports noisy_in]]
group_path -name REGOUT  -to [get_ports debouncer_out]
set_input_delay -clock clk  5  [get_ports rst_n]
set_input_delay -clock clk  5  [get_ports noisy_in]
set_output_delay -clock clk  5  [get_ports debouncer_out]
