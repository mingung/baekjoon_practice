#include <stdio.h>
int power(int x, int y);
int main()
{
    int result;
    result = power(2, 3);
    printf("%d", result);
}
int power(int x, int y)
{
    int i;
    int sum = 1;
    for (i = 0; i < y; i++)
    {
        sum = sum * x;
    }
    return(sum);
}
//2^3=8을 구현하는 알고리듬(함수 원형을 사용, 함수선언) 