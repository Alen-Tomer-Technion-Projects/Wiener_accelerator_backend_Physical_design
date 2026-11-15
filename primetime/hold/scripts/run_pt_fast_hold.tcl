# Adaptations are listed in README.md. Run from this mode's work directory.
set corner "fast_15_OCV"
set si_enable_analysis true

set search_path {
    /tools/kits/TSMCPDK/TSMC65/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lplvt_220a/
    /tools/kits/TSMCPDK/TSMC65/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tpdn65lpnv2od3_200a/
}
set link_path "* tcbn65lplvtbc.db tpdn65lpnv2od3bc.db"

read_verilog ../datain/top_post_layout.v
link_design top > ../logfile/link_hold_${corner}.log
source ../datain/top.sdc > ../report/read_sdc_hold_${corner}.rpt
check_timing -verbose > ../report/check_timing_hold_${corner}.rpt

set read_parasitics_load_locations true
read_parasitics -format SPEF -verbose ../datain/top_fast.SPEF > ../report/read_parasitics_hold_${corner}.rpt

set_timing_derate -data -late 1.15
set_timing_derate -clock -late 1.15
set_timing_derate -clock -early 0.85
set_timing_derate -data -early 0.85

set_propagated_clock [get_clocks *]
update_timing -full
report_timing -delay_type min -max_paths 30 -path_type full_clock -derate -nosplit > ../report/HOLD_${corner}_TIMING
