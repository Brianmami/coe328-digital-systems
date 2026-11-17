# COE 328 Lab 5 – Johnson Counter and Mealy State Machine

**Course:** COE 328 – Digital Systems  
**Tools:** VHDL, Intel Quartus Prime, DE2 board

## Overview

Sequential logic lab:

- `part1/` – a 3-bit Johnson (twisted-ring) counter on a falling clock edge with reset and enable (`johns.vhd`), shown on a 7-segment display
- `part2/` – a Mealy finite state machine (`mealy.vhd`) with 7-segment output

## Build / run

Open the `.qpf` project (or create one and add the `.vhd`/`.bdf` files) in Intel Quartus Prime, compile, then program the Altera DE2 board or simulate with the `.vwf` waveform file.

## Notes

The original design displayed the digits of my student number. For this public copy they have been replaced with the placeholder sequence 1–9 (`123456789`).
