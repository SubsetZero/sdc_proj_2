#include <stdio.h>
#include <stdlib.h>
#include "kernel6.h"

void kernel6_sw(int region_start[ARRAY_SIZE], int region_len[ARRAY_SIZE], int index_dst[ARRAY_SIZE], int results[2*ARRAY_SIZE]) {
	LOOP1: for (int i = 0; i < ARRAY_SIZE; i++) {
	    int start = region_start[i];  // Starting index of region
	    int len   = region_len[i];    // Length of region
	    int dst   = index_dst[i]; // Where to store the sum

	    int sum = 0;
	    LOOP2: for (int j = 0; j < len; j++) {
		sum += results[start + j];
	    }
	    results[dst] = sum;
	}
}

int main()
{
    // Input and output arrays
    int region_start[ARRAY_SIZE];
    int region_len[ARRAY_SIZE];
    int index_dst[ARRAY_SIZE];
    int results[2 * ARRAY_SIZE];
    int results_sw[2 * ARRAY_SIZE];

    // Initialize results with some values to sum from
    for (int i = 0; i < 2 * ARRAY_SIZE; i++) {
        results[i] = i + 1; // e.g., results = {1, 2, 3, ..., 1025}
        results_sw[i] = i + 1;
    }

    // Define regions to sum (simple case)
    for (int i = 0; i < ARRAY_SIZE; i++) {
        region_start[i] = i;           // Region starts at index i
        region_len[i]   = 100;           // Each region has length 100
        index_dst[i]    = ARRAY_SIZE + i; // Store sums in the second half of results[]
    }

    // Run the kernel
    kernel6(region_start, region_len, index_dst, results);

    // Run the naive code to get results for comparison
    kernel6_sw(region_start, region_len, index_dst, results_sw);

    // Check results
    bool pass = true;
    for (int i = 0; i < ARRAY_SIZE; i++) {
    	if (results[i] != results_sw[i]) {
    		printf("Error in results at index %u", i);
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
