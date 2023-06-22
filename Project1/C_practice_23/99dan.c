#include <stdio.h>

int main()
{   
    int i, j;
    int sum = 0;

    for (i = 1; i < 10; i++)
    {   
        for (j = 1; j < 10; j++)
        {
            sum = i * j;
            printf("%d = %d * %d\n", sum, i, j);
            
        }
       
    }

}