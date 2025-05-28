#include <stdio.h>
#include <stdlib.h>
#include "kernel10.h"

void kernel10_sw(int a[ARRAY_SIZE], int b[ARRAY_SIZE], int m[ARRAY_SIZE])
{
    LOOP1: for (int i=0; i < ARRAY_SIZE; i++) {
    	int s = 0;
    	LOOP2: for (int j=0; j < m[i]; j++) {
        	s += a[j];
    	}
    	b[i] = s;
    }
}

int main() 
{
    // Input and output arrays
    int a[ARRAY_SIZE];
    int m[ARRAY_SIZE];
    int b[ARRAY_SIZE];
    int b_sw[ARRAY_SIZE];
    
    // Initialize arrays
    for (int i=0; i < ARRAY_SIZE; i++) {
    	a[i] = i;
    	m[i] = i % 10 + 2;
    }
    
    // Run the kernel
    kernel10(a, b, m);

    // Run the naive code to get results for comparison
    kernel10_sw(a, b_sw, m);
    
    // Check results
    bool pass = true;
    for (int i = 0; i < ARRAY_SIZE; i++) {
    	if (b[i] != b_sw[i]) {
    		printf("Error in b at index %u", i);
    		pass = false;
    	}
    }
    
    if(pass)
    {
	printf("Test passed !\n");
    	return 0;    
    }

    printf("Test failed  !!!\n");
    return 1;
}
