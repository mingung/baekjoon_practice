#include <stdio.h>
void print_lines(void) //�Լ� ����
{
    printf("------------\n");
  
    
}
int main()
{
    int i;
    print_lines();

    for(i = 0; i < 5; i++)
    {
        printf("%d�� ������ %d\n", i, i*i);
    }

    print_lines();
}