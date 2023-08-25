

set synopsys_auto_setup true

# Formality Setup File
set_svf "/home/IC/Debouncer_2/syn/default.svf"

######################## Read Reference technology libs ######################## 
 
lappend search_path /home/IC/std_cells
lappend search_path /home/IC/Debouncer_2/RTL
lappend search_path /home/IC/Debouncer_2/syn

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

########################  Read Reference Design Files ######################## 
read_verilog -container Ref "sync.v"
read_verilog -container Ref "debouncer_2.v"
read_verilog -container Ref "debouncer_2_sync.v"

######################## set the top Reference Design ######################## 

set_reference_design debouncer_2_sync
set_top debouncer_2_sync

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "debouncer_gate_level.v"

####################  set the top Implementation Design ######################

set_implementation_design debouncer_2_sync
set_top debouncer_2_sync


######################## matching Compare points #############################

match

################################### verify ################################### 

verify

############################### Reporting ####################################
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"

start_gui
