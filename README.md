# Wiener Accelerator - Backend Flow Examples

This repository contains only selected code examples reproduced in **TSMC65Flow_1_7_25.pdf**,
with limited project adaptations. Page references below use the printed page numbers.

Project RTL, testbenches, netlists, screenshots, results, private notes and source inventories are excluded.
The PDF and licensed technology libraries are not distributed here.

## Included examples

| File | PDF pages | Scope / adaptation |
|---|---|---|
| [Gate-to-gate LEC](lec_gvg/scripts/hier_gvg_do_file) | 47-48 | Same comparison flow; third scan chain removed for a two-chain design. |
| [Clock source](innovus/scripts/clock_tree_source.tcl) | 30 | I5 changed to I7. This is only the source declaration, not the full ccopt.tcl. |
| [Post-route optimization](innovus/scripts/post_route_optimization.tcl) | 33 | Analysis mode and two optimization commands printed in the guide. |
| [RC extraction](innovus/scripts/xt.tcl) | 33 | SlowRC and FastRC SPEF extraction commands. |
| [Timing-netlist export](innovus/scripts/export_timing_netlist.tcl) | 40 | Export with power/ground removed for timing analysis. |
| [Setup analysis](primetime/setup/scripts/run_pt_slow_setup.tcl) | 40 | Slow-library, maximum-delay analysis example. |
| [Hold analysis](primetime/hold/scripts/run_pt_fast_hold.tcl) | 41-42 | Fast-library, minimum-delay analysis with the printed 15% derates. |
| [Filler insertion](innovus/scripts/fill.tcl) | 46 | FILL64LVT through FILL1LVT commands. |
| [Final export](innovus/scripts/export_final.tcl) | 46-47 | Case-name normalization, final Verilog and GDS export. |

## Using the examples

Use the guide's working-directory layout: scripts are sourced from the corresponding work directory,
with sibling datain, dataout, report and logfile directories. Supply the netlists, SDC, SPEFs and libraries privately.
These are selected examples, not a complete automated backend flow. They have not been executed in commercial EDA tools here.

- Conformal: launch `lec -ECOGXL` from lec_gvg/work, then use `dofile ../scripts/hier_gvg_do_file`.
- PrimeTime: launch a fresh `pt_shell` from primetime/setup/work or primetime/hold/work and source its corresponding script.
- Innovus: source each applicable example at the stage specified by the guide. The clock-source fragment does not perform CTS.
- Prepare the two LEC netlist copies as directed on page 47; keep the physical implementation inputs separate.
- Run the guide's DRC/connectivity checks after filler insertion. Export only the intended final design revision.

## Adaptations to the printed code

PDF line wraps are repaired into valid Tcl command continuations. The LEC example uses two scan chains;
the clock-source fragment uses I7/I1/C. PrimeTime examples use the explicit top name `top`, complete command/option names,
`get_clocks` for the clock collection, and the plural application-variable spelling `read_parasitics_load_locations`.
The library search paths are grouped as a Tcl list and `*` is included in the link search list.
Corner labels identify setup/hold reports; the actual libraries and operating conditions determine PVT.
No additional diagnostics, session-saving commands or implementation checkpoints have been added.

Every implementation command in the retained examples derives from the PDF examples above; the adaptations are listed here.
No license for third-party libraries or the manual is implied by their names appearing in these examples.
