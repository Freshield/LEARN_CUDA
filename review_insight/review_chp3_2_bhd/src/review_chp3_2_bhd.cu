/*
 ============================================================================
 Name        : review_chp3_2_bhd.cu
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

int find(int *a){
	return *a;
}

int main(){
	int c;
	int *dev_c;

	int b = 1;
	int * b_ad;
	int find_b;
	b_ad = &b;
	find_b = find(&b);
	printf("b is %d\n",b);
	printf("b address is %d\n", &b);
	//printf("*b is %d\n", *b); error
	printf("b_ad is %d\n", b_ad);
	printf("&b_ad is %d\n", &b_ad);
	printf("*b_ad is %d\n", *b_ad);
	printf("find_b is %d\n", find_b);
	printf("find_b address is %d\n", &find_b);



	cudaMalloc((void**)&dev_c, sizeof(int));

	add<<<1,1>>>(2, 7, dev_c);

	cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);

	cudaFree(dev_c);

	printf("2 + 7 = %d", c);


	
}
