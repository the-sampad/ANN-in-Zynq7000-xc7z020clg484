// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Apr 26 13:13:40 2024
// Host        : JARVIS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Major_Project/zynet_Project_incorporated_OLED/MLP_oled/MLP_oled.srcs/sources_1/bd/design_1/ip/design_1_mlp_oled_0_1/design_1_mlp_oled_0_1_stub.v
// Design      : design_1_mlp_oled_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "zyNet,Vivado 2018.2" *)
module design_1_mlp_oled_0_1(s_axi_aclk, s_axi_aresetn, axis_in_data, 
  axis_in_data_valid, axis_in_data_ready, s_axi_awaddr, s_axi_awprot, s_axi_awvalid, 
  s_axi_awready, s_axi_wdata, s_axi_wstrb, s_axi_wvalid, s_axi_wready, s_axi_bresp, 
  s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arprot, s_axi_arvalid, s_axi_arready, 
  s_axi_rdata, s_axi_rresp, s_axi_rvalid, s_axi_rready, intr, btnR, btnC, btnD, btnU, oled_sdin, 
  oled_sclk, oled_dc, oled_res, oled_vbat, oled_vdd, led)
/* synthesis syn_black_box black_box_pad_pin="s_axi_aclk,s_axi_aresetn,axis_in_data[7:0],axis_in_data_valid,axis_in_data_ready,s_axi_awaddr[4:0],s_axi_awprot[2:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[4:0],s_axi_arprot[2:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,intr,btnR,btnC,btnD,btnU,oled_sdin,oled_sclk,oled_dc,oled_res,oled_vbat,oled_vdd,led[7:0]" */;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [7:0]axis_in_data;
  input axis_in_data_valid;
  output axis_in_data_ready;
  input [4:0]s_axi_awaddr;
  input [2:0]s_axi_awprot;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [3:0]s_axi_wstrb;
  input s_axi_wvalid;
  output s_axi_wready;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [4:0]s_axi_araddr;
  input [2:0]s_axi_arprot;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  output intr;
  input btnR;
  input btnC;
  input btnD;
  input btnU;
  output oled_sdin;
  output oled_sclk;
  output oled_dc;
  output oled_res;
  output oled_vbat;
  output oled_vdd;
  output [7:0]led;
endmodule
