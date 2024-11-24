## Configuration Properties
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Clock Signal
# 100 MHz clock input from onboard oscillator
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports clk_i]; # IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -period 10.0 -name sys_clk [get_ports clk_i]

## Reset Button
# Active-low reset button
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports rstn_i]; # IO_L3P_T0_DQS_AD1P_15 Sch=cpu_resetn

## Switches
# 16 switches for speed control and other inputs
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports sw[0]];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports sw[1]];
set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports sw[2]];
set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports sw[3]];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports sw[4]];
set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports sw[5]];
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports sw[6]];
set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports sw[7]];
set_property -dict { PACKAGE_PIN T8  IOSTANDARD LVCMOS33 } [get_ports sw[8]];
set_property -dict { PACKAGE_PIN U8  IOSTANDARD LVCMOS33 } [get_ports sw[9]];
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports sw[10]];
set_property -dict { PACKAGE_PIN T13 IOSTANDARD LVCMOS33 } [get_ports sw[11]];
set_property -dict { PACKAGE_PIN H6  IOSTANDARD LVCMOS33 } [get_ports sw[12]];
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports sw[13]];
set_property -dict { PACKAGE_PIN U11 IOSTANDARD LVCMOS33 } [get_ports sw[14]];
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports sw[15]];

## LEDs
# Optional LEDs for debug/status
#set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports led_o[0]];
#set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports led_o[1]];
#set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports led_o[2]];
#set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports led_o[3]];
#set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports led_o[4]];
#set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports led_o[5]];
#set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports led_o[6]];
#set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports led_o[7]];

## Seven-Segment Display
# Segment outputs
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[0]]; # CA
set_property -dict { PACKAGE_PIN R10 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[1]]; # CB
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[2]]; # CC
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[3]]; # CD
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[4]]; # CE
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[5]]; # CF
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[6]]; # CG
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[7]]; # DP

# Anode outputs
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[0]];
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[1]];
set_property -dict { PACKAGE_PIN T9  IOSTANDARD LVCMOS33 } [get_ports disp_an_o[2]];
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[3]];
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[4]];
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[5]];
set_property -dict { PACKAGE_PIN K2  IOSTANDARD LVCMOS33 } [get_ports disp_an_o[6]];
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[7]];
