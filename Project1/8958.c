#include <stdio.h>
#include <string.h>

int main()
{
    int T, i, j;
    int sum = 0;
    int sum_continue = 0;
    scanf("%d", &T);
    char score[T][79];



    for (i = 0; i < T; i++)
    {
        scanf("%s", score[i]);   
    }
    
    for (i = 0; i < T; i++)
    {
        for (j = 0; j < 79; j++)
        {

            if (score[i][j] == 'O')
            {
                sum = sum + 1;
                sum_continue = sum_continue + sum;
            }
            else if (score[i][j] == 'X')
            {
                sum_continue;
                sum = 0;
            }
            else
            {
                break;
            }
        
        }
        printf("%d\n", sum_continue);
        sum_continue = 0;
        sum = 0;
    }

} 
// 참고자료 https://jimmy-ai.tistory.com/215
