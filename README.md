# Table of content
- Introduction
- Description
- Debouncer architecture
- List of files

# Introduction
In digital systems, buttons and mechanical switches are frequently utilized as input devices. Digital logic levels, represented by the electrical impulses that are produced when a button is pressed or released (0s and 1s). However, buttons can cause unintentional noise or bouncing effects because of their mechanical nature.

The quick change in the electrical connections of a button as they come into touch with one another or break apart is known as "button bouncing." This bouncing, even when the button is hit or released only once, can result in several quick transitions of the signal from high to low or low to high within a little amount of time as shown in the below figure. This phenomenon of bouncing can cause digital circuitry to provide inaccurate or untrustworthy signals.

![Button bouncing issue](https://github.com/FatmaAli99/Photos/blob/main/bouncing_problem.jpg)

A debouncer circuit's goal is to reduce or completely remove the effects of button bouncing. It guarantees that for every button press or release event, only one clean and stable logic level is generated. By filtering out the bouncing noise, the debouncer circuit produces a consistent and reliable digital signal.

There are various techniques to implement a debouncer circuit, but the basic principle involves introducing a delay or holding period after the button state changes which known as delayed detection technique. During this delay period, any bouncing effects are ignored, and the circuit waits for the button signal to stabilize. Once the delay period elapses without any further bouncing, the debouncer circuit registers the button's final state.

# Description
- debouncer circuit using delayed detection technique
- system has Positive edge clock and asynchronous negative edge reset
- two stages synchronizer is added at the input
- timer circuit is used for the delay calculation using counter
- the idle output signal from the button is 0
- when the button is pressed so the output signal becomes 1 

![Debouncer block diagram](https://github.com/FatmaAli99/Photos/blob/main/debouncer_block_diagarm.PNG)

| parameter  | description |
| ------------- | ------------- |
| num_stages  | the number of flip/flops used in the synchronizer  |
| counter_final_value  | the required final value for the counter in the timer circuit that corresponding to the needed delay  |

| signal | width | direction | description |
| :---: | :---: | :---: | :---: |
| clk | 1 | input | Positive edge system clock |
| rst_n | 1 | input | Asynchronous negative edge system reset |
| noisy_in | 1 | input | Input signal suffering from button bouncing |
| debouncer_out | 1 | output | Debounced output signal |

# Debouncer architecture
![Debouncer architecture](https://github.com/FatmaAli99/Photos/blob/main/debouncer_arch.PNG)

## Synchronizer
![sync block](https://github.com/FatmaAli99/Photos/blob/main/sync_block.PNG)

| parameter  | description |
| ------------- | ------------- |
| num_stages  | the number of flip/flops used |

| signal | width | direction | description |
| :---: | :---: | :---: | :---: |
| clk | 1 | input | Positive edge system clock |
| rst_n | 1 | input | Asynchronous negative edge system reset |
| in_sig | 1 | input | the input signal suffering from button bouncing without synchronization |
| out_sig | 1 | output |  the input signal suffering from button bouncing after synchronization |

In the context of debouncing buttons, a synchronizer is often used as an additional component to improve the reliability of the debouncing circuit. Its primary purpose is to avoid metastability issues that can occur when two asynchronous signals, such as the button signal and the clock signal, interact.

Metastability is a phenomenon that can occur in digital circuits when a signal changes near the edge of a clock cycle. It can result in an uncertain or unpredictable output, which may lead to incorrect behavior of the circuit. When a button signal is used directly without synchronization, metastability can occur if the button signal changes near the clock edge. here we use two stages synchronizer.

## timer
![timer block](https://github.com/FatmaAli99/Photos/blob/main/timer_block.PNG)

| parameter  | description |
| ------------- | ------------- |
| counter_final_value  | the required final value for the counter corresponding to the needed delay |

| signal | width | direction | description |
| :---: | :---: | :---: | :---: |
| clk | 1 | input | Positive edge system clock |
| rst_n | 1 | input | Asynchronous negative edge system reset |
| timer_en | 1 | input | enable signal to start counting |
| timer_done | 1 | output | output flag tells the FSM whether it finish counting the targeted delay or not |

A timer circuit is employed to measure the desired delay by utilizing a counter to convey the necessary delay information to the Finite State Machine (FSM). In the current operational setup with a clock frequency of 100 MHz and a corresponding clock period of 10 ns, the target delay is assumed to be 1000 ns. Therefore, the counter is configured to count 100 clock cycles, ranging from 0 to 99, in order to achieve the specified delay duration.

## Finite state machine (FSM)
![FSM block](https://github.com/FatmaAli99/Photos/blob/main/FSM_block.PNG)

| signal | width | direction | description |
| :---: | :---: | :---: | :---: |
| clk | 1 | input | Positive edge system clock |
| rst_n | 1 | input | Asynchronous negative edge system reset |
| sync_sig | 1 | input | Input signal suffering from button bouncing after synchronization |
| timer_done | 1 | input | input flag tells the FSM whether the timer finish counting the targeted delay or not |
| debouncer_out | 1 | output | Debounced output signal |
| timer_en | 1 | input | output enable signal to the timer to start counting |

A Finite State Machine (FSM) is a mathematical model used to represent and control system behavior. It consists of a finite number of states, transitions between these states, and actions associated with the transitions. The role of an FSM is to define the behavior and logic of a system by responding to inputs and changing states accordingly. 

It has two types, mealy FSM where the output depends on both input and current state or moore where the outputs depends only on the current state. We use moore FSM in our system. here is our system FSM state diagram:

![FSM state diagram](https://github.com/FatmaAli99/Photos/blob/main/FSM_state_diagram.PNG)

### idle 
- This is the idle state where all outputs are zeros, and if the noisy input signal is still zero, we will still be in the idle state; otherwise, we will move to the check_high state.

### check_high
- This is the state where we check if the high input signal will stay high for the targeted delay or not, so the debouncer_out is low as we still check if it is a high signal or just a glitch, but timer_en becomes high to enable the timer circuit to start calculating the delay.

- If the noisy input signal becomes low, it was just a glitch, so we move again to the idle state.

- If the noisy input signal is still high but the timer_done input from the timer circuit is low, the targeted delay has not passed yet, so stay in the check_high state as the check has not completed yet.

- If the noisy input signal is still high but the timer_done input from the timer circuit is high, the signal will stay high during the targeted delay, so we will move to the high state after ensuring that the input high signal is a real signal and not a glitch.

### high_state
- This is the state where we output high debouncer_out but timer_en becomes low as we don't need to calculate any delays here.

- If the noisy input signal becomes low, we move to the check_low state.

- If the noisy input signal is still high, we stay in the check_high state.

### check_low
- This is the state where we check if the low input signal will stay low for the targeted delay or not, so the debouncer_out is high as we still check if it is a low signal or just a glitch, but timer_en becomes high to enable the timer circuit to start calculating the delay.

- If the noisy input signal becomes high, it was just a glitch, so we move again to the high state.

- If the noisy input signal is still low but the timer_done input from the timer circuit is low, the targeted delay has not passed yet, so stay in the check_low state as the check has not completed yet.

- If the noisy input signal is still low but the timer_done input from the timer circuit is high, the signal will stay low during the targeted delay, so we will move to the idle state after ensuring that the input low signal is a real signal and not a glitch.


# List of files
- README.md: this file
- RTL: contains TRL codes, testbench and simulation result
- syn: contains synthesis TCL script, output files from synthesis process
- formality: contatins formality TCL script, output files from formality process
- neltist schematic photos: contains neltist schematic from Design Complier and Vivado
  
