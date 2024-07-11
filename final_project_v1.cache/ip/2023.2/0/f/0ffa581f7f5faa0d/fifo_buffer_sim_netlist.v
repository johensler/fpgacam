// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Jul 10 14:34:04 2024
// Host        : Orcadron running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_buffer_sim_netlist.v
// Design      : fifo_buffer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_buffer,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_9 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 51472)
`pragma protect data_block
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
yA==
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
