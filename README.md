# VHDL Unintended Latch Bug
This repository demonstrates a common but subtle error in VHDL: unintended latches created by incomplete process sensitivity lists.  The `bug.vhdl` file contains code with this issue. The solution is shown in `bugSolution.vhdl`.

**Problem:** The original VHDL code incorrectly handles combinatorial logic. The `data_out` signal is assigned within a process that only includes `clk` and `rst` in its sensitivity list.  This means `data_out` only updates on a clock edge or reset;  it isn't directly driven by changes in `data_in`.  This results in an implicit latch retaining the previous value of `data_in` between clock cycles, which is often unintentional. 

**Solution:** The solution correctly assigns `data_out` in a combinatorial process (or outside a process).