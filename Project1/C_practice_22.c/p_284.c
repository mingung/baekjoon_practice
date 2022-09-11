#include <stdio.h>

int square(int n); /*함수 원형(컴파일러 함수에 대해 미리알리기 위해
함수 헤더를 프로그램의 첫부분에 한번 더 써줌)*/
int main()
{
    int result;
    result = square(5);
    printf(" %d \n", result);
}
int square(int n)
{
    return(n * n);
}
//함수 원형 선언 예제