#include <stdio.h>

int main()
{
    int a[] = {10, 20, 30, 40};

    printf("&a[0] = %d\n", &a[0]); //배열의 첫번째 원소의 주소를 정수형으로 출력
    printf("&a[0] = %d\n", &a[1]); 
    printf("&a[0] = %d\n", &a[2]);

    printf("a = %d\n", a); // 배열의 이름을 주소 형식으로 출력

    return 0;

}