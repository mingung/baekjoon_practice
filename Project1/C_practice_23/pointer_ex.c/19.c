#include <stdio.h>
int get_sum(int *p, int n);

int main()
{
    int data[] = {10, 20, 30, 40, 50};
    int value;

    value = get_sum(data, 5); //배열 data를 배열크기인 5와 함꼐 get_sum으로 전달한다.

    printf("%d \n", value);
    return 0;
}

int get_sum(int *p, int n)
{
    int i;
    int sum = 0;

    for (i=0; i<n; i++)
    sum += *(p+i);
    return sum;
}
