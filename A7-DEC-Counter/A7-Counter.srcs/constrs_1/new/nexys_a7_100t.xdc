## Configuration Properties
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

## Clock Signal
# 100 MHz clock input from onboard oscillator
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports clk_i]; # IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -period 10.0 -name sys_clk [get_ports clk_i]

## Compression and SPI Bus Width for Bitstream
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

## Buttons
# Active-low reset button
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports rstn_i]; # IO_L3P_T0_DQS_AD1P_15 Sch=cpu_resetn

## 7-Segment Display Segments
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[0]]; # IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN R10 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[1]]; # IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[2]]; # IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[3]]; # IO_L7P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[4]]; # IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[5]]; # IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[6]]; # IO_L4P_T0_D04_14 Sch=cg
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports disp_seg_o[7]]; # IO_L19N_T3_A21_VREF_15 Sch=dp

## 7-Segment Display Anodes
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[0]]; # IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[1]]; # IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN T9  IOSTANDARD LVCMOS33 } [get_ports disp_an_o[2]]; # IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[3]]; # IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[4]]; # IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[5]]; # IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN K2  IOSTANDARD LVCMOS33 } [get_ports disp_an_o[6]]; # IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports disp_an_o[7]]; # IO_L23N_T3_A02_D18_14 Sch=an[7]

## LEDs
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports led_o[0]]; # IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports led_o[1]]; # IO_L24P_T3_RS1_15 Sch=led[1]
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports led_o[2]]; # IO_L17N_T2_A25_15 Sch=led[2]
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports led_o[3]]; # IO_L8P_T1_D11_14 Sch=led[3]
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports led_o[4]]; # IO_L7P_T1_D09_14 Sch=led[4]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports led_o[5]]; # IO_L18N_T2_A11_D27_14 Sch=led[5]
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports led_o[6]]; # IO_L17P_T2_A14_D30_14 Sch=led[6]
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports led_o[7]]; # IO_L18P_T2_A12_D28_14 Sch=led[7]
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports led_o[8]]; # IO_L16N_T2_A15_D31_14 Sch=led[8]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports led_o[9]]; # IO_L14N_T2_SRCC_14 Sch=led[9]
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports led_o[10]]; # IO_L22P_T3_A05_D21_14 Sch=led[10]
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports led_o[11]]; # IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[11]
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports led_o[12]]; # IO_L16P_T2_CSI_B_14 Sch=led[12]
set_property -dict { PACKAGE_PIN V14 IOSTANDARD LVCMOS33 } [get_ports led_o[13]]; # IO_L22N_T3_A04_D20_14 Sch=led[13]
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports led_o[14]]; # IO_L20N_T3_A07_D23_14 Sch=led[14]
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports led_o[15]]; # IO_L21N_T3_DQS_A06_D22_14 Sch=led[15]

## Switches
#set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports sw[0]];
#set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports sw[1]];
#set_property -dict { PACKAGE_PIN M13 IOSTANDARD LVCMOS33 } [get_ports sw[2]];
#set_property -dict { PACKAGE_PIN R15 IOSTANDARD LVCMOS33 } [get_ports sw[3]];
#set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports sw[4]];
#set_property -dict { PACKAGE_PIN T18 IOSTANDARD LVCMOS33 } [get_ports sw[5]];
#set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports sw[6]];
#set_property -dict { PACKAGE_PIN R13 IOSTANDARD LVCMOS33 } [get_ports sw[7]];
