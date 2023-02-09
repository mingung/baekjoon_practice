//배열이름 = 포인터 <-> 포인터 = 배열이름
#include <stdio.h>

int main()
{
    int a[] = { 10, 20, 30, 40};
    int *p;

    p = a; // 포인터 p에 배열의 이름 a를 대입하면 배열의 첫번째 주소가 p에 대입되는것과 똑같다. --> p와 a는 똑같은 곳을 가리킴

    printf("a[0] = %d a[1] = %d a[2] = %d\n", a[0], a[1], a[2]);
    printf("p[0] = %d p[1] = %d p[2] = %d\n", p[0], p[1], p[2]);
}