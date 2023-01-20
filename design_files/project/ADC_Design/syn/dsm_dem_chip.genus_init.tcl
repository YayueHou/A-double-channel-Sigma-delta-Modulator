#####################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 01/09/2023 23:40:53
#
#####################################################################


read_mmmc ./syn/dsm_dem_chip.mmmc.tcl

read_physical -lef {}

read_netlist ./syn/dsm_dem_chip.v

init_design -skip_sdc_read
