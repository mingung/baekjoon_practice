#include <stdio.h>
int main()
{
    int x = 100;
    int y = 200;

    int *p;

    p = &x;
    printf("p�� ��=%d\n", p);
    printf("*p�� ��=%d\n", *p);

    p = &y;
    printf("p�� ��=%d\n", p);
    printf("*p�� ��=%d\n", *p);

    //*p�� ���� ���� ���߿� ���� �� �� �ִ� -> �����͵� �����̱� ���� 


}