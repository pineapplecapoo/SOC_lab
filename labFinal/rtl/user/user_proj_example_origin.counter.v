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
    parameter DELAYS=10
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

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    wire [31:0] rdata; 
    wire [31:0] wdata;
    reg [BITS-1:0] count;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;
    wire decoded;
    wire [31:0]addr;	
	
    reg ready;
    reg [BITS-17:0] delayed_count;
    
    wire ex_mm_input;
    wire ex_mm_output;
    wire mm_ack_o;
    wire [31:0]mm_data_o;
    wire mm_start;
    wire mm_idle;
    // WB MI A
    assign valid = wbs_cyc_i && wbs_stb_i && decoded; 
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    assign wbs_dat_o = (wbs_adr_i[31:24]==8'h34) ? mm_data_o : rdata;
    assign wdata = wbs_dat_i;
    assign wbs_ack_o = (wbs_adr_i[31:24]==8'h34) ? mm_ack_o : ready;
	
    // IO
    assign io_out = count;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    assign la_data_out = {{(127-BITS){1'b0}}, count};
    // Assuming LA probes [63:32] are for controlling the count register  
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;

    assign decoded = (wbs_adr_i[31:20] == 12'h380) ? 1'b1 :
		    /*(wbs_adr_i[31:20] == 12'h360) ? 1'b1:
		    (wbs_adr_i[31:20] == 12'h340) ? 1'b1:
		    (wbs_adr_i[31:20] == 12'h320) ? 1'b1:*/ 1'b0;
		    
    assign addr = (wbs_adr_i[31:20] == 12'h380) ? {16'd0,wbs_adr_i[15:0]} :
		    /*(wbs_adr_i[31:20] == 12'h360) ? {16'd1,wbs_adr_i[15:0]}:
		    (wbs_adr_i[31:20] == 12'h340) ? {16'd2,wbs_adr_i[15:0]}:
		    (wbs_adr_i[31:20] == 12'h320) ? {16'd3,wbs_adr_i[15:0]}:*/ wbs_adr_i;		    
	
    always @(posedge clk) begin
        if (rst) begin
            ready <= 1'b0;
            delayed_count <= 16'b0;
        end else begin
            ready <= 1'b0;
            if ( valid && !ready ) begin
                if ( delayed_count == DELAYS ) begin
                    delayed_count <= 16'b0;
                    ready <= 1'b1;
                end else begin
                    delayed_count <= delayed_count + 1;
                end
            end
        end
    end
    
    always @(posedge clk) begin
    	if (rst) begin
    	    count <= 0;
    	end else if (count == 0) begin
    	    if (((wbs_adr_i == 32'h38000000)/*||(wbs_adr_i == 32'h36000000)||(wbs_adr_i == 32'h34000000)||(wbs_adr_i == 32'h32000000)*/) && valid && (|wstrb == 1'b0)) begin
    	        count <= count + 1;
    	    end else begin
    	        count <= count;
    	    end
    	end else begin
    	    count <= count + 1;
    	end
    end
/*
    counter #(
        .BITS(BITS)
    ) counter(
        .clk(clk),
        .reset(rst),
        .ready(wbs_ack_o),
        .valid(valid),
        .rdata(rdata),
        .wdata(wbs_dat_i),
        .wstrb(wstrb),
        .la_write(la_write),
        .la_input(la_data_in[63:32]),
        .count(count)
    );
*/
    	
	assign ex_mm_input =  wbs_stb_i & wbs_cyc_i && wbs_we_i && wbs_adr_i[31:24]==8'h34;    
	assign ex_mm_output = wbs_stb_i & wbs_cyc_i && !wbs_we_i && wbs_adr_i[31:24]==8'h34;
	assign mm_start = !mm_idle;
	
   mmatrix mm1(   
   		.matrix_a(wbs_dat_i),
    		//.matrix_b(),
	    	.clk(wb_clk_i),
	    	.reset(wb_rst_i),
	    	.mm_en(ex_mm_input),
	    	.mm_start(mm_start),
	    	.mm_ack_i(ex_mm_output),
	    	.mm_ack_o(mm_ack_o),
	    	.mm_done(),
	    	.mm_idle(mm_idle),
   		.matrix_o(mm_data_o)
    );
    
    bram user_bram1 (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid),
        .Di0(wbs_dat_i),
        .Do0(rdata),
        .A0(addr)
    );

endmodule

module counter #(
    parameter BITS = 32
)(
    input clk,
    input reset,
    input valid,
    input [3:0] wstrb,
    input [BITS-1:0] wdata,
    input [BITS-1:0] la_write,
    input [BITS-1:0] la_input,
    output ready,
    output [BITS-1:0] rdata,
    output [BITS-1:0] count
);
    reg ready;
    reg [BITS-1:0] count;
    reg [BITS-1:0] rdata;

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            ready <= 0;
        end else begin
            ready <= 1'b0;
            if (~|la_write) begin
                count <= count + 1;
            end
            if (valid && !ready) begin
                ready <= 1'b1;
                rdata <= count;
                if (wstrb[0]) count[7:0]   <= wdata[7:0];
                if (wstrb[1]) count[15:8]  <= wdata[15:8];
                if (wstrb[2]) count[23:16] <= wdata[23:16];
                if (wstrb[3]) count[31:24] <= wdata[31:24];
            end else if (|la_write) begin
                count <= la_write & la_input;
            end
        end
    end

endmodule

`default_nettype wire