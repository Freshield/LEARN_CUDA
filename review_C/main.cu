
#include <printf.h>

__global__ void kernel(void){

}

int main() {
    kernel<<<1,1>>>();
    printf("hello, world!\n");
    return 0;
}