#include "kernel7.h"

float kernel7(float array1[ARRAY_SIZE], float array2[ARRAY_SIZE])
{
	float ps[8] = {0.0f};
	float sum = 0.0f;

	LOOP1: for (int i = 0; i < ARRAY_SIZE; ++i) {
		#pragma HLS PIPELINE II=1

		float diff = array1[i] - array2[i];
		if (diff > 0.0f) {
				int idx = i & (7);
				ps[idx] += diff;
		}
	}

	LOOP2: for (int j = 0; j < 8; ++j) {
		#pragma HLS UNROLL
		sum += ps[j];
	}
return sum;
}
