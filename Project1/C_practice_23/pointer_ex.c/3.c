#include <stdio.h>
int main()
{
    int *p;
    int i = 10;
    p = &i;
    *p = 20;
    printf("%d \n", *p);
    // *p = 변수 i를 가리키고 있는 포인터 변수 p가 변수 i 의 내용을 가져온다
}