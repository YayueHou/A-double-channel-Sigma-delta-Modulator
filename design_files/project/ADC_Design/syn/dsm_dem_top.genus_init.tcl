#####################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 01/09/2023 23:31:14
#
#####################################################################


read_mmmc ./syn/dsm_dem_top.mmmc.tcl

read_physical -lef {}

read_netlist ./syn/dsm_dem_top.v

init_design -skip_sdc_read
