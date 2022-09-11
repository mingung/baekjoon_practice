#include <stdio.h>
int factorial(int n);
int main()
{
    int result;
    result = factorial(4);
    printf("%d", result);
}
int factorial(int n)
{
    int i;
    int sum = 1;
    for (i = 0; i < n; i++)
    {
        //n n-1 n-2 n-3 ... 1
        sum = sum * (n-i);
          
    }
    return(sum);
}
