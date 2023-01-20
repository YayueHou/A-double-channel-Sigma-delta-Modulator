# A-double-channel-Sigma-delta-Modulator
* The whole project and the .log are in /design_files/project 
* The details of how this project is going on and finished is in /A Double channel Sigma.pdf
## Modulator Discription
* This is a sigma-delta modulator used in DAC with 4 orders of dynamic element match.
* The design is divided into four layers: Adders.v, dsm_top.v, dem_top.v, dsm_dem_top.v
* The HDL files are in /design_files/HDL
### Adders.v 
Adders.v consists of 3 adders to be used in integrators of the dignal signal modulator.
### dsm_top.v
Integers are defined and constructed into a digital signal modulator in this module.
### dem_top.v
Dynamic element matching is realized by define four functions (each is one layer of matching)
### dsm_dem_top.v
Instantiation of two modules(dsm and dem)
## Working flow
### Synthesis
The synthsis tool is genus
* The script of synthesis is in /design_files/SCRIPTS/genus_run.tcl
* The constraint analysis shows no problems
* The static time analysis result is in /design_files/Time/genus_static_time_analysis_report.tarpt
* The netlist after synthesis is in /design_files/HDL/syn_dsm_dem.v
### Place-and-Route
The tool is innovus
* The mmmc_setup files, scripts are in /design_files/SCRIPTS
* The result of pre-design of clock is in /design_files/Time/innovus_timming_result.tarpt
* The result of clock tree synthsis is in /design_files/Time/clock_tree_analysis.tarpt
* The result of detail route is in /design_files./Timing/time_analysis_after_nano_routine.tarpt
* The final netlist and def are in  /design_files/result/dsm_dem_par.v and /design_files/result/dsm_dem.def 
