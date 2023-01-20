if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name lib_slow\
   -timing\
    [list ${::IMEX::libVar}/mmmc/slow_vdd1v0_basicCells.lib]
create_rc_corner -name slow\
   -cap_table ${::IMEX::libVar}/mmmc/gpdk045.extended.CapTbl\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -T 125
create_delay_corner -name delay_slow\
   -rc_corner slow\
   -early_library_set lib_slow\
   -late_library_set lib_slow
create_constraint_mode -name constraints\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/constraints/constraints.sdc]
create_analysis_view -name analysis_slow -constraint_mode constraints -delay_corner delay_slow -latency_file ${::IMEX::dataVar}/mmmc/views/analysis_slow/latency.sdc
set_analysis_view -setup [list analysis_slow] -hold [list analysis_slow]
