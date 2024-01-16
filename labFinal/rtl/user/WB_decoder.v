module WB_decoder(
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    //input wbs_ack_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,
    
    /////////////////////////////// new ///////////////////////////////
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,
    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,
    output [2:0] user_irq
    /////////////////////////////// new ///////////////////////////////
);

wire exmem_ack_o;
wire WU_ack_o;
wire WA_ack_o;
wire [31:0]exmem_data_o;
wire [31:0]WU_data_o;
wire [31:0]WA_data_o;

wire [`MPRJ_IO_PADS-1:0] io_out_exmem;
wire [`MPRJ_IO_PADS-1:0] io_out_uart;
wire [`MPRJ_IO_PADS-1:0] io_oeb_exmem;
wire [`MPRJ_IO_PADS-1:0] io_oeb_uart;

wire ex_mm_input;
wire ex_mm_output;

wire mm_ack_o;
wire [31:0]mm_data_o;
wire mm_start;
wire mm_idle;

wire [31:0]WQ_data_o;
wire WQ_ack_o;  
              
assign wbs_ack_o = 	(wbs_adr_i[31:24]==8'h30) ? WU_ack_o :
			(wbs_adr_i[31:24]==8'h31) ? 1'd1 :
			(wbs_adr_i[31:24]==8'h32) ? WQ_ack_o :
			(wbs_adr_i[31:24]==8'h34) ? mm_ack_o :
		    	(wbs_adr_i[31:24]==8'h36) ? WA_ack_o :
                   	(wbs_adr_i[31:24]==8'h38) ? exmem_ack_o : 1'b0;
                   
assign wbs_dat_o = 	(wbs_adr_i[31:24]==8'h30) ? WU_data_o :
			(wbs_adr_i[31:24]==8'h32) ? WQ_data_o :
			(wbs_adr_i[31:24]==8'h34) ? mm_data_o :
		    	(wbs_adr_i[31:24]==8'h36) ? WA_data_o :
                   	(wbs_adr_i[31:24]==8'h38) ? exmem_data_o : 32'b0;
                   
 ////////////mmatrix///////////////
assign ex_mm_input =  wbs_stb_i & wbs_cyc_i && wbs_we_i && wbs_adr_i[31:24]==8'h34;    
assign ex_mm_output = wbs_stb_i & wbs_cyc_i && !wbs_we_i && wbs_adr_i[31:24]==8'h34;
assign mm_start = !mm_idle;
assign en_WU    =  wbs_adr_i[31:24] == 8'h30;
assign en_exmem =  wbs_adr_i[31:24] == 8'h38;

user_proj_example mprj (
    	.clk(wb_clk_i),
    	.rst(wb_rst_i),		// active high (from WB)
    	.stb(wbs_stb_i),		// command strobe -request
    	.we(wbs_we_i),			// 1: write, 0: read
    	.sel(wbs_sel_i),		// byte-enable
   	.dat_i(wbs_dat_i),	        // data in
    	.addr(wbs_adr_i),		// address in
    	.ack(exmem_ack_o),		// ready
    	.dat_o(exmem_data_o)	
);

uart uart (
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    // MGMT SoC Wishbone Slave
    .wbs_stb_i(wbs_stb_i), // ns & en_WU
    .wbs_cyc_i(wbs_cyc_i), // ns & en_WU
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(WU_ack_o),
    .wbs_dat_o(WU_data_o),
    // IO ports
    .io_in  (io_in),
    .io_out (io_out),
    .io_oeb (io_oeb),
    // irq
    .user_irq (user_irq)
);

mmatrix mm1(   
	.matrix_a(wbs_dat_i),
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

WB_2_AXI WA1(   
	.wbs_clk_i(wb_clk_i), 
        .wbs_rst_i(wb_rst_i),
        .wbs_stb_i(wbs_stb_i),
        .wbs_cyc_i(wbs_cyc_i),
        .wbs_we_i(wbs_we_i),
        .wbs_sel_i(wbs_sel_i),
        .wbs_dat_i(wbs_dat_i),
        .wbs_adr_i(wbs_adr_i), 
        .wbs_ack_o(WA_ack_o),
        .wbs_dat_o(WA_data_o)
);

WB_2_QS WQ1(   
	.wbs_clk_i(wb_clk_i),
	.wbs_rst_i(wb_rst_i),
	.wbs_stb_i(wbs_stb_i),       
	.wbs_cyc_i(wbs_cyc_i),
	.wbs_we_i(wbs_we_i),
 	.wbs_sel_i(wbs_sel_i),
 	.wbs_dat_i(wbs_dat_i),
   	.wbs_adr_i(wbs_adr_i), 
    	.wbs_ack_o(WQ_ack_o),
      	.wbs_dat_o(WQ_data_o)
);
endmodule

`default_nettype wire
