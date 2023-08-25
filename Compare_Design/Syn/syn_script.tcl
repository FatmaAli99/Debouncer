
########################### Define Top Module ############################
                                                   
set top_module debouncer_2_sync

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

#Add the path of the libraries to the search_path variable
lappend search_path /home/IC/std_cells
lappend search_path /home/IC/Debouncer_2/RTL

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

set file_format verilog

read_file -format $file_format sync.v
read_file -format $file_format debouncer_2.v
read_file -format $file_format $top_module.v

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################

link 

#################### Liniking All The Design Parts #########################

check_design

############################### Path groups ################################

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################

##################### Section 1 : Clock Definition #########################

set CLK_NAME clk
set CLK_PER 10
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_LAT 0
set CLK_RISE 0.05
set CLK_FALL 0.05

create_clock -name $CLK_NAME -period $CLK_PER -waveform "0 [expr $CLK_PER/2]" [get_ports clk]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_NAME]
set_clock_latency $CLK_LAT [get_clocks $CLK_NAME]
		   					   
set_dont_touch_network clk


##################### Section 2 : input/output delay on ports #########################

set in_delay  [expr 0.5*$CLK_PER]
set out_delay [expr 0.5*$CLK_PER]

#Constrain Input Paths
set_input_delay $in_delay -clock $CLK_NAME [get_port noisy_in]
set_input_delay $in_delay -clock $CLK_NAME [get_port rst_n]

#Constrain Output Paths
set_output_delay $out_delay -clock $CLK_NAME [get_port debouncer_out]


##################### Section 3 : Driving cells #########################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port noisy_in]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port rst_n]


##################### Section 4 : output load #########################

set_load 0.5 [get_port debouncer_out]

##################### Section 5 : area #########################

set_max_area  0 

##################### Section 6 : Operating Condition #########################

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

##################### Section 7 : wireload Model #########################

set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

###################### Mapping and optimization ########################

compile

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output debouncer_gate_level.v
write_file -format ddc -hierarchy -output debouncer.ddc
write_sdc  -nosplit debouncer.sdc

################# reporting #######################

report_area -hierarchy > area.rpt
report_power -hierarchy > power.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constraints.rpt

################# starting graphical user interface #######################

gui_start

#exit
