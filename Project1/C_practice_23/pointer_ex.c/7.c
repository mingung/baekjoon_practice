#include <stdio.h>
int main()
{
    int i = 10;
    int *p;

    p = &i;

    printf("i의 값 = %d\n", i);

    *p = 20;
    printf("i의 값 = %d\n", i);

    // 포인터를 통하여 변수에 저장된 값을 변경할 수 있다.

}