
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>

using namespace std;

int main()
{
	cudaDeviceProp prop;

	int count;
	cudaGetDeviceCount(&count);
	for (int i = 0; i < count; i++)
	{
		cudaGetDeviceProperties(&prop, i);

		cout << "information for device " << i << endl;
		cout << "name:" << prop.name << endl;
		cout << "capability:" << prop.major << "." << prop.minor << endl;
		cout << "clock rate:" << prop.clockRate << endl;
		cudaDeviceProp sDevProp = prop;
		printf("%d \n", i);
		printf("Device name: %s\n", sDevProp.name);
		printf("Device memory: %d\n", sDevProp.totalGlobalMem);
		printf("Memory per-block: %d\n", sDevProp.sharedMemPerBlock);
		printf("Register per-block: %d\n", sDevProp.regsPerBlock);
		printf("Warp size: %d\n", sDevProp.warpSize);
		printf("Memory pitch: %d\n", sDevProp.memPitch);
		printf("Constant Memory: %d\n", sDevProp.totalConstMem);
		printf("Max thread per-block: %d\n", sDevProp.maxThreadsPerBlock);
		printf("Max thread dim: ( %d, %d, %d )\n", sDevProp.maxThreadsDim[0],
			sDevProp.maxThreadsDim[1], sDevProp.maxThreadsDim[2]);
		printf("Max grid size: ( %d, %d, %d )\n", sDevProp.maxGridSize[0],
			sDevProp.maxGridSize[1], sDevProp.maxGridSize[2]);
		printf("Ver: %d.%d\n", sDevProp.major, sDevProp.minor);
		printf("Clock: %d\n", sDevProp.clockRate);
		printf("textureAlignment: %d\n", sDevProp.textureAlignment);
	}

	cout << "next" << endl;
	int dev;
	cudaGetDevice(&dev);
	cout << "id of current cuda device:" << dev << endl;
	cudaDeviceProp temp_prop;
	memset(&temp_prop, 0, sizeof(cudaDeviceProp));
	temp_prop.major = 1;
	temp_prop.minor = 3;
	cudaChooseDevice(&dev, &prop);
	cout << "id of cuda device closest to revision 1.3:" << dev << endl;
	cudaSetDevice(dev);
}
