#####################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 01/09/2023 21:53:25
#
#####################################################################


read_mmmc ./syn/dsm_dem_top_chip.mmmc.tcl

read_physical -lef {}

read_netlist ./syn/dsm_dem_top_chip.v

init_design -skip_sdc_read
