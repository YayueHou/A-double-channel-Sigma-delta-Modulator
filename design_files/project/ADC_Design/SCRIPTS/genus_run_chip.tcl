set_db init_hdl_search_path ./HDL
set_db init_lib_search_path ./LIB
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db library slow_vdd1v0_basicCells.lib
#set_db library slow.lib
read_hdl dsm_dem_top.v dem_top.v dsm_top.v adders.v
elaborate dsm_dem

gui_show
create_clock -name mclk512 -period 40 [get_pins dsm_dem0/mclk512]
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports reset] 
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports exchangeLR]
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports dsm_clr]
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports dsmditheroff]
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports dem_count]
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports dsm_chan1]
set_input_delay -clock [get_clocks mclk512] -add_delay 4 [get_ports dsm_chan2]

set_output_delay -clock [get_clocks mclk512] -add_delay 8 [get_ports dsm_ovfl]
set_output_delay -clock [get_clocks mclk512] -add_delay 8 [get_ports dem_out_l]
set_output_delay -clock [get_clocks mclk512] -add_delay 8 [get_ports dem_out_r]

set_driving_cell -lib_cell INVX12 [all_inputs]
set_load_unit -femtofarads 1.0
set_load 1 [all_outputs]
check_timing_intent
syn_generic
syn_map
write_hdl > ./HDL/syn_dsm_dem.v
write_sdc > ./SDC/dsm_dem_chip.sdc
write_design -base_name ./syn/dsm_dem_chip
