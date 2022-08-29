#include <stdio.h>
int main()
{
    int N;
    int i, minimum, maximum;
    scanf("%d", &N);
    int arr[N];
    
    
     for (i = 0; i < N; i++)
    {
        scanf("%d", &arr[i]);  
    }
    minimum = arr[0];
    for (i = 0; i < N; i++)
    {
        if(arr[i]<minimum)
        {
            minimum = arr[i];
        }
    }
    maximum = arr[0];
    for (i = 0; i < N; i++)
    {
        if (arr[i] > maximum)
        {
            maximum = arr[i];
        }
    }
    printf("%d %d", minimum, maximum);
}
//배열의 값 입력 받고 최대 최소 출력