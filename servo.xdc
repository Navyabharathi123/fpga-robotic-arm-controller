# Clock
set_property PACKAGE_PIN G11 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]

## UART RX
set_property PACKAGE_PIN N10 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]

## Servo outputs
set_property PACKAGE_PIN E2 [get_ports servo1]
set_property PACKAGE_PIN D2 [get_ports servo2]
set_property PACKAGE_PIN B1 [get_ports servo3]

set_property IOSTANDARD LVCMOS33 [get_ports servo1]
set_property IOSTANDARD LVCMOS33 [get_ports servo2]
set_property IOSTANDARD LVCMOS33 [get_ports servo3]