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

`timescale 1 ns / 1 ps

module counter_la_mm_tb;
	reg clock;
        reg RSTB;
	reg CSB;

	reg power1, power2;

	wire gpio;
	wire uart_tx;
	wire uart_rx;
	wire [37:0] mprj_io;
	wire [15:0] checkbits;
	reg flag_fir,flag_uart;
	
	reg tx_start;
	reg [7:0] tx_data;
	wire tx_busy;
	wire tx_clear_req;
	wire [8*10-1:0]recv_buf_data;
	
	
	wire signed[7:0]fir_out;
	reg  [15:0]checkbits_cmp;
	reg  [7:0] ans_cnt;
	reg signed [7:0]golden[63:0];
	reg signed [7:0]acc;
	reg signed [31:0]tap_addr, iter;
	reg signed [31:0]temp;
	reg signed [7:0] coef[0:10]; // fill in coef 
	reg signed [7:0] data[0:10]; // fill in coef 
	
	
	integer cnt_flag;
	integer latercy_cnt,latercy_mm,latercy_fir,latercy_qs;
	
	parameter N = 64;
	
	assign checkbits  = mprj_io[31:16];
	assign uart_tx = mprj_io[6];
	assign fir_out = mprj_io[31:24];
	assign mprj_io[5] = uart_rx;
	
	always #12.5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	`ifdef ENABLE_SDF
		initial begin
			$sdf_annotate("../../../sdf/user_proj_example.sdf", uut.mprj) ;
			$sdf_annotate("../../../sdf/user_project_wrapper.sdf", uut.mprj.mprj) ;
			$sdf_annotate("../../../mgmt_core_wrapper/sdf/DFFRAM.sdf", uut.soc.DFFRAM_0) ;
			$sdf_annotate("../../../mgmt_core_wrapper/sdf/mgmt_core.sdf", uut.soc.core) ;
			$sdf_annotate("../../../caravel/sdf/housekeeping.sdf", uut.housekeeping) ;
			$sdf_annotate("../../../caravel/sdf/chip_io.sdf", uut.padframe) ;
			$sdf_annotate("../../../caravel/sdf/mprj_logic_high.sdf", uut.mgmt_buffers.mprj_logic_high_inst) ;
			$sdf_annotate("../../../caravel/sdf/mprj2_logic_high.sdf", uut.mgmt_buffers.mprj2_logic_high_inst) ;
			$sdf_annotate("../../../caravel/sdf/mgmt_protect_hv.sdf", uut.mgmt_buffers.powergood_check) ;
			$sdf_annotate("../../../caravel/sdf/mgmt_protect.sdf", uut.mgmt_buffers) ;
			$sdf_annotate("../../../caravel/sdf/caravel_clocking.sdf", uut.clocking) ;
			$sdf_annotate("../../../caravel/sdf/digital_pll.sdf", uut.pll) ;
			$sdf_annotate("../../../caravel/sdf/xres_buf.sdf", uut.rstb_level) ;
			$sdf_annotate("../../../caravel/sdf/user_id_programming.sdf", uut.user_id_value) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_1[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_bidir_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[6] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[7] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[8] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[9] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1[10] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_1a[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[3] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[4] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[5] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[6] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[7] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[8] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[9] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[10] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[11] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[12] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[13] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[14] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_control_block.sdf", uut.\gpio_control_in_2[15] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_0[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[0] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[1] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.\gpio_defaults_block_2[2] ) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_5) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_6) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_7) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_8) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_9) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_10) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_11) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_12) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_13) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_14) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_15) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_16) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_17) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_18) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_19) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_20) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_21) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_22) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_23) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_24) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_25) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_26) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_27) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_28) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_29) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_30) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_31) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_32) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_33) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_34) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_35) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_36) ;
			$sdf_annotate("../../../caravel/sdf/gpio_defaults_block.sdf", uut.gpio_defaults_block_37) ;
		end
	`endif 

	// assign mprj_io[3] = 1'b1;

	initial begin
		$dumpfile("counter_la_mm.vcd");
		$dumpvars(0, counter_la_mm_tb);
		
		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (1000) begin
			repeat (2000) @(posedge clock);
			// $display("+1000 cycles");
		end
		$display("%c[1;31m",27);
		`ifdef GL
			$display ("Monitor: Timeout, Test LA (GL) Failed");
		`else
			$display ("Monitor: Timeout, Test LA (RTL) Failed");
		`endif
		$display("%c[0m",27);
		$finish;
	end

	
	/////////////////////// latency-timer counting part ////////////////////////
	initial begin
		tx_start = 0;
		tx_data = 0;
		flag_fir = 0;
		flag_uart = 0;
		///////////////////mmatrix/////////////////
		latercy_cnt = 0;
		cnt_flag = 0;
		wait(checkbits == 16'h00A5);
		$display("latency-timer start counting");		
		cnt_flag = 1;
		wait((checkbits & 16'h005A) == 16'h005A);
		latercy_mm = latercy_cnt;
		$display("mm_latency-timer : %d (cycles)" , latercy_mm);
		cnt_flag = 0;
		#200;
		
		
		///////////////////quick sort/////////////////
		cnt_flag = 0;
		wait(checkbits == 16'h00A5);
		$display("latency-timer start counting");		
		cnt_flag = 1;
		wait((checkbits & 16'h005A) == 16'h005A);
		latercy_qs = latercy_cnt - latercy_mm;
		$display("qs_latency-timer : %d (cycles)" , latercy_qs);
		cnt_flag = 0;
		#200;
		
		
		///////////////////fir/////////////////
		cnt_flag = 0;
		flag_fir = 1;
		wait(checkbits == 16'h00A5);
		$display("latency-timer start counting");		
		cnt_flag = 1;
		wait((checkbits & 16'h005A) == 16'h005A);
		latercy_fir = latercy_cnt - latercy_mm - latercy_qs;
		$display("fir_latency-timer : %d (cycles)" , latercy_fir);
		cnt_flag = 0;
		#200;
		
		///////////////////Total/////////////////
		$display("Total_latency-timer : %d (cycles)" , latercy_cnt);
		flag_uart = 1;
		//$finish;
	end
	
	///new 
	initial begin
		wait(checkbits == 16'hAB60);
		$display("Monitor:MPRJ-Logic WB Started");

		wait(checkbits == 16'hAB61);
		$display("Monitor:MPRJ-Project WB(RTL) Passed");
		//#2000;
		//$finish;
	end
	integer i;
	initial begin
	
		
		wait(checkbits == 16'h005A);
		wait(flag_uart==1'd1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		cnt_flag = 1;
		send_data(69);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 8'd69);
		
		/*wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(1);
		$display("UART finished sending");
		wait(recv_buf_data[7:0] == 1);*/
		
		/*
		wait(!tx_busy);
		$display("UART sending data2");
		cnt_flag = 1;
		send_data(65);
		$display("UART finished sending");
		
		wait(recv_buf_data[15:0] == 16'h0041);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(66);
		$display("UART finished sending");
		
		wait(recv_buf_data[15:0] == 16'h4142);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(67);
		$display("UART finished sending");
		
		wait(recv_buf_data[15:0] == 16'h4243);
		
		wait(!tx_busy);
		$display("UART sending data2");
		//cnt_flag = 1;
		send_data(68);
		$display("UART finished sending");
		
		wait(recv_buf_data[15:0] == 16'h4344);*/
		
		cnt_flag = 0;
		$display("Last latency-timer : %d (cycles)" , latercy_cnt);
		
		$finish;
	end
	
	task send_data;
		input [31:0]data;
		begin
			@(posedge clock);
			tx_start = 1;
			tx_data = data;
			wait(tx_busy);
			
			wait(!tx_busy);
			tx_start = 0;
			$display("tx complete 1");
		end 
	endtask
	
	////////////////////////////
	
	initial begin
		#20;
		for(iter = 1 ; iter <= N ; iter = iter + 1)begin
			acc = 0;
			for(tap_addr = 0 ; tap_addr < 11 ; tap_addr = tap_addr + 1)begin
				data[tap_addr] = tap_addr == 10 ? iter : data[tap_addr + 1];
			end	
			for(tap_addr = 0 ; tap_addr < 11 ; tap_addr = tap_addr + 1)begin
				temp = data[tap_addr] * coef[10 - tap_addr];
				acc = acc + temp;	
			end				
			golden[iter] = acc;			
		end
		
	end
	
	
	initial begin
		wait(flag_fir==1'd1);
		wait(checkbits == 16'h00A5);
		@(posedge clock);
		for(ans_cnt = 1; ans_cnt < N-1; ans_cnt = ans_cnt + 1)begin
			wait((checkbits & ans_cnt) == ans_cnt);
			checkbits_cmp = checkbits;
			if(fir_out == golden[ans_cnt])
				$display("%2dth correct : fir_out = %h expect = %h" , ans_cnt , fir_out ,golden[ans_cnt]);
			else
				$display("%2dth error   : fir_out = %h expect = %h" , ans_cnt , fir_out ,golden[ans_cnt]);
				
			wait(checkbits_cmp != checkbits);
			@(posedge clock);
		end
		
		
		wait((checkbits & 16'h005A) == 16'h005A);
		if(fir_out == golden[ans_cnt])
			$display("%2dth correct : fir_out = %h expect = %h" , ans_cnt , fir_out ,golden[ans_cnt]);
		else
			$display("%2dth error   : fir_out = %h expect = %h" , ans_cnt , fir_out ,golden[ans_cnt]);
		wait(checkbits_cmp != checkbits);
		@(posedge clock);
				
    	end
	
	
    	initial begin
        	coef[0]  =  'd0;
        	coef[1]  =  'd1;
        	coef[2]  = -'d2;
        	coef[3]  =  'd3;
        	coef[4]  = -'d4;
        	coef[5]  = -'d3;
        	coef[6]  =  'd4;
        	coef[7]  = -'d3;
        	coef[8]  =  'd2;
        	coef[9]  = -'d1;
        	coef[10] =  'd0;
        	
        	data[0] = 'd0;
        	data[1] = 'd0;
        	data[2] = 'd0;
        	data[3] = 'd0;
        	data[4] = 'd0;
        	data[5] = 'd0;
        	data[6] = 'd0;
        	data[7] = 'd0;
        	data[8] = 'd0;
        	data[9] = 'd0;
        	data[10] = 'd0;
    	end
	
	
	
	
	always@(posedge clock)begin
		if(cnt_flag) latercy_cnt = latercy_cnt + 1;
	end
	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#170000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD1V8;
	wire VDD3V3;
	wire VSS;
    
	assign VDD3V3 = power1;
	assign VDD1V8 = power2;
	assign VSS = 1'b0;

	assign mprj_io[3] = 1;  // Force CSB high.
	assign mprj_io[0] = 0;  // Disable debug mode

	caravel uut (
/*
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
*/
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("counter_la_mm.hex")
		//.FILENAME("uart.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

	// Testbench UART
	tbuart tbuart (
		.ser_rx(uart_tx),
		.tx_start(tx_start),
		.ser_tx(uart_rx),
		.tx_data(tx_data),
		.tx_busy(tx_busy),
		.tx_clear_req(tx_clear_req),
		.recv_buf_data(recv_buf_data)
	);

endmodule
`default_nettype wire
