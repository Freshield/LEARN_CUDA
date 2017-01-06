
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>

using namespace std;

struct MyStruct
{
	int a;
	int b;
	int c;
};

int main(void)
{
	int *ptr;
	char *ptr1;
	int **ptr2;
	int(*ptr3)[3];
	int *(*ptr4)[4];

	int temp = sizeof(*ptr);
	printf("result is :%d\n",temp);

	int array[20];
	int *ptr5 = array;

	for (int i = 0; i < 20; i++)
	{
		array[i] = i;
	}

	for (int i = 0; i < 20; i++)
	{
		(*ptr5)++;
		ptr5++;
	}

	for (int i = 0; i < 20; i++)
	{
		printf("number %d: value %d\n", i, array[i]);
	}

	int a1 = 12;
	int b1;
	int *p1;
	int **ptr6;
	p1 = &a1;
	*p1 = 24;
	ptr6 = &p1;
	*ptr6 = &b1;
	**ptr6 = 34;

	printf("a1 is %d,b1 is %d,*p1 is %d,**ptr6 is %d\n", a1, b1, *p1, **ptr6);

	char *str1[3] = {
		"Hello,this is a sample!\n",
		"Hi,good morning\n",
		"Hello world\n"
	};
	char s[80];
	strcpy(s, str1[0]);
	printf(s);
	cout << **str1 << endl;
	strcpy(s, str1[1]);
	printf(s);
	strcpy(s, str1[2]);
	printf(s);

	MyStruct ss = { 20,30,40 };
	MyStruct *ptr7 = &ss;
	int *pstr = (int*)&ss;
	cout << sizeof(ptr7) << " and " << sizeof(pstr) << endl;
	cout << ptr7->a << " " << ptr7->b << " " << ptr7->c << endl;
	cout << *pstr << " " << *(pstr + 1) << " " << *(pstr + 2) << endl;

	int fun1(char*, int);
	int(*pfun1)(char*, int);
	pfun1 = fun1;
	int res = (*pfun1)("abcdefg", 7);
}

int fun1(char* x1, int x2){
	cout << x1 << " " << x2 << endl;
	return 0;
}
