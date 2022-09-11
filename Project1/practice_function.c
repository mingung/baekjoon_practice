#include <stdio.h>

// print_lines() 함수를 2번 호출하여 화면에 구분선을 출력

void print_lines(void) //함수 정의
{
    printf("--------------\n");
    printf("--------------\n");

}

int main(void)
{
    int i;

    print_lines();      //함수 호출

    for (i=0; i <5; i++)
    {
        printf("%d의 제곱은 %d \n", i, i*i);

    }
    print_lines();

    return 0;
}
