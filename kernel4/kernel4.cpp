#include "kernel4.h"

void kernel4(int a[ARRAY_SIZE], int factor[ARRAY_SIZE], int targetIndex)
{
	int tmp = a[targetIndex];
    LOOP1: for (int i=targetIndex+1; i<ARRAY_SIZE-1; ++i){
    #pragma HLS PIPELINE
        tmp = tmp - factor[i]*(a[i] + a[i+1]);
    }
    a[targetIndex] = tmp;
}
