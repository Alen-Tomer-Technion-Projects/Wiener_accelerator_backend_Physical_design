# Pictures and Results

These pictures show different steps of our work. Each explanation describes what we can see in that picture.

## Our chip

This is our chip after routing. The circuit is in the middle, with the signal and power pads around it.

![Our chip layout](../assets/chip_layout.png)

## Logic equivalence check

Conformal finished with an Equivalent result. It checked one module pair, with no failed or aborted pairs. The progress bar reached 100%.

The tool used 530.98 seconds of CPU time and 492.83 Mbytes of memory in this run.

![Our logic equivalence result](../assets/results/logic_equivalence.png)

## Clock tree

This view shows how the clock branches out to the flip flops. The branches show the connections in the tree, rather than their actual locations on the chip.

![Our clock tree](../assets/results/clock_tree.png)

## Setup timing after CTS

The SlowView check found three setup violations between registers. The worst slack was negative 0.010 ns. The total negative slack was negative 0.018 ns.

![Setup timing after CTS](../assets/results/cts_setup_timing.png)

## Hold timing after CTS

The FastView hold check had no violations. The worst slack was positive 0.047 ns and the total negative slack was zero.

![Hold timing after CTS](../assets/results/cts_hold_timing.png)

## Clock net check

The clock DAG check found no net violations. This is one clock check, so we still need the other timing and layout checks too.

![Clock net check](../assets/results/cts_clock_checks.png)

## Clock delay and skew

In the shown SlowDC setup view, the smallest clock delay was 0.274 ns and the largest was 0.362 ns. The difference was 0.088 ns, which is below the 0.300 ns skew target. The average clock delay was 0.335 ns.

![Clock delay and skew](../assets/results/cts_skew.png)

## Cells in the clock tree

The list shows five CKBD24LVT buffers, three CKBD12LVT buffers and 188 CKBD6LVT buffers. Together, these make 196 clock buffers.

There are also twelve other cells marked as dcg. Their cell names and sizes are shown in the picture.

![Cells in the clock tree](../assets/results/cts_cell_distribution.png)

## Setup optimization after routing

After this step, the setup slack was positive 0.479 ns and the total negative slack was zero. The density was 85.77%.

The command finished with 185 warnings and zero errors. The DRC results are checked separately.

![Setup optimization after routing](../assets/results/postroute_setup_optimization.png)

## Hold optimization

This picture is from the hold optimization run. The command finished with 118 warnings and zero errors.

Although this run was for hold, the timing numbers shown are labelled as setup. They show positive 0.480 ns WNS and zero TNS. We do not use these numbers as the final hold result.

![Hold optimization run](../assets/results/postroute_hold_optimization.png)

## Leakage power

The leakage estimate was 0.24418 mW. The output also shows 267.496 pF total capacitance and 26,559 instances.

Two instances have no power values and two have no activity values. The picture does not include a total dynamic power result.

![Leakage power estimate](../assets/results/leakage_power.png)

## Spacing problems near the power pads

This earlier DRC check found four M2 spacing violations near PAD_G4/I1, PAD_I4/I1, PAD_G3/I1 and PAD_I3/I1.

The selected problem has 0.500 µm spacing, while the rule requires 1.500 µm. This picture shows the problems at that stage. It does not show that they were fixed later.

![Spacing problems near the power pads](../assets/results/drc_spacing.png)

## Opening the layout in Virtuoso

This picture shows our first import settings. It was taken before we changed the Library field from tsmcN65 to EDLib.

EDLib holds our design. The tsmcN65 library provides the technology information. This picture shows the settings, rather than the finished import.

![Our first Virtuoso import settings](../assets/results/virtuoso_import.png)
