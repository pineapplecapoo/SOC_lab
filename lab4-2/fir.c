#include <stdint.h>
#include <stdbool.h>
#include "fir.h"

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){ 
	
	
	reg_mprj_slave_apcontrol = 1; //set ap_start, bit[0] = 1
    reg_mprj_slave_xn = 0;
	
	for(int i = 0; i < N-1; i++){

		outputsignal[i] = reg_mprj_slave_yn;
		
		reg_mprj_slave_xn = i+1;
	}

	outputsignal[N-1] = reg_mprj_slave_yn;
	while((reg_mprj_slave_apcontrol >> 1) & 1 != 1); // read ap_done, bit[1] = 1

	return &outputsignal[62];
}

		
