# Simple-Vending-Machine-FSM-in-Verilog
Simple Vending Machine FSM made using Verilog.

This is my first attempt of doing something on my own in Verilog. 

## Inputs and Outputs:

### Inputs to the FSM:-
#### User inputs:-
1) 3 Product select buttons
2) 1 Cancel button

#### Sensor inputs:-
1) Payment status
2) Dispensing status
3) Product availability status

### Outputs by the FSM:-
The only output by the FSM is the Dispense control signals of each product.

## State Diagram:-
<p align="center"><img src="images/state_diagram.jpeg" width="400">
</p>

The states are - 
S0 - Idle
S1, S2, S3 - Product chosen and waiting for payment
S4, S5, S6 - Dispensing product


## Working:


