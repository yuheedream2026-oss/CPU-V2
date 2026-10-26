# CPU-V2
The second version of my first-year college CPU design
- including ALU, RegisterFile, Control Unit, instruction Memories and test-bench.

improvements in version 2:
1. Simplified the design of the Register File module. The design simplifies the storage of 4-bit data—previously handled as individual 1-bit units—by storing all 4 bits together. It consists of a top-level Register File module and four sub-modules: R0, R1, R2, and R3.
2. Combined the always blocks in the Register File, Instruction Memories and the Control Unit modules. Avoids the issues that can arise when multiple modules in a generic synthesis phase drive the same variable.
3. Synchronized the trigger timing of the clocks.The updates to the state, PC, and registers are all synchronized to the rising edge of the clock (clk).
4. Optimized the trigger logic for reset. In the top module, two signals—`resetReg` and `resetCtrl`—are created. These are connected to the registers and the PC/state logic, respectively, allowing for independent control over the resetting of the registers and the resetting of the PC and state.
5. generic synthesis completed.
   -0 check problems,
   no latches, 20 flip-flops, 127 combinational cells, 24 ports
   (58 port bits).
7. Openroad synthesis still working.
