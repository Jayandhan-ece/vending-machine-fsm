# Vending-Machine-FSM-using-Verilog-HDL
FSM-based Multi-Product Vending Machine with Automatic Change Generation in Verilog HDL 

## Interface & FSM Overview
- **Inputs:** `Clk`, `rst`, `coin_valid`, `coin_in [4:0]`, `prod_sel_a`, `prod_sel_b`
- **Outputs:** `dispense_a`, `dispense_b`, `change_out [4:0]`
- **FSM States:** `S_IDLE`, `S_ACCUM`, `S_CHECK`, `S_DISPENSE`, and `S_CHANG` (`S_CHANGE`)

## Repository Files
- `vending_machine.v` — Synthesizable Verilog RTL design for the FSM vending machine
- `tb_vending_machine.v` — Simulation testbench verifying normal, boundary, and corner cases
- `vending_constraints.xdc` — Pin and I/O constraints for the Artix-7 target
- `vending_machine.bit` — Generated FPGA bitstream
- `System Block Diagram.pdf` — Top-level input/output block diagram
- `FSM State Diagram.pdf` — State transition diagram for vending and change logic
- Vivado Bitstream Screenshot — Proof of synthesis, implementation, and `write_bitstream` completion on `xc7a100tcsg324-1`
