// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="kernel2,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7k160t-fbg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.365000,HLS_SYN_LAT=2049,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=3,HLS_SYN_FF=192,HLS_SYN_LUT=254,HLS_VERSION=2019_1}" *)

module kernel2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        a_address0,
        a_ce0,
        a_q0,
        a_address1,
        a_ce1,
        a_we1,
        a_d1,
        a_q1
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_pp0_stage0 = 5'd8;
parameter    ap_ST_fsm_state6 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [10:0] a_address0;
output   a_ce0;
input  [31:0] a_q0;
output  [10:0] a_address1;
output   a_ce1;
output   a_we1;
output  [31:0] a_d1;
input  [31:0] a_q1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[10:0] a_address0;
reg a_ce0;
reg[10:0] a_address1;
reg a_ce1;
reg a_we1;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg  signed [31:0] a0_1_reg_84;
reg  signed [31:0] a0_0_reg_94;
reg   [11:0] i_0_reg_104;
reg   [31:0] a1_1_reg_116;
reg   [31:0] a0_reg_161;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln10_fu_127_p2;
reg   [0:0] icmp_ln10_reg_186;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state4_pp0_stage0_iter0;
wire    ap_block_state5_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [31:0] tmp_fu_139_p2;
reg   [31:0] tmp_reg_190;
reg    ap_enable_reg_pp0_iter0;
wire   [11:0] i_fu_145_p2;
reg   [11:0] i_reg_196;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state4;
reg    ap_enable_reg_pp0_iter1;
reg  signed [31:0] ap_phi_mux_a0_1_phi_fu_87_p4;
wire    ap_block_pp0_stage0;
reg  signed [31:0] ap_phi_mux_a0_0_phi_fu_97_p4;
reg   [11:0] ap_phi_mux_i_0_phi_fu_108_p4;
reg   [31:0] ap_phi_mux_a1_1_phi_fu_120_p4;
wire   [63:0] zext_ln13_fu_151_p1;
wire   [31:0] mul_ln12_fu_133_p2;
wire    ap_CS_fsm_state6;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state4) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state4))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state4);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state3)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        a0_0_reg_94 <= a0_1_reg_84;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        a0_0_reg_94 <= a0_reg_161;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        a0_1_reg_84 <= a1_1_reg_116;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        a0_1_reg_84 <= a_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        a1_1_reg_116 <= tmp_reg_190;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        a1_1_reg_116 <= a_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_0_reg_104 <= i_reg_196;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        i_0_reg_104 <= 12'd3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        a0_reg_161 <= a_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln10_fu_127_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_196 <= i_fu_145_p2;
        tmp_reg_190 <= tmp_fu_139_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln10_reg_186 <= icmp_ln10_fu_127_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        a_address0 = 64'd1;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        a_address0 = 64'd0;
    end else begin
        a_address0 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        a_address1 = zext_ln13_fu_151_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        a_address1 = 64'd2;
    end else begin
        a_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        a_ce0 = 1'b1;
    end else begin
        a_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        a_ce1 = 1'b1;
    end else begin
        a_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        a_we1 = 1'b1;
    end else begin
        a_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln10_fu_127_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state4 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
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
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_a0_0_phi_fu_97_p4 = a0_1_reg_84;
    end else begin
        ap_phi_mux_a0_0_phi_fu_97_p4 = a0_0_reg_94;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_a0_1_phi_fu_87_p4 = a1_1_reg_116;
    end else begin
        ap_phi_mux_a0_1_phi_fu_87_p4 = a0_1_reg_84;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_a1_1_phi_fu_120_p4 = tmp_reg_190;
    end else begin
        ap_phi_mux_a1_1_phi_fu_120_p4 = a1_1_reg_116;
    end
end

always @ (*) begin
    if (((icmp_ln10_reg_186 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_i_0_phi_fu_108_p4 = i_reg_196;
    end else begin
        ap_phi_mux_i_0_phi_fu_108_p4 = i_0_reg_104;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
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
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln10_fu_127_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln10_fu_127_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_d1 = tmp_reg_190;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign i_fu_145_p2 = (ap_phi_mux_i_0_phi_fu_108_p4 + 12'd1);

assign icmp_ln10_fu_127_p2 = ((ap_phi_mux_i_0_phi_fu_108_p4 == 12'd2048) ? 1'b1 : 1'b0);

assign mul_ln12_fu_133_p2 = ($signed(ap_phi_mux_a0_1_phi_fu_87_p4) * $signed(ap_phi_mux_a0_0_phi_fu_97_p4));

assign tmp_fu_139_p2 = (mul_ln12_fu_133_p2 + ap_phi_mux_a1_1_phi_fu_120_p4);

assign zext_ln13_fu_151_p1 = i_0_reg_104;

endmodule //kernel2
