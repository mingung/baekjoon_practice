#include <stdio.h>
int main()
{
    int i = 10;
    int *p;
    p = &i;

    printf("i�� �� = %d\n", i);
    printf("i�� �ּ� = %d\n", &i);

    printf("p�� �� = %d\n", p);
    printf("p�� �ּ� = %d\n", *p);
    

    // ������ *p�� ���� = ���� ���� = i�� ��
    // p�� �� = ���� i�� �ּҸ� ����Ŵ
    // int *p = &i; ������ p�� ���� �� �ʱ�ȭ


}