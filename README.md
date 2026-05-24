# Simple-Vending-Machine-FSM-in-Verilog
Simple Vending Machine FSM made using Verilog.

This is my first independent project in Verilog. 

## Inputs and Outputs

### Inputs to the FSM
#### User inputs
1) 3 Product select buttons
2) 1 Cancel button

#### Sensor inputs
1) Payment status
2) Dispensing status
3) Product availability status

### Outputs by the FSM
The FSM outputs signals required for product dispense.

## State Diagram
<p align="center"><img src="images/state_diagram.jpeg" width="400">
</p>

The states are - 
S0 - Idle
S1, S2, S3 - Product selected, awaiting payment
S4, S5, S6 - Dispensing product


## Instructions to simulate FSM
In terminal, with Icarus Verilog Installed on your device, go to the folder containing the files using cd command, then run-
```bash
iverilog -o vmsim vm.v tb_vm.v
vvp vmsim
```
