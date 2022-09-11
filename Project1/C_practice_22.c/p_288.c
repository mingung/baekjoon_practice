#include <stdio.h>
int get_larger( int x, int y);
int main()
{
    int a, b, result;
    printf("두 개의 정수를 입력하시오: ");
    scanf("%d %d", &a, &b);
    result = get_larger(a, b);
    printf("두 수 중에서 큰 수는 %d입니다.", result);

}
int get_larger( int x, int y)
{
    if (x > y)
    {
        return(x);
    }
    else if (x < y)
    {
        return(y);
    }
}