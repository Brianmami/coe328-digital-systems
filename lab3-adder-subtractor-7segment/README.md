# COE 328 Lab 3 – Adder/Subtractor Unit with 7-Segment Display

**Course:** COE 328 – Digital Systems  
**Tools:** VHDL + block diagrams, Intel Quartus Prime, DE2 board

## Overview

Builds an add/subtract unit (`ASU.vhd`) and drives the result onto 7-segment displays through BCD-to-7-segment decoders (`seg7.vhd`, `sseg.vhd`). The top-level schematics (`Block1.bdf`, `Block2.bdf`, `CombinedASU2.bdf`) wire the components together.

## Build / run

Open the `.qpf` project (or create one and add the `.vhd`/`.bdf` files) in Intel Quartus Prime, compile, then program the Altera DE2 board or simulate with the `.vwf` waveform file.
