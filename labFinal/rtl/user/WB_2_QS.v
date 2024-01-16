module WB_2_QS
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
	input wire wbs_we_i,
	input wire wbs_cyc_i,
	input wire wbs_stb_i,
	output reg wbs_ack_o,
	output reg [31:0] wbs_dat_o
//wishbone_protocol_end-----------------------------------------------
);

wire QS_start;
wire QS_data_in_en;
wire QS_data_out_en;
wire QS_data_en;
wire [31:0]QS_data_out;
wire idle_fg;
wire done_fg;
wire DIR_fg;
wire DOR_fg;
wire en;

QS QS1(	.clk(wbs_clk_i),//
		.reset_n(~wbs_rst_i),//
		.start_fg(QS_start),//
		.QS_data_in(wbs_dat_i),//
		.QS_data_en(QS_data_en),//
		.QS_data_out(QS_data_out),//
		.idle_fg(idle_fg),
		.done_fg(done_fg),
		.DIR_fg(DIR_fg),//data_in_ready_fg
		.DOR_fg(DOR_fg)//data_out_ready_fg
);

assign en = wbs_adr_i[31:24] == 8'h32;
assign QS_start = wbs_stb_i & wbs_cyc_i & wbs_we_i & wbs_adr_i=='h32000000 & wbs_dat_i[0];
assign QS_data_in_en = wbs_stb_i & wbs_cyc_i & wbs_we_i;
assign QS_data_out_en = wbs_stb_i & wbs_cyc_i & ~wbs_we_i;
assign QS_data_en = wbs_adr_i=='h32000080 ? QS_data_in_en :
					wbs_adr_i=='h32000084 ? QS_data_out_en :1'b0;
 
always@(*)begin
	case(wbs_adr_i[11:0])
		'h000: wbs_dat_o = {DOR_fg,DIR_fg,idle_fg,done_fg,QS_start};
		'h084: wbs_dat_o = QS_data_out;
		default: wbs_dat_o = 'h0;
	endcase
end

always@(*)begin
		wbs_ack_o = 1'd0;
		if(en)begin
			if(wbs_we_i)begin
				if(wbs_adr_i[11:0] == 'h0)	 wbs_ack_o = wbs_cyc_i & wbs_stb_i;
				if(wbs_adr_i[11:0] == 'h80)  wbs_ack_o = wbs_cyc_i & wbs_stb_i;
			end
			else begin
				if(wbs_adr_i[11:0] == 'h0)		wbs_ack_o = wbs_cyc_i & wbs_stb_i;
				if(wbs_adr_i[11:0] == 'h84)	wbs_ack_o = DOR_fg;
			end
		end
	end
endmodule
