#####################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 01/10/2023 02:20:55
#
#####################################################################


read_mmmc ./syn/dsm_dem.mmmc.tcl

read_physical -lef {}

read_netlist ./syn/dsm_dem.v

init_design -skip_sdc_read
