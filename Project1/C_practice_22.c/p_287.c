// 거듭제곱 값을 구하는 예제
#include <stdio.h>
int power(int x, int y);

int main()
{
    int a, b, result;

    printf(" 두 개의 정수를 입력하시오: ");
    scanf("%d %d", &a, &b);
    result = power(a, b);
    printf("%d의 %d승은 %d입니다. \n", a, b, result);
    
}
int power(int x, int y)
{
    int i;
    int value = 1;

    for (i = 0; i < y; i++)
    {
        value = value * x;
        
    }
    return(value);
}
