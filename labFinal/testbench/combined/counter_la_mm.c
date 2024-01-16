/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>
#include <user_uart.h>
#define N 64
#ifdef USER_PROJ_IRQ0_EN
#include <irq_vex.h>
#endif

extern void uart_write();
extern void uart_write_char();
extern void uart_write_string();
extern void uart_reset_write_fifo();
extern int uart_isr();
extern int uart_read();

int* __attribute__ ( ( section ( ".mprjram" ) ) ) mmatrix();
int* __attribute__ ( ( section ( ".mprjram" ) ) ) QS();
int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir();
// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

void main()
{
	int j;
	#ifdef USER_PROJ_IRQ0_EN
    int mask;
#endif
	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	// reg_spi_enable = 1;
	// reg_spimaster_cs = 0x00000;

	// reg_spimaster_control = 0x0801;

	// reg_spimaster_control = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.

	// The upper GPIO pins are configured to be output
	// and accessble to the management SoC.
	// Used to flad the start/end of a test 
	// The lower GPIO pins are configured to be output
	// and accessible to the user project.  They show
	// the project count value, although this test is
	// designed to read the project count through the
	// logic analyzer probes.
	// I/O 6 is configured for the UART Tx line

        reg_wb_enable = 1;

    reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_23 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_22 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_21 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_20 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_19 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_18 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_17 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

    reg_mprj_io_15 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_14 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_13 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_12 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_11 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_10 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_9  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_8  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_7  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_4  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_3  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_2  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_1  = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_0  = GPIO_MODE_MGMT_STD_OUTPUT;

    reg_mprj_io_6  = GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_5  = GPIO_MODE_USER_STD_INPUT_NOPULL;
    


	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]
	reg_la1_data = 0x00000000;
	reg_la1_oenb = reg_la1_iena = 0x00000000;        

	//reg_uart_clkdiv = 0x00002580; // baudrate 9600
	reg_uart_clkdiv = 0x0001C200; //115200
        #ifdef USER_PROJ_IRQ0_EN	
	// unmask USER_IRQ_0_INTERRUPT
	mask = irq_getmask();
	mask |= 1 << USER_IRQ_0_INTERRUPT; // USER_IRQ_0_INTERRUPT = 2
	irq_setmask(mask);
	// enable user_irq_0_ev_enable
	user_irq_0_ev_enable_write(1);	
	#endif	
	
	reg_mprj_datal = 0xAB600000;//start
	
	 
	mmatrix();
	 
	QS();
	
	fir();
	
	
	reg_mprj_datal = 0xAB610000;
}
//#define SIZE 4
int* __attribute__ ( ( section ( ".mprjram" ) ) ) mmatrix(){
	
	int counter,counter1,counter2;
	int data;
	int temp;
		reg_mprj_datal = 0x00A50000; 
		for(counter = 0 ; counter < 16 ; counter+=1){ 
			reg_mm_x = counter;
		}
		for(counter1 = 0 ; counter1 < 16 ; counter1+=1){
			reg_mm_x = counter1;
		}
		for(counter2 = 0 ; counter2 < 16 ; counter2+=1){
		   reg_extra = 0x00000001;
		   reg_mprj_datal = reg_mm_y << 16;
		}
		reg_mprj_datal = 0x005A0000;
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) QS(){
	int counter;
	int data;
	int temp;
		while((reg_QS_control & 0x00000004) == 0x00000004); // check idle


		reg_QS_control = 0x00000001; // ap_start assert
		reg_mprj_datal = 0x00A50000;
	
		for(counter = 11 ; counter >= 1 ; counter-=1){
			reg_QS_x = counter;
			
		}
		
		for(counter = 0 ; counter <= 10 ; counter+=1){
			//data = reg_QS_y << 16;
			reg_extra = 0x00000001;
			reg_mprj_datal = reg_QS_y << 16;
			
		}
		reg_mprj_datal = 0x005A0000;
		while((reg_QS_control & 0x00000002) == 0x00000002); // done flag assert
		
	
	 while((reg_QS_control & 0x00000004) == 0x00000004); // check idle	
	 
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	int taps[11] = {0,1,-2,3,-4,-3,4,-3,2,-1,0};
	int counter;
	int data;
	int temp;
		//while((reg_fir_control & 0x00000004) == 0x00000004); // check idle
		
		
		//test_0();
		reg_fir_length = N;         // data length trasnfer
		reg_fir_coeff0 = taps[10];
		reg_fir_coeff1 = taps[9];
		reg_fir_coeff2 = taps[8];
		reg_fir_coeff3 = taps[7];
		reg_fir_coeff4 = taps[6];
		reg_fir_coeff5 = taps[5];
		reg_fir_coeff6 = taps[4];
		reg_fir_coeff7 = taps[3];
		reg_fir_coeff8 = taps[2];
		reg_fir_coeff9 = taps[1];
		reg_fir_coeff10 = taps[0];

		//while((reg_fir_control & 0x00000004) == 0x00000004); // check idle
		
		reg_fir_control = 0x00000001; // ap_start assert
		
		reg_mprj_datal = 0x00A50000;  
		
		
		
		//reg_mprj_datal = 0x00A50000;  // let latency-timer (in testbench) start counting
		//counter = 1 ;
		for(counter = 1 ; counter < N-1 ; counter+=1){//1~63
			
			reg_fir_x = counter;
			//data = reg_fir_y << 24;
			reg_mprj_datal = (reg_fir_y << 24) + (counter<< 16);
			
		}
	
		
		reg_fir_x = counter;	
		
		reg_mprj_datal = (reg_fir_y << 24) + 0x005A0000;
	
		while((reg_fir_control & 0x00000002) == 0x00000002); // done flag assert
		
	
	 while((reg_fir_control & 0x00000004) == 0x00000004); // check idle
	
	//}		
	 
}



