#include <stdio.h>

int get_line_parameter(int x1, int y1, int x2, int y2, double *slope, double *yintercept) // * 포인터를 통하여 값을 반환하였다.
{
    if( x1 == x2)
    return -1; // return 0; 0을 반환하는 이유 -> 에러 없이 정상적으로 함수가 종료되었다는 뜻

    else
    {
        *slope = (double) (y2 - y1) / (double) (x2 - x1);
        *yintercept = y1 - (*slope)*x1;
        return 0;
    }
}
int main()
{
    double s, y;
    if (get_line_parameter(3, 3, 6, 6, &s, &y)== -1) // -1이 반환되면 오류가 발생한 것, &s, &y --> 변수의 주소를 전달한다.
        printf("에러\n");
    else
        printf("기울기는 %f, y절편은 %f\n", s, y);
    return 0;
}