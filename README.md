# CPU-V2
The second version of my first-year college CPU design
- including ALU, RegisterFile, Control Unit, instruction Memories and test-bench.

improvements in version 2:
1. Simplified the design of the Register File module. The design simplifies the storage of 4-bit data—previously handled as individual 1-bit units—by storing all 4 bits together. It consists of a top-level Register File module and four sub-modules: R0, R1, R2, and R3.
2. Combined the always blocks in the Register File, Instruction Memories and the Control Unit modules. Avoids the issues that can arise when multiple modules in a generic synthesis phase drive the same variable.
3. Synchronized the trigger timing of the clocks.
4. Optimized the trigger logic for reset.
5. generic synthesis completed.
6. Openroad synthesis still working.
