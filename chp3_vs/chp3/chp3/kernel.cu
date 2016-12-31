
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>

using namespace std;

__global__ void kernel(int a, int b, int *c)
{
	*c = a + b;
}

int main(void)
{
	int c;
	int *dev_c;
	cudaMalloc((void**)&dev_c, sizeof(int));
	kernel << <1, 1 >> > (2, 7, dev_c);
	cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost);
	printf("2+7=%d\n",c);
	cudaFree(dev_c);

	int res;
	int *dev_res;
	cudaMalloc((void**)&dev_res, sizeof(int));
	kernel << <1, 1 >> > (8, 2, dev_res);
	cudaMemcpy(&res, dev_res, sizeof(int), cudaMemcpyDeviceToHost);
	cout << *dev_res << endl;
	cout << "8+2=" << res << endl;

	return 0;
    
}
