#include "kernel1.h"

void kernel1( int a[ARRAY_SIZE] )
{
    int i;
    LOOP1: for(i=0; i<ARRAY_SIZE; i++) {
    #pragma HLS PIPELINE II = 1
        a[i] = a[i] * 5;
    }
}
