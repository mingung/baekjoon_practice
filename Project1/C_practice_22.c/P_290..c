#include <stdio.h>
//소수 판별기
// 1과 자기 자신만을 약수로 갖는 수
int is_prime(int n);

int main()
{ 
    int x, result_last;
    printf("정수를 입력하시오: ");
    scanf("%d", &x);
    result_last = is_prime(x);

    if (result_last == 0)
    {
        printf("%d은 소수가 아닙니다.\n", x);
    }
    else
    {
        printf("%d은 소수입니다.\n", x); 
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