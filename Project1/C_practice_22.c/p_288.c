#include <stdio.h>
int get_larger( int x, int y);
int main()
{
    int a, b, result;
    printf("�� ���� ������ �Է��Ͻÿ�: ");
    scanf("%d %d", &a, &b);
    result = get_larger(a, b);
    printf("�� �� �߿��� ū ���� %d�Դϴ�.", result);

}
int get_larger( int x, int y)
{
    if (x > y)
    {
        return(x);
    }
    else if (x < y)
    {
        return(y);
    }
}