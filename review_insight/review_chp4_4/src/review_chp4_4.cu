/*
 ============================================================================
 Name        : review_chp4_4.cu
 Author      : freshield
 Version     :
 Copyright   : Your copyright notice
 Description : CUDA compute reciprocals
 ============================================================================
 */

#include "../../common/book.h"
#include "../../common/cpu_bitmap.h"

#define DIM 1000

int main(){
	CPUBitmap bitmap(DIM, DIM);
	unsigned char *dev_bitmap;
	
	cudaMalloc((void**)&dev_bitmap, bitmap.image_size());

	dim3 grid(DIM, DIM);
	kernel<<<grid, 1>>>(dev_bitmap);

	cudaMemcpy(bitmap.get_ptr(), dev_bitmap,
			bitmap.image_size(), cudaMemcpyDeviceToHost);

	bitmap.display_and_exit();

	cudaFree(dev_bitmap);


}
