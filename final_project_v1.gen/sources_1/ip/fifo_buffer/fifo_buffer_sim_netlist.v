// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Jul 10 14:34:06 2024
// Host        : Orcadron running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/hensl/OneDrive/Dokumente/RES/final_project_v1/final_project_v1.gen/sources_1/ip/fifo_buffer/fifo_buffer_sim_netlist.v
// Design      : fifo_buffer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_buffer,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module fifo_buffer
   (clk,
    rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rst;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [10:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [10:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "11" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "2kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "2046" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "2045" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "11" *) 
  (* C_RD_DEPTH = "2048" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "11" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "11" *) 
  (* C_WR_DEPTH = "2048" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "11" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_buffer_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[10:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[10:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[10:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gcDjvJ18gZEH8C+LHMq/N7AaYWSyHgvjIQn585rdUOTVX2orO9n8j6LNiga3BYkS91+lbHAjAieW
oD/8serz9uvKt9uVuyMIE6oOFFScZR6q2wQk1d1Qzq717+8yPCwgBT9HIhfJIHLujHt+cA2l2L5t
tux9aNBdVKkk1MHv7yY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
exhH3ieiewq538XhQByQWj7PMh1Y+pzdDw+4bALHgOXUMTZleYL0Pvhip/E5VwYBOb3/5i/ElWf3
Vm6OeE9b1Jj8xb7x10akeyRaNdCJYAtTqgb7gFS/crjXeoaYKJgLqCiyaB7LdWR9BiZOWqxEPSxe
/lr/8F8psti0kra2jACCbz94iU3qDIdZWH5kqd21Pp2/YczWpJBQzh+bBz9V+EuMAeZIzY3x2GZy
jOMZPemqiqFhSEcDf09mKK3xKEUxE+TPz82hd9ZrF5OjFst6mWMVye10lkzmY5Hmmx5Y/PVgPx3R
fN0tTAZfIDGH/YUu758U8UWOIcMzBHF6rytqmg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Umfm0FNxPKfdryB9QccnkcrzqkPtalTpE+R0M3D9kxaXOa1YOGT+9jGc1TRZMLcN5NyGN3UIZcH4
LWFVfGg80k9RmFHBDZaHzOXaomQhoPSO++ArXvmvO5zgttfCHEl7jypYkuPgwfQMfjK7YII9Deex
KOC8JtqORVWmhq47cpQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cm7WeJnXtFlUdJuJH7wHYfinJTaBhpglyFWD2YwmOuS4fmVA4nXbX0IMaU1F1WGO1VK25KlFf8Nm
w8L6BJ6ZpH12xPIl3J17rMT4/3KHv9tpBWqeC080GeV5nISo8JrhOpIKa4+HBHZ6lYLce8LBAu/Z
EiBmDqw22aLsAuPAzAMh9yuHT5rpX9ykD9u0uZ5UplK05S0TsvYMUqcHNQ2hijt/lbxvUxXHTa+W
GJ5RRQAdw98wG1mc65u16hfZPsLimnw4BHwpyNGOPadShqb78rQihc+YiBTn4lgN1HhquWRGqCYZ
ZEjBmtWOJm8WJSTWtcpFEkmPlOTDmNX82e9mnw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a1mMNsEVIHwFCxw3sHygQ6eU3z5whgDQI+YHUmPAwU6q4vqfu2NVxu0z42QL1rV1rCsm39SqZ078
EGEqt7XUt6bdvI3yu4dU8gF+jou5njJ2UU34VmbOw/MQt48Hmi+hxtH1/zSlbNe2iOksDFEFTHmW
WGHgPS2bACG/KtAZMYK3gBtbnb9dtu+p5hxiQtwMOFnv9kQGBxcMaciN0yqy2TE5fygwKcNEua29
jiGUF0qgPS1k6qN+zLrYWkaVT0amR1MFXpv0WcwL+xVkxj6bBQhe5D7t5xCIsfLR4xqa5WVpa0dN
FkxGlIoufL17G/cGRr4nV4QP0sqcDCCHYpRoIA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPFWI49JcHqYFxRrTG2uFixmE4jeIWIero9KijBFo7+FOCC7hJeSlCuNlwb8mBsI0Up57fm7C8t9
tb1l2QCfvy82JqTvEuH49UmS+8/GEnbK1QbVHsDIiv3/8cFn+0zw/VSuVeaN8L0yzeNIo8m59iAq
AQ9wOyqKFEhKKkbn+nVg+hQW3L/P25hisjV06sqmfsA0Rx4bYhFoxEvIw3A4x9LsBIIfDpgDsPzS
NICAEhfA7fWXKK6UsOmuq1NZLTDmFe2zEHijVMovzm/qqvHfu7fCt5POlGtLOPZhXGCDZi0v1yiq
VyT7JTUW5P/rcLgzkfyKToozq36lEkXd6VSaLg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T4EV2kKcg5a7rlvEGr4AG3uvv0JzSoc0NQb9aIeE2gsKGq0oLel4q0oZ7eO6He8noW5KEowgkY0O
xDnerk/R4qxdSePYeRRmUg3KZ7hAHVEQrHpQ2RbYwK5mUIpQLjxCWRWzBjeWOce2bh0dAMR/4OH6
t95V8b9VWpgepcUXynGvLDv31tVgr+8LtXlgWTNBiJj2mTZ3gEVxpgGRwMGsampw9yKqBKoR+/hg
++FP8JJkrOSdB2bhnNaD4fZotMLkhYDrWvQm9z6rW7fwxA2oEI+oUqi+K+82oiLzeVWy7FhVyzgS
Y273uSE53DWk35UE9A6ebcI/xUl1iGqwdeZihA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gZRrJLrBkbil4BLf1tia07NzGL28f+Pk9zyPElbTDf8NEXCsuwTum6RjR5lvY/odzAYHlcKxpG+6
gwjafT2OV5gHqqtPXrRHcVU4p5LEzOOl5p3puqvK+1z2+YpHqxOZIIZPIH9kjtzNgcBmcU7S2sFN
zTxyAYuLL9sAN+AIQ9UrW4MXDWxUtdkwPaSyFIvuKoxOKUD5IXEY9NtBpz1zsABMKNHneOO8pAix
qg8S/uQ/XJ8Qggr+vE7HDUUMCsijNXvqbkLM3xf6dXFpOqanKxd6/GfTcob4sezm/hMOZ2xiXcfS
hsYUMRdO9H6fmhECfszoK2XMsMt6xM+vlLywWJ0I6u468qVFxROkf9vL+ZDq/tMiJOm7E1p+HDif
98f5v1OybtzlZJP9bDMwWYcsCqcDejCMQyYOgPCgg+2jTR1JezxuK7PpjyliT0rnu7FfI/0tRzbL
d5YqO79RN0byWVTTdIlTWzL/qBD8BLVqXzWs3M+up46dGPxbkzv44od4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A79lFm/8JnoMxv1MOWkY+AtU24uc6/CeGf6bjoYWLJXkzzHQooKleg9l+jH7oajoC3oVQh/sMXdi
3QmwZ5SKMt6sb03SC5BW7xPky8zyP6w8FRMCI2Tz1/GhozqjIbgSstUfCaemxIgj3rG7GkRYZ/2k
ualG2mpYDNyaxz1lMYaHfm7stH/IQlkCh6HHMbi7ImYJ6pILa828Ls3VREjo7dtXPS2ZDFxreSIH
2SZ3NpLJO0/umchZaUkt1xN0bsxgtGdOzSqGDpTJrU/ltmclBX199pmrXQa5p/q0FSLj2WkB043l
l3x1Rdipn49DvChkvbVzJP9aej4kwSPhvxHnHQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GFpXmWYmUY46GvuVucUW1VOu3+gGtLxYW4Ho/p4wggZ+jWrpUVhz2RSAxu+ufiLHtM9oYgKPaSYT
DOeuIJGTnxGr20Vh6Nn3cc41TyKAf0vxN2fGISEQQWrjh9OOgNcBmJfaHsSq7+5dhCaIWlGrInVr
GD5TqclLzw6cHAuPGxMi2wD4rq16RkDJnQbPf8ptaskWz81NxZfyWAL4T2E24soybpln8+vuF+72
IQYfLQh/dDDsNHKNKwTKAtGjpFS8eVSbYnS+k3Am4loN8JRflh0+c4yGUo4EkuRzUFiIBrJOKylp
qicgwQw7vdbe+yPl6moUlvA1U2CjJ87bsXk5CA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hzklq501x4qEym07A6+Vh+O6T5Q1srpTjckVi/KQ8/P6I6xpFqHBBikoKASz9mkWuvFaf6aly934
etGfnzZuPuKCoMPixevIcq9cgFblu43p0H0FR4BSbqN+A/K2utwAblPur01qwtH9nc1azxOtPedI
3KLsEBUN2ObidzkZIUbiQlQ72wru0lGZ5uN6iiNcLRnEhqjdjWiOHf5qGo+df2QyP6S5zRR7hGOd
N5h9/9towH2UQ++6hnOd4pjtl7PKHWlU92421M+LhruDkz4Bw6c7d7EVdbIcZ3ub+l/OnCyNwQsr
WUo2E+j4vd3zIVA0gzTA1oLX73BJ1oxwQdO3JA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51392)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
