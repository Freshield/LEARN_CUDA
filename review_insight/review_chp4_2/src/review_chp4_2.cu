/*
 ============================================================================
 Name        : review_chp4_2.cu
 Author      : freshield
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */
#include <stdio.h>

#define N 100

__global__ void add(int *a, int *b, int *c){
	int tid = blockIdx.x;
	if(tid < N){
		c[tid] = a[tid] + b[tid];
	}
}

__global__ void set_a(int *a){
	int tid = blockIdx.x;
	if(tid < N){
		a[tid] = -tid;
	}
}

__global__ void set_b(int *b){
	int tid = blockIdx.x;
	if(tid < N){
		b[tid] = tid * tid;
	}
}

int main(){
	int a[N], b[N], c[N];
	int *dev_a, *dev_b, *dev_c;
	
	cudaMalloc((void**)&dev_a, N * sizeof(int));
	cudaMalloc((void**)&dev_b, N * sizeof(int));
	cudaMalloc((void**)&dev_c, N * sizeof(int));
/*
	for(int i = 0; i < N; i++){
		a[i] = -i;
		b[i] = i * i;
	}

	cudaMemcpy(dev_a, a, N * sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(dev_b, b, N * sizeof(int), cudaMemcpyHostToDevice);
*/
	set_a<<<N,1>>>(dev_a);

	set_b<<<N,1>>>(dev_b);

	add<<<N,1>>>(dev_a, dev_b, dev_c);


	cudaMemcpy(a, dev_a, N * sizeof(int), cudaMemcpyDeviceToHost);
	cudaMemcpy(b, dev_b, N * sizeof(int), cudaMemcpyDeviceToHost);
	cudaMemcpy(c, dev_c, N * sizeof(int), cudaMemcpyDeviceToHost);

	for(int i = 0; i < N; i++){
		printf("%d + %d = %d\n", a[i], b[i], c[i]);
	}

	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaFree(dev_c);

	return 0;
}
