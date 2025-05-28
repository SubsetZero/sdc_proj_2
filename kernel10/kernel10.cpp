#include "kernel10.h"

void kernel10(int a[ARRAY_SIZE], int b[ARRAY_SIZE], int m[ARRAY_SIZE])
{
    LOOP1: for (int i=0; i < ARRAY_SIZE; i++) {
    #pragma HLS PIPELINE off
	#pragma HLS loop_tripcount min=0 max=2048
    	int s = 0;
    	LOOP2: for (int j=0; j < m[i]; j++) {
    	#pragma HLS PIPELINE
    	#pragma HLS loop_flatten off
		#pragma HLS loop_tripcount min=0 max=2048
        	s += a[j];
    	}
    	b[i] = s;
    }
}
