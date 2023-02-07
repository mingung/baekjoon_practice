#include <stdio.h>
void swap(int *px, int *py);

int main()
{
    int a = 100, b = 200;

    printf("swap() 호출 전 a = %d b = %d\n", a, b);
    swap(&a, &b);
    printf("swap() 호출 전 a = %d b = %d\n", a, b);
    
    return 0;

}
void swap(int *px, int *py)
{
    int tmp;

    tmp = *px; //tmp = a;
    *px = *py; // a = b;
    *py = tmp; // b = tmp;
}
//swap함수를 포인터, 참조에 의한 전달을 이용해 값을 교환하는 알고리즘을 구현