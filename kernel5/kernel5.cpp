#include "kernel5.h"

float kernel5 (float max,
               float array1[ARRAY_SIZE], float
array2[ARRAY_SIZE]) {

    float sum = 0.0;
    LOOP1: for(int i = 0; i < ARRAY_SIZE; i++){
		#pragma HLS PIPELINE
    	sum = sum < max ? array1[i] + array2[i] : sum;
    }
    return sum;
 }
