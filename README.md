# Digital Elevator Controller (Verilog)

## Description
A finite state machine (FSM)-based digital elevator controller designed using Verilog. It supports up to 4 floors and handles multiple floor requests, door logic, and direction indication.

## Features
- 4-floor elevator system
- Prioritized floor request handling
- Door control logic
- Direction control (up/down)
- Reset logic and idle state

## Files
- `elevator_controller.v` – Main Verilog module
- `elevator_tb.v` – Testbench for simulation

## How to Simulate
Using Icarus Verilog + GTKWave:
```bash
iverilog -o sim elevator_controller.v elevator_tb.v
vvp sim
gtkwave elevator.vcd
```

## Author
hari dheeraj
