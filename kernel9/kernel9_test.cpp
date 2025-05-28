#include <stdio.h>
#include <stdlib.h>
#include "kernel9.h"

void kernel9_sw(int a[16*ARRAY_SIZE])
{
    int x=0;  
    LOOP1: for (int i=0; i < ARRAY_SIZE; i++)
    {
        x = x + a[i];
        a[i*x*x*x*x] = x;
    }
}

int main() 
{
    // Input and output arrays
    int a[16*ARRAY_SIZE];
    int a_sw[16*ARRAY_SIZE];

    // Initialize arrays
    a[0] = 1;
    a_sw[0] = 1;
    for (int i=1; i < 16*ARRAY_SIZE; i++) {
    	a[i] = 0;
    	a_sw[i] = 0;
    }
    a[10] = 1;
    a_sw[10] = 1;
    
    // Run the kernel
    kernel9(a);

    // Run the naive code to get results for comparison
    kernel9_sw(a_sw);

    // Check results
    bool pass = true;
    for (int i = 0; i < 16*ARRAY_SIZE; i++) {
    	if (a[i] != a_sw[i]) {
    		printf("Error in a at index %u \n", i);
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

