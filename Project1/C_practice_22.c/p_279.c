#include <stdio.h>

void print_lines(void)
{
    printf("-------------\n");
}

int main()
{
    int i;
    print_lines();      //함수 호출

    for (i=0; i <5; i++)
    {
        printf("%d의 제곱은 %d \n", i, i*i);

    }

    print_lines();  //함수 호출
    
    return 0;
}