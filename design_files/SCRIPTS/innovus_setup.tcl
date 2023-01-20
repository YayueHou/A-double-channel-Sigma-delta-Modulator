set init_mmmc_file ./SCRIPTS/mmmc_setup.tcl
set init_verilog {./HDL/syn_dsm_dem.v}
set init_top_cell dsm_dem_top
set init_lef_file {./LEF/gsclib045_tech.lef ./LEF/gsclib045_macro.lef ./LEF/giolib045.lef}
set init_io_file dsm_dem_pin_new.io
set init_gnd_net "VSS"
set init_pwr_net "VDD"
init_design

