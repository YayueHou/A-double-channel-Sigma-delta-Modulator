onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test_dsm_dem/mclk512
add wave -noupdate /test_dsm_dem/clock2
add wave -noupdate /test_dsm_dem/clock4
add wave -noupdate /test_dsm_dem/reset
add wave -noupdate -expand /test_dsm_dem/dem_mode_sel_l
add wave -noupdate -expand /test_dsm_dem/dem_mode_sel_r
add wave -noupdate /test_dsm_dem/chan_left
add wave -noupdate /test_dsm_dem/chan_right
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {14599361480 ps} {14606445970 ps}
