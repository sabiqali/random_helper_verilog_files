// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Array2Mat (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_fb_AWVALID,
        m_axi_fb_AWREADY,
        m_axi_fb_AWADDR,
        m_axi_fb_AWID,
        m_axi_fb_AWLEN,
        m_axi_fb_AWSIZE,
        m_axi_fb_AWBURST,
        m_axi_fb_AWLOCK,
        m_axi_fb_AWCACHE,
        m_axi_fb_AWPROT,
        m_axi_fb_AWQOS,
        m_axi_fb_AWREGION,
        m_axi_fb_AWUSER,
        m_axi_fb_WVALID,
        m_axi_fb_WREADY,
        m_axi_fb_WDATA,
        m_axi_fb_WSTRB,
        m_axi_fb_WLAST,
        m_axi_fb_WID,
        m_axi_fb_WUSER,
        m_axi_fb_ARVALID,
        m_axi_fb_ARREADY,
        m_axi_fb_ARADDR,
        m_axi_fb_ARID,
        m_axi_fb_ARLEN,
        m_axi_fb_ARSIZE,
        m_axi_fb_ARBURST,
        m_axi_fb_ARLOCK,
        m_axi_fb_ARCACHE,
        m_axi_fb_ARPROT,
        m_axi_fb_ARQOS,
        m_axi_fb_ARREGION,
        m_axi_fb_ARUSER,
        m_axi_fb_RVALID,
        m_axi_fb_RREADY,
        m_axi_fb_RDATA,
        m_axi_fb_RLAST,
        m_axi_fb_RID,
        m_axi_fb_RUSER,
        m_axi_fb_RRESP,
        m_axi_fb_BVALID,
        m_axi_fb_BREADY,
        m_axi_fb_BRESP,
        m_axi_fb_BID,
        m_axi_fb_BUSER,
        fb_offset,
        img_rows_V_read,
        img_cols_V_read,
        img_data_stream_V_din,
        img_data_stream_V_full_n,
        img_data_stream_V_write
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_pp0_stage0 = 11'd512;
parameter    ap_ST_fsm_state13 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_fb_AWVALID;
input   m_axi_fb_AWREADY;
output  [31:0] m_axi_fb_AWADDR;
output  [0:0] m_axi_fb_AWID;
output  [31:0] m_axi_fb_AWLEN;
output  [2:0] m_axi_fb_AWSIZE;
output  [1:0] m_axi_fb_AWBURST;
output  [1:0] m_axi_fb_AWLOCK;
output  [3:0] m_axi_fb_AWCACHE;
output  [2:0] m_axi_fb_AWPROT;
output  [3:0] m_axi_fb_AWQOS;
output  [3:0] m_axi_fb_AWREGION;
output  [0:0] m_axi_fb_AWUSER;
output   m_axi_fb_WVALID;
input   m_axi_fb_WREADY;
output  [7:0] m_axi_fb_WDATA;
output  [0:0] m_axi_fb_WSTRB;
output   m_axi_fb_WLAST;
output  [0:0] m_axi_fb_WID;
output  [0:0] m_axi_fb_WUSER;
output   m_axi_fb_ARVALID;
input   m_axi_fb_ARREADY;
output  [31:0] m_axi_fb_ARADDR;
output  [0:0] m_axi_fb_ARID;
output  [31:0] m_axi_fb_ARLEN;
output  [2:0] m_axi_fb_ARSIZE;
output  [1:0] m_axi_fb_ARBURST;
output  [1:0] m_axi_fb_ARLOCK;
output  [3:0] m_axi_fb_ARCACHE;
output  [2:0] m_axi_fb_ARPROT;
output  [3:0] m_axi_fb_ARQOS;
output  [3:0] m_axi_fb_ARREGION;
output  [0:0] m_axi_fb_ARUSER;
input   m_axi_fb_RVALID;
output   m_axi_fb_RREADY;
input  [7:0] m_axi_fb_RDATA;
input   m_axi_fb_RLAST;
input  [0:0] m_axi_fb_RID;
input  [0:0] m_axi_fb_RUSER;
input  [1:0] m_axi_fb_RRESP;
input   m_axi_fb_BVALID;
output   m_axi_fb_BREADY;
input  [1:0] m_axi_fb_BRESP;
input  [0:0] m_axi_fb_BID;
input  [0:0] m_axi_fb_BUSER;
input  [31:0] fb_offset;
input  [11:0] img_rows_V_read;
input  [11:0] img_cols_V_read;
output  [7:0] img_data_stream_V_din;
input   img_data_stream_V_full_n;
output   img_data_stream_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_fb_ARVALID;
reg m_axi_fb_RREADY;
reg img_data_stream_V_write;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    fb_blk_n_AR;
wire    ap_CS_fsm_state3;
reg    fb_blk_n_R;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_reg_257;
reg    img_data_stream_V_blk_n;
reg    ap_enable_reg_pp0_iter2;
reg   [0:0] exitcond_reg_257_pp0_iter1_reg;
reg   [31:0] t_V_3_reg_133;
wire  signed [31:0] img_cols_V_read_cast_fu_144_p1;
reg  signed [31:0] img_cols_V_read_cast_reg_227;
wire  signed [31:0] img_rows_V_read_cast_fu_148_p1;
reg  signed [31:0] img_rows_V_read_cast_reg_233;
wire  signed [44:0] sext_cast_fu_152_p1;
reg  signed [44:0] sext_cast_reg_238;
wire   [31:0] row_V_fu_161_p2;
reg   [31:0] row_V_reg_246;
wire    ap_CS_fsm_state2;
reg   [31:0] fb_addr_reg_251;
wire   [0:0] exitcond2_fu_156_p2;
wire   [0:0] exitcond_fu_216_p2;
wire    ap_block_state10_pp0_stage0_iter0;
reg    ap_block_state11_pp0_stage0_iter1;
reg    ap_block_state12_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] col_V_fu_221_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [7:0] fb_pix_reg_266;
wire    ap_CS_fsm_state9;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state10;
reg   [31:0] t_V_reg_122;
wire    ap_CS_fsm_state13;
wire  signed [63:0] sum_cast_fu_206_p1;
reg    ap_reg_ioackin_m_axi_fb_ARREADY;
reg    ap_sig_ioackin_m_axi_fb_ARREADY;
reg    ap_block_pp0_stage0_01001;
wire   [42:0] p_shl_fu_167_p3;
wire   [38:0] p_shl2_fu_179_p3;
wire   [43:0] p_shl_cast_fu_175_p1;
wire   [43:0] p_shl2_cast_fu_187_p1;
wire   [43:0] ret_V_fu_191_p2;
wire  signed [44:0] tmp_28_cast_fu_197_p1;
wire   [44:0] sum_fu_201_p2;
reg   [10:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_reg_ioackin_m_axi_fb_ARREADY = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state10) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state9)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state10)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state10);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state9)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_m_axi_fb_ARREADY <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            if ((ap_sig_ioackin_m_axi_fb_ARREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_fb_ARREADY <= 1'b0;
            end else if ((m_axi_fb_ARREADY == 1'b1)) begin
                ap_reg_ioackin_m_axi_fb_ARREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_216_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        t_V_3_reg_133 <= col_V_fu_221_p2;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        t_V_3_reg_133 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        t_V_reg_122 <= row_V_reg_246;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        t_V_reg_122 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_reg_257 <= exitcond_fu_216_p2;
        exitcond_reg_257_pp0_iter1_reg <= exitcond_reg_257;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond2_fu_156_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        fb_addr_reg_251 <= sum_cast_fu_206_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_reg_257 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        fb_pix_reg_266 <= m_axi_fb_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        img_cols_V_read_cast_reg_227 <= img_cols_V_read_cast_fu_144_p1;
        img_rows_V_read_cast_reg_233 <= img_rows_V_read_cast_fu_148_p1;
        sext_cast_reg_238 <= sext_cast_fu_152_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        row_V_reg_246 <= row_V_fu_161_p2;
    end
end

always @ (*) begin
    if ((exitcond_fu_216_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state10 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state10 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_156_p2 == 1'd1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_156_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_m_axi_fb_ARREADY == 1'b0)) begin
        ap_sig_ioackin_m_axi_fb_ARREADY = m_axi_fb_ARREADY;
    end else begin
        ap_sig_ioackin_m_axi_fb_ARREADY = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fb_blk_n_AR = m_axi_fb_ARREADY;
    end else begin
        fb_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_257 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        fb_blk_n_R = m_axi_fb_RVALID;
    end else begin
        fb_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_257_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        img_data_stream_V_blk_n = img_data_stream_V_full_n;
    end else begin
        img_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_reg_257_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        img_data_stream_V_write = 1'b1;
    end else begin
        img_data_stream_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_reg_ioackin_m_axi_fb_ARREADY == 1'b0) & (1'b1 == ap_CS_fsm_state3))) begin
        m_axi_fb_ARVALID = 1'b1;
    end else begin
        m_axi_fb_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_reg_257 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_fb_RREADY = 1'b1;
    end else begin
        m_axi_fb_RREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (exitcond2_fu_156_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (ap_sig_ioackin_m_axi_fb_ARREADY == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_fu_216_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_fu_216_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((exitcond_reg_257_pp0_iter1_reg == 1'd0) & (img_data_stream_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((exitcond_reg_257 == 1'd0) & (m_axi_fb_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((exitcond_reg_257_pp0_iter1_reg == 1'd0) & (img_data_stream_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((exitcond_reg_257 == 1'd0) & (m_axi_fb_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((exitcond_reg_257_pp0_iter1_reg == 1'd0) & (img_data_stream_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((exitcond_reg_257 == 1'd0) & (m_axi_fb_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state10_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state11_pp0_stage0_iter1 = ((exitcond_reg_257 == 1'd0) & (m_axi_fb_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state12_pp0_stage0_iter2 = ((exitcond_reg_257_pp0_iter1_reg == 1'd0) & (img_data_stream_V_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_V_fu_221_p2 = (t_V_3_reg_133 + 32'd1);

assign exitcond2_fu_156_p2 = ((t_V_reg_122 == img_rows_V_read_cast_reg_233) ? 1'b1 : 1'b0);

assign exitcond_fu_216_p2 = ((t_V_3_reg_133 == img_cols_V_read_cast_reg_227) ? 1'b1 : 1'b0);

assign img_cols_V_read_cast_fu_144_p1 = $signed(img_cols_V_read);

assign img_data_stream_V_din = fb_pix_reg_266;

assign img_rows_V_read_cast_fu_148_p1 = $signed(img_rows_V_read);

assign m_axi_fb_ARADDR = fb_addr_reg_251;

assign m_axi_fb_ARBURST = 2'd0;

assign m_axi_fb_ARCACHE = 4'd0;

assign m_axi_fb_ARID = 1'd0;

assign m_axi_fb_ARLEN = img_cols_V_read_cast_reg_227;

assign m_axi_fb_ARLOCK = 2'd0;

assign m_axi_fb_ARPROT = 3'd0;

assign m_axi_fb_ARQOS = 4'd0;

assign m_axi_fb_ARREGION = 4'd0;

assign m_axi_fb_ARSIZE = 3'd0;

assign m_axi_fb_ARUSER = 1'd0;

assign m_axi_fb_AWADDR = 32'd0;

assign m_axi_fb_AWBURST = 2'd0;

assign m_axi_fb_AWCACHE = 4'd0;

assign m_axi_fb_AWID = 1'd0;

assign m_axi_fb_AWLEN = 32'd0;

assign m_axi_fb_AWLOCK = 2'd0;

assign m_axi_fb_AWPROT = 3'd0;

assign m_axi_fb_AWQOS = 4'd0;

assign m_axi_fb_AWREGION = 4'd0;

assign m_axi_fb_AWSIZE = 3'd0;

assign m_axi_fb_AWUSER = 1'd0;

assign m_axi_fb_AWVALID = 1'b0;

assign m_axi_fb_BREADY = 1'b0;

assign m_axi_fb_WDATA = 8'd0;

assign m_axi_fb_WID = 1'd0;

assign m_axi_fb_WLAST = 1'b0;

assign m_axi_fb_WSTRB = 1'd0;

assign m_axi_fb_WUSER = 1'd0;

assign m_axi_fb_WVALID = 1'b0;

assign p_shl2_cast_fu_187_p1 = p_shl2_fu_179_p3;

assign p_shl2_fu_179_p3 = {{t_V_reg_122}, {7'd0}};

assign p_shl_cast_fu_175_p1 = p_shl_fu_167_p3;

assign p_shl_fu_167_p3 = {{t_V_reg_122}, {11'd0}};

assign ret_V_fu_191_p2 = (p_shl_cast_fu_175_p1 - p_shl2_cast_fu_187_p1);

assign row_V_fu_161_p2 = (t_V_reg_122 + 32'd1);

assign sext_cast_fu_152_p1 = $signed(fb_offset);

assign sum_cast_fu_206_p1 = $signed(sum_fu_201_p2);

assign sum_fu_201_p2 = ($signed(tmp_28_cast_fu_197_p1) + $signed(sext_cast_reg_238));

assign tmp_28_cast_fu_197_p1 = $signed(ret_V_fu_191_p2);

endmodule //Array2Mat