// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32,
    parameter DELAYS=10,
    parameter pADDR_WIDTH=12,
    parameter pDATA_WIDTH=32
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;
    
    assign clk = (~la_oenb[64]) ? la_data_in[64] : wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65] : wb_rst_i;
    
    assign wbs_ack_o = w2a_ack | exm_ack ;
    assign wbs_dat_o = (wbs_adr_i[31:24]==8'h38) ? exm_dat_o : w2a_dat_o;
    
    wire exm_stb;
    wire exm_cyc;
    wire exm_we;
    wire [3:0] exm_sel;
    wire exm_ack;
    wire [31:0] exm_dat_o;
    wire ex_ack;
    
    assign exm_stb = wbs_stb_i & (wbs_adr_i[31:24]==8'h38);
    assign exm_cyc = wbs_cyc_i & (wbs_adr_i[31:24]==8'h38);
    assign exm_we = wbs_we_i & (wbs_adr_i[31:24]==8'h38);
    assign exm_sel = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h38)}};
    
    
    wire w2a_stb;
    wire w2a_cyc;
    wire w2a_we;
    wire [3:0] w2a_sel;
    wire [31:0] w2a_dat_o;
    wire w2a_ack;
    
    assign w2a_stb = wbs_stb_i & (wbs_adr_i[31:24]==8'h30);
    assign w2a_cyc = wbs_cyc_i & (wbs_adr_i[31:24]==8'h30);
    assign w2a_we = wbs_we_i & (wbs_adr_i[31:24]==8'h30);
    assign w2a_sel = wbs_sel_i & {4{(wbs_adr_i[31:24]==8'h30)}};
    
    wire fir_valid;
    wire fir_we;
    wire [11:0] fir_addr;
    reg  [1:0] count;
    wire [1:0] next_count;
    
    assign fir_valid = w2a_stb & w2a_cyc;
    assign fir_we = w2a_we & w2a_cyc;
    assign fir_addr  = wbs_adr_i[11:0];
    assign w2a_ack = (count == 1) | (ss_tvalid & ss_tready) | (sm_tvalid & sm_tready) | rvalid; 
   	
    assign next_count = count + 1;
    always @(posedge clk or posedge rst) begin
        if( rst | next_count==2) begin
            count <= 2'd0;
        end
        else if (awvalid) begin
            count <= next_count;
        end
        else begin
    	    count <= 2'd0;
        end
    end
   	
    reg [31:0] wb_dat_o;
    assign w2a_dat_o = wb_dat_o;
    always @(*) begin
        wb_dat_o = 32'd0;
        if (fir_addr == 12'h0) begin
            wb_dat_o = {27'd0, sm_tvalid, ss_tready, 1'b0, rdata[2:0]};
        end 
        else if ((fir_addr >= 12'h20) & (fir_addr <= 12'h48))  begin
        	wb_dat_o = rdata;
        end
        else if (fir_addr == 12'h84) begin
        	wb_dat_o = sm_tdata;
        end
        else begin
        	wb_dat_o = rdata;
        end
    end
    
    assign awvalid = fir_valid & (fir_addr[7:4] != 4'd8) & fir_we;
    assign wvalid = fir_valid & (fir_addr[7:4] != 4'd8) & fir_we;
    assign arvalid = fir_valid & (fir_addr[7:4] != 4'd8);
    assign rready = fir_valid & (fir_addr[7:4] != 4'd8);
    assign ss_tvalid = fir_valid & (fir_addr[7:4] == 4'd8) & fir_we;
    assign sm_tready = fir_valid & (fir_addr[7:0] == 8'h84);
    
    exmem_fir user_exmem_fir (
     .wb_clk_i(clk),
     .wb_rst_i(rst),
     .wbs_stb_i(exm_stb),
     .wbs_cyc_i(exm_cyc),
     .wbs_we_i(exm_we),
     .wbs_sel_i(exm_sel),
     .wbs_dat_i(wbs_dat_i),
     .wbs_adr_i(wbs_adr_i),
     .wbs_ack_o(exm_ack),
     .wbs_dat_o(exm_dat_o)
    );  
    
    wire                     awready;
    wire                     awvalid; 
    wire [(pADDR_WIDTH-1):0] awaddr;
    wire                     wready;
    wire                     wvalid;  
    wire [(pDATA_WIDTH-1):0] wdata;
    wire                     arready;
    wire                     arvalid;
    wire [(pADDR_WIDTH-1):0] araddr;
    wire                     rready;
    wire                     rvalid;
    wire [(pDATA_WIDTH-1):0] rdata;
    wire                     ss_tready;
    wire                     ss_tvalid;
    wire                     ss_tlast;
    wire [(pDATA_WIDTH-1):0] ss_tdata;
    wire                     sm_tready;
    wire                     sm_tvalid;
    wire                     sm_tlast;
    wire [(pDATA_WIDTH-1):0] sm_tdata;
    wire [3:0]               tap_WE;
    wire                     tap_EN;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A;
    wire [(pDATA_WIDTH-1):0] tap_Do;
    wire [3:0]               data_WE;
    wire                     data_EN;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A;
    wire [(pDATA_WIDTH-1):0] data_Do;
    
    fir user_fir(
        .awready(awready),
        .wready(wready),
        .awvalid(awvalid),
        .awaddr(fir_addr),
        .wvalid(wvalid),
        .wdata(wbs_dat_i),
        .arready(arready),
        .rready(rready),
        .arvalid(arvalid),
        .araddr(fir_addr),
        .rvalid(rvalid),
        .rdata(rdata),   
        .ss_tvalid(ss_tvalid), 
        .ss_tdata(wbs_dat_i), 
        .ss_tlast(ss_tlast), 
        .ss_tready(ss_tready), 
        .sm_tready(sm_tready), 
        .sm_tvalid(sm_tvalid), 
        .sm_tdata(sm_tdata), 
        .sm_tlast(sm_tlast), 
        .tap_WE(tap_WE),
        .tap_EN(tap_EN),
        .tap_Di(tap_Di),
        .tap_A(tap_A),
        .tap_Do(tap_Do),
        .data_WE(data_WE),
        .data_EN(data_EN),
        .data_Di(data_Di),
        .data_A(data_A),
        .data_Do(data_Do),
        .axis_clk(wb_clk_i),
        .axis_rst_n(~wb_rst_i)
    );

    bram11 tap_RAM (
        .CLK(wb_clk_i),
        .WE0(tap_WE),
        .EN0(tap_EN),
        .Di0(tap_Di),
        .A0(tap_A),
        .Do0(tap_Do)
    );

    bram11 data_RAM(
        .CLK(wb_clk_i),
        .WE0(data_WE),
        .EN0(data_EN),
        .Di0(data_Di),
        .A0(data_A),
        .Do0(data_Do)
    ); 
endmodule 

 
`default_nettype wire
