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
        printf("두 수가 동일합니다.\n");
    }
    
}

int main()
{
    int sum, x, y;
    scanf("%d %d", &x, &y);

    sum = get_max(x, y);
    printf("%d\n", sum);
    
}

// 두 정수를 입력받은 후 더 큰 수를 반환하여 sum으로 출력하는 알고리듬