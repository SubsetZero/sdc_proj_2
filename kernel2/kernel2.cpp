#include "kernel2.h"

void kernel2( int a[ARRAY_SIZE] )
{
    int i;
    int a0 = a[0];
    int a1 = a[1];
    int a2 = a[2];
    int tmp;
    LOOP1: for(i=3; i<ARRAY_SIZE; i++) {
    #pragma HLS PIPELINE II = 1
        tmp = a2 + a1 * a0;
        a[i] = tmp;
        a0 = a1;
        a1 = a2;
        a2 = tmp;
    }
}
