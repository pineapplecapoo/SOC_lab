//#ifndef __FIR_H__
//#define __FIR_H__

#define N 64


// AP control
#define reg_mprj_slave_apcontrol (*(volatile uint32_t*)0x30000000)
// data len = 64
//#define reg_fir_len (*(volatile uint32_t*)0x30000010)
// TAP coeff
#define reg_fir_coeff_0  (*(volatile uint32_t*)0x30000020)
#define reg_fir_coeff_1  (*(volatile uint32_t*)0x30000024)
#define reg_fir_coeff_2  (*(volatile uint32_t*)0x30000028)
#define reg_fir_coeff_3  (*(volatile uint32_t*)0x3000002c)
#define reg_fir_coeff_4  (*(volatile uint32_t*)0x30000030)
#define reg_fir_coeff_5  (*(volatile uint32_t*)0x30000034)
#define reg_fir_coeff_6  (*(volatile uint32_t*)0x30000038)
#define reg_fir_coeff_7  (*(volatile uint32_t*)0x3000003c)
#define reg_fir_coeff_8  (*(volatile uint32_t*)0x30000040)
#define reg_fir_coeff_9  (*(volatile uint32_t*)0x30000044)
#define reg_fir_coeff_10 (*(volatile uint32_t*)0x30000048)
// FIR input X, FIR output Y
#define reg_mprj_slave_xn (*(volatile uint32_t*)0x30000080)
#define reg_mprj_slave_yn (*(volatile uint32_t*)0x30000084)
//data_length & tap
#define reg_mprj_slave_data_length 	(*(volatile uint32_t*) 0x30000010)
#define reg_mprj_slave_tap_param 	(*(volatile uint32_t*) 0x30000040)

//int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};

int outputsignal[N];
