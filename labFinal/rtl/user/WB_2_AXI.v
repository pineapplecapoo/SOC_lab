module WB_2_AXI
#(  
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)
(
//wishbone_protocol_str-----------------------------------------------
	input wire wbs_clk_i,
	input wire wbs_rst_i,
	input wire [31:0] wbs_adr_i,
	input wire [31:0] wbs_dat_i,
	input wire [3:0] wbs_sel_i,
	//input wire wbs_ack_i,
	input wire wbs_we_i,
	input wire wbs_cyc_i,
	input wire wbs_stb_i,
	//input wire wbs_err_i,
	output reg wbs_ack_o,
	output reg [31:0] wbs_dat_o
	
//wishbone_protocol_end-----------------------------------------------
);

//axi_str-------------------------------------------------------------
	/*wire axi_clk;
	wire axi_rst;*/
	
	wire awready;
	wire wready;
	wire awvalid;
	wire [(pADDR_WIDTH-1):0] awaddr;
	wire wvalid;
	wire [(pDATA_WIDTH-1):0] wdata;


	wire arready;
	wire rready;
	wire arvalid;
	wire [(pADDR_WIDTH-1):0] araddr;
	wire rvalid;
	wire [(pDATA_WIDTH-1):0] rdata;

	wire ss_tvalid;
	wire [(pDATA_WIDTH-1):0]ss_tdata;
	wire ss_last;
	wire ss_tready;

	wire sm_tvalid;
	wire [(pDATA_WIDTH-1):0]sm_tdata;
	wire sm_tlast;
	wire sm_tready;
//axi_end---------------------------------------------------------------
	
	wire en;
	
	assign en = wbs_adr_i[31:24] == 8'h36;
	
	assign awvalid = en & wbs_cyc_i & wbs_stb_i;
	assign awaddr  = en ? wbs_adr_i[11:0] : 'h0;
	assign wvalid  = en ? wbs_cyc_i & wbs_stb_i : 'h0;
	assign wdata   = en ? wbs_dat_i : 'h0;
	
	
	assign rready  = en ? rvalid : 'h0;
	assign arvalid = en ? wbs_cyc_i & wbs_stb_i : 'h0;
	assign araddr  = en ? wbs_adr_i[11:0] : 'h0;
	
	
	assign ss_tvalid = en ? wbs_adr_i[11:0] == 'h080 && wbs_cyc_i & wbs_stb_i : 'h0;
	assign ss_tdata  = en ? wbs_dat_i : 'h0;
	assign ss_last   = 1'd0; // not use
	
	
	assign sm_tready = en ? wbs_adr_i[11:0] == 'h084 && sm_tvalid && wbs_cyc_i & wbs_stb_i : 'h0;
	
	
	always@(*)begin
		case(wbs_adr_i[11:0])
			'h000: wbs_dat_o = rdata;
			'h010: wbs_dat_o = rdata;
			'h040: wbs_dat_o = rdata;
			'h084: wbs_dat_o = sm_tdata;
			default: wbs_dat_o = 'h0;
		endcase
	end
	
	always@(*)begin
		wbs_ack_o = 1'd0;
		if(en)begin
		if(wbs_we_i )begin
			if(wbs_adr_i[11:0] == 'h0 && wbs_dat_i == 'h0) 	  wbs_ack_o = wbs_cyc_i & wbs_stb_i;
			if(wbs_adr_i[11:0] == 'h0 && wbs_dat_i == 'h1) 	  wbs_ack_o = awready & wready;
			if(wbs_adr_i[11:0] == 'h10)                    	  wbs_ack_o = awready & wready;
			if(wbs_adr_i[11:0] >= 'h40 && wbs_adr_i[11:0] <= 'h68)  wbs_ack_o = awready & wready;
			if(wbs_adr_i[11:0] == 'h80)  				  wbs_ack_o = ss_tready;
			
		end
		else begin
			if(wbs_adr_i[11:0] == 'h0) 	  			  wbs_ack_o = rvalid;
			if(wbs_adr_i[11:0] == 'h84) 	  			  wbs_ack_o = sm_tvalid;
		end
		end
	end
	
	
	
	
	fir fir(                     
	    .awready(awready),
	    .awvalid(awvalid),
	    .awaddr(awaddr),
	    .wready(wready),
	    .wvalid(wvalid),
	    .wdata(wdata),
	    
	    
	    .arready(arready),
	    .arvalid(arvalid),
	    .araddr(araddr),
	    .rready(rready),
	    .rvalid(rvalid),
	    .rdata(rdata), 
	    
	    .ss_tvalid(ss_tvalid), 
	    .ss_tdata(ss_tdata), 
	    .ss_tlast(ss_tlast), 
	    .ss_tready(ss_tready),
	    
	    .sm_tready(sm_tready), 
	    .sm_tvalid(sm_tvalid), 
	    .sm_tdata(sm_tdata), 
	    .sm_tlast(sm_tlast), 
	    
	    .axis_clk(wbs_clk_i),
	    .axis_rst_n(~wbs_rst_i)
	);



endmodule
