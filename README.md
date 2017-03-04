This repository contains some of the Mos 6502 assembly language code I created
when playing around with the 6502 emulator at
https://skilldrick.github.io/easy6502/

Mos 6502 was used in the Commodore 64 and NES, among many others

Paste the code into any of the assemblers on the Easy 6502 site, and click
assemble, then run. To step through the code one instruction at a time, check
the Debugger checkbox, then click Step to go to the next instruction.

If you want to see the contents of the memory, enter a starting address and a
range, and check the Monitor checkbox. From the next instruction on, you will be
able to see the contents of the memory. The output resides in the address range
$200 to $5ff in memory, and the program itself starts at $600

The 6502 instruction set is explained here:
http://www.6502.org/tutorials/6502opcodes.html