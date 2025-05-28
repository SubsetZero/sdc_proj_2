#include "kernel6.h"

void kernel6(int region_start[ARRAY_SIZE], int region_len[ARRAY_SIZE], int index_dst[ARRAY_SIZE], int results[2*ARRAY_SIZE]) {
	LOOP1: for (int i = 0; i < ARRAY_SIZE; i++) {
	#pragma HLS PIPELINE
	    int start = region_start[i];  // Starting index of region
	    int len   = region_len[i];    // Length of region
	    int dst   = index_dst[i]; // Where to store the sum

	    int sum = 0;
	    LOOP2: for (int j = 0; j < len; j++) {
		#pragma HLS loop_tripcount min=0 max=2048
	    #pragma HLS loop_flatten
    	    #pragma HLS PIPELINE
		sum += results[start + j];
	    }
	    results[dst] = sum;
	}
}
