# Source: TSMC65Flow_1_7_25.pdf, printed page 33.
reset_parasitics
extractRC
rcOut -rc_corner SlowRC -spef ../dataout/eco/top_slow.SPEF
reset_parasitics
extractRC
rcOut -rc_corner FastRC -spef ../dataout/eco/top_fast.SPEF
