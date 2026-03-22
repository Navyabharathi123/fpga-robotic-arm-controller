# FPGA-Based Robotic Arm Controller
FPGA-based multi-servo robotic arm using Verilog and UART
## Overview
This project implements a multi-servo robotic arm controller using Spartan-7 FPGA.  
It enables real-time control of servo motors using PWM signals and allows remote operation through UART communication without using a microcontroller.

---

## Features
- Real-time PWM-based servo control  
- UART communication for remote commands  
- Python GUI for user interaction  
- Low power consumption (0.024W)  
- Optimized hardware utilization (<1%)  

---

## Technologies Used
- Verilog HDL  
- Xilinx Vivado  
- Spartan-7 FPGA  
- Python (GUI)  

---

##  Project Structure
src/
 ├── pwm_controller.v
 ├── uart_module.v
 └── top_module.v

constraints/
 └── design.xdc

python-file/
 └── gui-python.py

---

## Working
1. User gives input through Python GUI  
2. Data is sent via UART  
3. FPGA processes input  
4. PWM signals control servo motors  

---

## Applications
- Industrial automation  
- Robotic systems  
- Safety-critical applications  

---

## Author
Navya Bharathi Vellanki
