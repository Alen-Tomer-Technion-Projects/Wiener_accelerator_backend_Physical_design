# Adaptations are listed in README.md. Run from this mode's work directory.
set corner "slow_setup"
set si_enable_analysis true

set search_path {
    /tools/kits/TSMCPDK/TSMC65/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lplvt_220a/
    /tools/kits/TSMCPDK/TSMC65/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tpdn65lpnv2od3_200a/
}
set link_path "* tcbn65lplvtwc.db tpdn65lpnv2od3wc.db"

read_verilog ../datain/top_post_layout.v
link_design top > ../logfile/link_setup_${corner}.log
source ../datain/top.sdc > ../report/read_sdc_setup_${corner}.rpt
check_timing -verbose > ../report/check_timing_setup_${corner}.rpt

set read_parasitics_load_locations true
read_parasitics -format SPEF -verbose ../datain/top_slow.SPEF > ../report/read_parasitics_setup_${corner}.rpt

set_propagated_clock [get_clocks *]
update_timing -full
report_timing -delay_type max -max_paths 30 -path_type full_clock -derate -nosplit > ../report/SETUP_${corner}_TIMING
