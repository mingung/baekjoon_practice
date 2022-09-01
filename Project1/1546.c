#include <stdio.h>
int main()
{
    int N, i;
    scanf("%d", &N);
    float score[N];
    float M;
    float result;
    float result_clear = 0;

    for (i = 0; i < N; i++)
    {
        scanf("%f", &score[i]);
    }
    M = score[0];
    for (i = 0; i < N; i++)
    {
        if (M < score[i])
        {
            M = score[i];
        }
    }
    for (i = 0; i < N; i++)
    {
        result = score[i]/M*100;
        result_clear = result_clear + result;
    }
    printf("%f", result_clear/(float)N);

}