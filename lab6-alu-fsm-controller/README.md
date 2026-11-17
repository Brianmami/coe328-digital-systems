# COE 328 Lab 6 – ALU Driven by a Finite State Machine

**Course:** COE 328 – Digital Systems  
**Tools:** VHDL + block diagrams, Intel Quartus Prime, DE2 board

## Overview

An 8-bit ALU whose operation is selected by an FSM through a 4-to-16 decoder, with input latches and the result shown on two 7-segment displays.

- `part1/` – base ALU (add, subtract, NOT, …) with FSM, 3-to-8 / 4-to-16 decoders and latches
- `part2/` – second ALU function set (`ALU2.vhd`)
- `part3/` – third ALU function set (`ALU3.vhd`) with a modified 7-segment driver
- `part3.2/` – final revision of part 3

## Build / run

Open the `.qpf` project (or create one and add the `.vhd`/`.bdf` files) in Intel Quartus Prime, compile, then program the Altera DE2 board or simulate with the `.vwf` waveform file.

## Notes

The original design displayed the digits of my student number. For this public copy they have been replaced with the placeholder sequence 1–9 (`123456789`).
