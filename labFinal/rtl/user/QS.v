module QS
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter QS_quene_Num    = 11
)
(
   input   wire clk,
	input	wire reset_n,
	input 	wire start_fg,
	input	wire [(pDATA_WIDTH-1):0] QS_data_in,
	input	wire QS_data_en,
	output	wire [(pDATA_WIDTH-1):0] QS_data_out,
	output  wire DIR_fg,//data_in_ready_fg
	output  wire DOR_fg,//data_out_ready_fg	
	output 	wire idle_fg,
	output	wire	 done_fg
);

localparam [3:0] 	IDLE = 4'b0000,
					DTPR = 4'b0001,
					CAL1 = 4'b0010,
					CAL2 = 4'b0011,
					CAL3 = 4'b0100,
					PRT1 = 4'b0101,
					PRT2 = 4'b0110,
					PRT3 = 4'b0111,
					PRTF = 4'b1000,
					STK1 = 4'b1001,
					STK2 = 4'b1010,
					OVER = 4'b1011,
					OPDT = 4'b1100;
				
reg [3:0]curr_state;
reg [3:0]next_state;

reg [4:0]stack[10:0];
reg [4:0]top;

reg [(pADDR_WIDTH-1):0]QS_quene[QS_quene_Num-1:0];
reg [(pADDR_WIDTH-1):0]num_counter;

reg [4:0]for_fg;
reg [4:0]ch_fg;
reg [4:0]high;
reg [4:0]low;
reg [4:0]piv_index;
reg start_inside_fg;

wire [4:0]top_plus_1;
wire [4:0]top_plus_2;
wire [4:0]top_minus_1;
wire [4:0]ch_fg_plus_1;
wire [4:0]ch_fg_plus_2;
wire data_ready;

assign top_plus_1 = top + 'd1;
assign top_plus_2 = top + 'd2;
assign top_minus_1 = top - 'd1;
assign ch_fg_plus_1 = ch_fg + 'd1;
assign ch_fg_plus_2 = ch_fg + 'd2;

assign idle_fg 		= curr_state == IDLE ? 1'b1 : 1'b0;
assign done_fg 		= curr_state == OVER | curr_state == OPDT;
/*assign data_ready 	= (curr_state == DTPR & num_counter == QS_quene_Num) ? 1'b1 : 
						(curr_state == OPDT & num_counter == (QS_quene_Num - 1'b1)) ? 1'b1 : 1'b0;*/
assign data_ready 	= num_counter == QS_quene_Num;						
assign QS_data_out 	= (curr_state == OPDT & num_counter < QS_quene_Num) ? QS_quene[num_counter] : 'd0;
assign DIR_fg 		= curr_state == DTPR;
assign DOR_fg 		= curr_state == OPDT;

//state str----------------------------------------
always @(posedge clk or negedge reset_n) begin
	if(!reset_n) curr_state <= IDLE;
	else curr_state <= next_state;
end

always @(*) begin
	case(curr_state)
		IDLE:begin
			if(start_fg) next_state = DTPR;
			else next_state = IDLE;
		end
		DTPR:begin
			if(data_ready) next_state = CAL1;
			else next_state = DTPR;
		end
		CAL1:begin
			next_state = CAL2;
		end
		CAL2:begin
			if(top != -5'd1) next_state = CAL3;
			else next_state = OVER;
		end
		CAL3:begin
			next_state = PRT1;
		end
		PRT1:begin
			next_state = PRT2;
		end
		PRT2:begin
			if(for_fg <= high) next_state = PRT3;
			else next_state = PRTF;
		end
		PRT3:begin
			next_state = PRT2;
		end
		PRTF:begin
			next_state = STK1;
		end
		STK1:begin
			next_state = STK2;
		end
		STK2:begin
			next_state = CAL2;
		end
		OVER:begin
			next_state = OPDT;
		end
		OPDT:begin
			if(data_ready) next_state = IDLE;
			else next_state = OPDT;
		end
		default:begin
			next_state = IDLE;
		end
	endcase
end
//state end----------------------------------------

//RTL operation str----------------------------------
always@(posedge clk or negedge reset_n)begin
	if(!reset_n)begin
		num_counter <= 'd0;
		for_fg <= 'd0;
		ch_fg <= 'd0;
		high <= 'd0;
		low <= 'd0;
		piv_index <= 'd0;
		top <= 'd0;
	end
	else begin
		case(curr_state)
			IDLE:begin
				num_counter <= 'd0;
			end
			DTPR:begin
				top <= - 5'd1;
				if(num_counter < QS_quene_Num && QS_data_en)begin//
					QS_quene[num_counter] <= QS_data_in;
					num_counter <= num_counter + 1'b1;
				end
			end
			CAL1:begin
				top <= 5'd1;
				num_counter <= 'd0;
				stack[top_plus_1] <= 5'd0;
				stack[top_plus_2] <= 5'd10;
			end
			CAL3:begin
				top <= top - 5'd2;
				high <= stack[top];
				low <= stack[top_minus_1];
				piv_index <= (stack[top] + stack[top_minus_1])>>1;
			end
			PRT1:begin
				for_fg <= low;
				ch_fg <= low - 'd1;
			end
			PRT3:begin//�i�����⪬�A
				for_fg <= for_fg  + 1'b1;
				if((for_fg < piv_index) || (for_fg > piv_index && (ch_fg + 1'b1) < piv_index))begin
					if(QS_quene[for_fg] <= QS_quene[piv_index])begin
						ch_fg <= ch_fg + 1'b1;
						QS_quene[for_fg] <= QS_quene[ch_fg_plus_1];
						QS_quene[ch_fg_plus_1] <= QS_quene[for_fg];
					end
				end
				else if(for_fg > piv_index)begin
					if(QS_quene[for_fg] <= QS_quene[piv_index])begin
						ch_fg <= ch_fg + 'd1;
						QS_quene[for_fg] <= QS_quene[ch_fg_plus_2];
						QS_quene[ch_fg_plus_2] <= QS_quene[for_fg];
					end
				end
			end
			PRTF:begin
					QS_quene[piv_index] <= QS_quene[ch_fg_plus_1];
					QS_quene[ch_fg_plus_1] <= QS_quene[piv_index];
			end
			STK1:begin
				if(ch_fg > low)begin
					top <= top + 5'd2;
					stack[top_plus_1] <= low;
					stack[top_plus_2] <= ch_fg;
				end
			end
			STK2:begin
				if((ch_fg + 5'd2) < high)begin
					top <= top + 5'd2;
					stack[top_plus_1] <= ch_fg + 5'd2;
					stack[top_plus_2] <= high;
				end
			end
			/*OPDT:begin
				if(num_counter < (QS_quene_Num - 1'b1) && QS_data_en)begin
					num_counter <= num_counter + 1'b1;
				end
			end*/
			OPDT:begin
				if(num_counter < QS_quene_Num && QS_data_en)begin
					num_counter <= num_counter + 1'b1;
				end
			end
		endcase
	end
end
//RTL opertation end----------------------------------
endmodule
