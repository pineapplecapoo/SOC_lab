#include "fir.h"

void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {
	for(int i=0;i<N;i++){
            inputbuffer[i] = 0;
            outputsignal[i] = 0; 
        }
}    

int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
	initfir();
	int mult;
        int temp;
        int data;

        for(int i=0;i<N;i++){
           mult = 0;
           temp = inputsignal[i];
           for (int j=N-1;j>=0;j--){
                if(j==0){
                    inputbuffer[0] = temp;
                    data = temp;
                }
                else{
                    inputbuffer[j] = inputbuffer[j-1];
                    data = inputbuffer[j];
                }
                mult += data * taps[j];    
            }
            outputsignal[i] = mult;
        }

	return outputsignal;
}
		
