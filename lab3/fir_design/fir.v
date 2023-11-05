`timescale 1ns / 1ps


module fir 
#(  parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11,
    parameter Data_Num    = 600
)
(
    //axilite interface write
    output  wire                     awready,
    output  wire                     wready,
    input   wire                     awvalid,
    input   wire [(pADDR_WIDTH-1):0] awaddr,
    input   wire                     wvalid,
    input   wire [(pDATA_WIDTH-1):0] wdata,
    
    //axilite interface read
    output  wire                     arready,
    input   wire                     rready,
    input   wire                     arvalid,
    input   wire [(pADDR_WIDTH-1):0] araddr,
    output  wire                     rvalid,
    output  wire [(pDATA_WIDTH-1):0] rdata,
    
    //axistream x[n]
    input   wire                     ss_tvalid,
    input   wire [(pDATA_WIDTH-1):0] ss_tdata,
    input   wire                     ss_tlast,
    output  wire                     ss_tready,
    
    //axistream y[n]
    input   wire                     sm_tready,
    output  wire                     sm_tvalid,
    output  wire [(pDATA_WIDTH-1):0] sm_tdata,
    output  wire                     sm_tlast,

    // bram for tap RAM
    output  wire [3:0]               tap_WE,
    output  wire                     tap_EN,
    output  wire [(pDATA_WIDTH-1):0] tap_Di,
    output  wire [(pADDR_WIDTH-1):0] tap_A,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,

    // bram for data RAM
    output  wire [3:0]               data_WE,
    output  wire                     data_EN,
    output  wire [(pDATA_WIDTH-1):0] data_Di,
    output  wire [(pADDR_WIDTH-1):0] data_A,
    input   wire [(pDATA_WIDTH-1):0] data_Do,
    
    input   wire                     axis_clk,
    input   wire                     axis_rst_n
);

    reg [9:0] data_length;
    wire[9:0] data_length_tmp;
    
    reg[2:0] ap_ctrl;
    reg[1:0] ap_current_state;
    reg[1:0] ap_next_state;
    
    reg[9:0] num_count;
    wire [9:0] num_count_tmp;
    
    reg [3:0] x_count;
    wire [3:0] x_count_tmp;
    
    reg [4:0] y_count;
    wire [4:0] y_count_tmp;
    
    wire [5:0] next_init_addr;
    reg  [5:0] init_addr;
    
    reg rvalid_tmp;
    
    reg [3:0] shift;
    reg [3:0] shift_tmp;
    
    wire [(pADDR_WIDTH-1):0] tap_A_tmp;
    
    reg [(pDATA_WIDTH-1):0] data_ff;
    wire [5:0] data_A_tmp;
    
    wire[(pDATA_WIDTH-1):0]x_data;
    reg[(pDATA_WIDTH-1):0] x;
    wire[(pDATA_WIDTH-1):0] x_tmp;
    
    reg[(pDATA_WIDTH-1):0] h;
    wire[(pDATA_WIDTH-1):0] h_tmp;
    
    reg[(pDATA_WIDTH-1):0] mult;
    wire[(pDATA_WIDTH-1):0] mult_tmp;
    
    reg[(pDATA_WIDTH-1):0] y;
    wire[(pDATA_WIDTH-1):0] y_tmp;
    
    reg sm_state;
    reg sm_next_state;
    reg sm_tlast_tmp;
    
    
    //configuration register address 
    always @(*) begin
        case(ap_current_state)
            //initial
            2'b00: begin
                if (awaddr == 12'd0 && wdata[0] == 1 && (num_count != data_length)) begin
                    ap_next_state = 2'b10; //idle
                    ap_ctrl = 3'b001; //ap_start
                end     
                else begin 
                    ap_next_state = 2'b00; //initial
                    ap_ctrl = 3'b100; //ap_idle
                end
            end
            //done
            2'b01: begin
                if (awaddr == 12'd0 && arvalid && rvalid) begin
                    ap_next_state = 2'b00; 
                    ap_ctrl = 3'b010;
                end     
                else begin 
                    ap_next_state = 2'b01;
                    ap_ctrl = 3'b010;
                end
            end   
            //idle
            2'b10:begin
                if(sm_tlast)begin
                    ap_next_state = 2'b01;
                    ap_ctrl = 3'b010;
                end
                else begin
                    ap_next_state = 2'b10;
                    ap_ctrl = 3'b000;
                end
            end 
            //default for initial
            default:begin
                if (awaddr == 12'd0 && wdata[0] == 1 && (num_count != data_length)) begin
                    ap_next_state = 2'b10;
                    ap_ctrl = 3'b001;
                end     
                else begin 
                    ap_next_state = 2'b00;
                    ap_ctrl = 3'b100;
                end
            end
            endcase 
        end
        
    always @(posedge axis_clk) begin
        if (~axis_rst_n) 
            ap_current_state <= 2'b00;
        else 
            ap_current_state <= ap_next_state;
        end     
    
    //data length to judge the last data
    assign data_length_tmp = (awaddr == 32'h10)?wdata:data_length;
    always @(posedge axis_clk) begin
        if (~axis_rst_n) 
            data_length <= 10'd0;
        else 
            data_length <= data_length_tmp;
        end 
        
    //tap ram data cycle        
    assign x_count_tmp = (x_count != 4'd10)? x_count+1:4'd0;

    always @(posedge axis_clk) begin
        if (~axis_rst_n || ap_ctrl[2]) begin
            x_count <= 4'd10;
            end
        else begin
            x_count <= x_count_tmp;
            end
        end
    
    //calculate cycle
    assign y_count_tmp = (y_count != 6'd10 && ap_ctrl[2] == 1'b0)? y_count + 1'b1 : 5'd0;
    
    always @(posedge axis_clk or negedge axis_rst_n) begin
        if (~axis_rst_n || ap_ctrl[2]) begin
            y_count <= -5'd15;
            end
        else begin
            y_count <= y_count_tmp;
            end
        end
    

    always @(*) begin
        if (ap_ctrl[2] == 1'b0) begin
            if (x_count == 4'd10)
                if (shift != 4'd10)
                    shift_tmp = shift + 1'b1;
                else
                    shift_tmp =  4'd0;
            else
                shift_tmp = shift;
        end
        else
            shift_tmp = 4'd0;
    end
    
    always @(posedge axis_clk) begin
        if (~axis_rst_n)
            shift <= 4'd0;
        else
            shift <= shift_tmp;
    end
    
    
    assign num_count_tmp = (sm_tvalid == 1'b1)? num_count + 1'b1 : num_count;
    
    always @(posedge axis_clk) begin
        if (~axis_rst_n) 
            num_count <= 10'd0;
        else
            num_count <= num_count_tmp;
    end

    //axilite    
    assign awready = 1'b1;
    assign arready = ~(wvalid | awvalid);
    assign wready = 1'b1;
    
    
    assign rvalid = rvalid_tmp;
    always @(posedge axis_clk) begin
        if (~axis_rst_n) 
            rvalid_tmp <= 1'b0;
        else 
            rvalid_tmp <= arvalid;
        end
     
    assign rdata = (araddr[7:0] == 8'd0)?ap_ctrl:tap_Do;
    
    //tap parameter *change to 80-FF!
    assign tap_EN = 1;
    assign tap_WE = ((awvalid && wvalid == 1) && (awaddr !=0))?4'b1111:4'b0000;
    assign tap_A = (awvalid == 1)? awaddr[5:0]:tap_A_tmp[5:0];
    assign tap_A_tmp = (ap_ctrl[2] == 1'b0)? 12'h80 + 4*x_count:araddr[5:0];
    assign tap_Di = wdata;
    
    
    assign ss_tready = (init_addr != 6'd44 || x_count == 4'd0)?1'b1:1'b0;
    
    //data ram  
    assign data_EN = ss_tvalid;
    assign data_WE = (ss_tready && ss_tvalid)?4'b1111:4'b0000;
    assign data_A = (ap_ctrl[2] == 1 && init_addr != 6'd44)?init_addr:data_A_tmp;
    assign data_A_tmp = (x_count <= shift)?4*(shift-x_count):4*(11+shift-x_count);
    assign data_Di = ss_tdata;
    
    //data ram initialize
    assign next_init_addr = (init_addr == 6'd44)? init_addr : init_addr + 6'd4;
    
    always @(posedge axis_clk) begin
        if (~axis_rst_n)
            init_addr <= -6'd4;
        else
            init_addr <= next_init_addr;
    end  
    
    //FF avoid empty cycle(waste time)
    always @(posedge axis_clk) begin
        if (~axis_rst_n) begin
            data_ff <= 32'd0;
            end
        else begin
            data_ff <= ss_tdata;
            end
        end
    
    assign x_data = (x_count == 4'd0)?data_ff:data_Do;
    
    
    assign h_tmp = tap_Do;
    assign x_tmp = x_data;
    assign mult_tmp = h * x;
    assign y_tmp = (y_count == 4'd0)?mult:mult + y;
    
    always @(posedge axis_clk) begin
       if (~axis_rst_n || ap_ctrl[2]) begin
            h <= 32'd0;
            x <= 32'd0;
            mult <= 32'd0;
            y <= 32'd0;
           end
       else begin
            h <= h_tmp;
            x <= x_tmp;
            mult <= mult_tmp;
            y <= y_tmp;
           end
       end 
       
     //FSM for output
     always@(*) begin
        case(sm_state)
            //idle
            1'b0:begin
                if (num_count_tmp == data_length)begin
                    sm_next_state = 1'b1;
                    sm_tlast_tmp = 1;
                    end
                else begin
                    sm_next_state = 1'b0;
                    sm_tlast_tmp = 0;
                    end
                end
            //done
            1'b1:begin
                if (sm_tvalid)begin
                    sm_next_state = 1'b0;
                    sm_tlast_tmp = 0;
                    end
                else begin
                    sm_next_state = 1'b1;
                    sm_tlast_tmp = 0;
                    end
                end
           endcase
      end              
      
      always @(posedge axis_clk) begin
          if (~axis_rst_n)
              sm_state <= 0;
          else 
            sm_state <= sm_next_state;
          end               
            
     assign sm_tvalid = (y_count == 5'd0)?1'b1:1'b0;
     assign sm_tdata = y;
     assign sm_tlast = sm_tlast_tmp;
    
endmodule 