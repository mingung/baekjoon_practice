#include <stdio.h>
int main()
{
    double A, B;
    scanf("%lf %lf", &A, &B);
    printf("%.20f", A/B);
}
//double형의 범위가 더 크기 때문에 정확도가 높아진다
// float < double < long double