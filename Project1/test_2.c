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
        int score[3];
        
        

        for (j = 0; j < 3; j++)
        {
            scanf("%d", &score[j]);
            sum = sum + score[j];
        }
        //��� ���ϱ�
        avarage = (double)sum / 3;
        // ����� �Ѵ� �л����� ���� ���ϱ�
        for (j = 0; j < 3; j++)
        {
            if (avarage < score[j])
            {
                count = count + 1;
            }
            else
            {
                count;
            }
            //count ���� �� 0���� �� �ʱ�ȭ! -->for�� ���� ��
        }
        result = (double)count / 3;
        result = floor((result + 0.0005) * 1000);
        result = result / 1000;
        printf("%.3lf%%\n", result * 100);
        //result �� 0���� �ʱ�ȭ
        result = 0;
        count = 0;


    }



}