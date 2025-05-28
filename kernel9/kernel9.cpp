#include "kernel9.h"

void kernel9(int a[16*ARRAY_SIZE]){
int x = 0;
int idxa[ARRAY_SIZE];
int val[ARRAY_SIZE];
LOOP1: for (int i = 0; i < ARRAY_SIZE; ++i) {
        #pragma HLS PIPELINE II=1

        x += a[i];
        int idx = i * x * x * x * x;

        idxa[i] = idx;
        val[i] = x;
    }

LOOP2: for (int i = 0; i < ARRAY_SIZE; ++i) {
        #pragma HLS PIPELINE II=1

        a[idxa[i]] = val[i];
    }
}
