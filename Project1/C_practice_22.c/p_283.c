#include <stdio.h>
/*int square(int n)
{
    return(n*n);
}*/
int get_max(int x, int y)
{
    
    if(x > y)
    {
        return(x);
    }
    else if (x < y)
    {
        return(y);
    
    }
    else
    {
        printf("�� ���� �����մϴ�.\n");
    }
    
}

int main()
{
    int sum, x, y;
    scanf("%d %d", &x, &y);

    sum = get_max(x, y);
    printf("%d\n", sum);
    
}

// �� ������ �Է¹��� �� �� ū ���� ��ȯ�Ͽ� sum���� ����ϴ� �˰���