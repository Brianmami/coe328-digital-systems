# COE 328 Lab 4 – Decoders, Encoders and Multiplexers

**Course:** COE 328 – Digital Systems  
**Tools:** VHDL + block diagrams, Intel Quartus Prime

## Overview

Combinational building blocks written in VHDL and used in schematics:

- `decoder/` – binary decoder (`decod.vhd`) and the modified decoder schematic
- `encoder/` – priority/binary encoder (`encod.vhd`)
- `mux/` – 4-to-1 multiplexer (`mux4to1.vhd`, `muxfile.vhd`) and the modified mux schematic

## Build / run

Open the `.qpf` project (or create one and add the `.vhd`/`.bdf` files) in Intel Quartus Prime, compile, then program the Altera DE2 board or simulate with the `.vwf` waveform file.
