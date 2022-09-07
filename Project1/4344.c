#include <stdio.h>
#include <math.h>
int main()
{
    int C, N, i, j;
    int sum = 0;
    int count = 0;
    double avarage;
    double result;
    scanf("%d", &C);

    

    for (i = 0; i < C; i++)
    {   
        scanf("%d", &N);
        int score[N];

        for (j = 0; j < N; j++)
        {
            scanf("%d", &score[j]);
            sum = sum + score[j];
        }
        //평균 구하기
        avarage = (double)sum / N;
        // 평균을 넘는 학생들의 비율 구하기
        for (j = 0; j < N; j++)
        {
            if (avarage < score[j])
            {
                count = count + 1;
            }
            else
            {
                count;
            }
            //count 종료 후 0으로 꼭 초기화! -->for문 종료 후
        }
        result = (double)count / N * 100;
        result = floor((result+0.0005)*1000);
        result = result/1000;
        printf("%.3lf%%\n", result);
        //count 값 0으로 초기화
        count = 0;
        sum = 0;

        
    }



}