#include <stdio.h>
int main()
{
    int x = 100;
    int y = 200;

    int *p;

    p = &x;
    printf("p의 값=%d\n", p);
    printf("*p의 값=%d\n", *p);

    p = &y;
    printf("p의 값=%d\n", p);
    printf("*p의 값=%d\n", *p);

    //*p의 값을 실행 도중에 변경 할 수 있다 -> 포인터도 변수이기 때문 


}