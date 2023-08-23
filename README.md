# Table of content
- Introduction
- Description
- Block Diagram
- List of files

# Introduction
In digital systems, buttons and mechanical switches are frequently utilized as input devices. Digital logic levels, represented by the electrical impulses that are produced when a button is pressed or released (0s and 1s). However, buttons can cause unintentional noise or bouncing effects because of their mechanical nature.

The quick change in the electrical connections of a button as they come into touch with one another or break apart is known as "button bouncing." This bouncing, even when the button is hit or released only once, can result in several quick transitions of the signal from high to low or low to high within a little amount of time as shown in the below figure. This phenomenon of bouncing can cause digital circuitry to provide inaccurate or untrustworthy signals.

![Button bouncing issue](https://github.com/FatmaAli99/Photos/blob/main/bouncing_problem.jpg)

A debouncer circuit's goal is to reduce or completely remove the effects of button bouncing. It guarantees that for every button press or release event, only one clean and stable logic level is generated. By filtering out the bouncing noise, the debouncer circuit produces a consistent and reliable digital signal.

There are various techniques to implement a debouncer circuit, but the basic principle involves introducing a delay or holding period after the button state changes which known as delayed detection technique. During this delay period, any bouncing effects are ignored, and the circuit waits for the button signal to stabilize. Once the delay period elapses without any further bouncing, the debouncer circuit registers the button's final state.

# Description
- Debouncer circuit using delayed detection technique
- Asynchronous negative edge reset
- Positive edge clock triggering

# Block Diagram
![Debouncer block diagram](https://github.com/FatmaAli99/UP_DOWN_COUNTER/blob/main/Block%20diagram.PNG)
| signal  | direction | | width | Description | 
| ------------- | ------------- | | ------------- | ------------- |
| Content Cell  | Content Cell  | | Content Cell  | Content Cell  | 
| Content Cell  | Content Cell  | | Content Cell  | Content Cell  |
| Content Cell  | Content Cell  | | Content Cell  | Content Cell  | 
| Content Cell  | Content Cell  | | Content Cell  | Content Cell  |


# List of files
- README.md: this file
- Up_Dn_Counter.v: RTL code (verilog)   
- Up_Dn_Counter_tb.v: testbench code (verilog)
- schematic.PNG: design schematic generated on Vivado
- Block diagram.PNG: Screenshot of the block diagram
 


