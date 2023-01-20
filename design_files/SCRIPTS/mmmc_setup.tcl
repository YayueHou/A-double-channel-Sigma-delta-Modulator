create_rc_corner -name slow \
    -cap_table "gpdk045.extended.CapTbl" \
    -T 125

create_library_set -name lib_slow \
    -timing [list "./LIB/slow_vdd1v0_basicCells.lib"]

create_delay_corner -name delay_slow \
    -early_library_set lib_slow \
    -late_library_set lib_slow \
    -rc_corner slow

create_constraint_mode -name constraints \
    -sdc_files [list ./SDC/dsm_dem.sdc]

create_analysis_view -name analysis_slow \
    -constraint_mode constraints \
    -delay_corner delay_slow

set_analysis_view \
    -setup [list analysis_slow] \
    -hold [list analysis_slow]
