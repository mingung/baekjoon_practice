#include <stdio.h>

// print_lines() �Լ��� 2�� ȣ���Ͽ� ȭ�鿡 ���м��� ���

void print_lines(void) //�Լ� ����
{
    printf("--------------\n");
    printf("--------------\n");

}

int main(void)
{
    int i;

    print_lines();      //�Լ� ȣ��

    for (i=0; i <5; i++)
    {
        printf("%d�� ������ %d \n", i, i*i);

    }
    print_lines();

    return 0;
}
