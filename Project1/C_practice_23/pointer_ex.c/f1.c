#include <stdio.h>
void print_lines(void) //함수 정의
{
    printf("------------\n");
  
    
}
int main()
{
    int i;
    print_lines();

    for(i = 0; i < 5; i++)
    {
        printf("%d의 제곱은 %d\n", i, i*i);
    }

    print_lines();
}