#include <stdio.h>

int add(int x, int y)
{
    int result;

    result = x + y;
    return(result); //result ���� ��ȯ�ȴ�.
}

int main(void)
{
    int sum;

    sum = add(2, 3);
    printf("���� ��� = %d \n", sum);

    sum = add(6, 8);
    printf("���� ��� = %d \n", sum);

    return 0;


}