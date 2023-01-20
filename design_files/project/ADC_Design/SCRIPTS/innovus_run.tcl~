floorPlan -r 1 0.7 16 16 16 16
globalNetConnect VDD -type pgpin -pin VDD -inst * -verbose
globalNetConnect VSS -type pgpin -pin VSS -inst * -verbose
globalNetConnect VDD -type tiehi -verbose
globalNetConnect VSS -type tielo -verbose


addRing -nets {VDD VSS} -width 0.6 -spacing 1 -layer [list top 7 bottom 7 left 6 right 6]
addStripe -nets {VSS VDD} -layer 6 -direction vertical -width 0.4 -spacing 1 -set_to_set_distance 10 -start 1
addStripe -nets {VSS VDD} -layer 7 -direction horizontal -width 0.4 -spacing 1 -set_to_set_distance 10 -start 1   
sroute -nets {VDD VSS}
checkDesign -all
