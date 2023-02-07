#include <stdio.h>
int main()
{
    int i = 10;
    int *p;
    p = &i;

    printf("i의 값 = %d\n", i);
    printf("i의 주소 = %d\n", &i);

    printf("p의 값 = %d\n", p);
    printf("p의 주소 = %d\n", *p);
    

    // 마지막 *p의 역할 = 간접 참조 = i의 값
    // p의 값 = 변수 i의 주소를 가리킴
    // int *p = &i; 포인터 p의 선언 및 초기화


}