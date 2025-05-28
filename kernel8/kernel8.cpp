#include "kernel8.h"

void kernel8(int a[ARRAY_SIZE], int factor, int offset)
{
    LOOP1: for (int i=6; i<ARRAY_SIZE-1-offset; ++i)
    {
	#pragma HLS loop_tripcount min=0 max=2048
    #pragma HLS PIPELINE
        a[i] = a[i-6+offset]*factor;
    }
}

