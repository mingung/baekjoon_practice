#include <stdio.h>
//�Ҽ� �Ǻ���
// 1�� �ڱ� �ڽŸ��� ����� ���� ��
int is_prime(int n);

int main()
{ 
    int x, result_last;
    printf("������ �Է��Ͻÿ�: ");
    scanf("%d", &x);
    result_last = is_prime(x);

    if (result_last == 0)
    {
        printf("%d�� �Ҽ��� �ƴմϴ�.\n", x);
    }
    else
    {
        printf("%d�� �Ҽ��Դϴ�.\n", x); 
    }
}
int is_prime(int n)
{
    int a, i;
    int result;

    for (i = 2; i < n; i++)
    {

        a = n % i;
        if (a == 0)
        {
            return(a);
            
        }
        else
        {
    
            
        }
        
    }
    return(a);

}