/*
 ============================================================================
 Name        : review_chp3_2.cu
 Author      : freshield
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */

#include <stdio.h>

__global__ void add(int a, int b, int *c){
	*c = a + b;
}

int main(void){
	int c;
	int *dev_c;//define dev_c as a pointer
	cudaMalloc( (void**)&dev_c, sizeof(int));//get dev_c address
	//change dev_c address to void** type
	//allocate a address on GPU, and give the address number to dev_c
	//
	//all in all: dev_c is a pointer, get the dev_c address and change
	//to void** type

	add<<<1,1>>>(2, 7, dev_c);//use function and back value to
	//the place where dev_c point

	cudaMemcpy( &c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);
	//get c address, allocate the value which dev_c store and copy to c

	printf( "2 + 7 = %d\n", c);
	cudaFree(dev_c);

	return 0;
}
