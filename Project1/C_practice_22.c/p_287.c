// �ŵ����� ���� ���ϴ� ����
#include <stdio.h>
int power(int x, int y);

int main()
{
    int a, b, result;

    printf(" �� ���� ������ �Է��Ͻÿ�: ");
    scanf("%d %d", &a, &b);
    result = power(a, b);
    printf("%d�� %d���� %d�Դϴ�. \n", a, b, result);
    
}
int power(int x, int y)
{
    int i;
    int value = 1;

    for (i = 0; i < y; i++)
    {
        value = value * x;
        
    }
    return(value);
}
