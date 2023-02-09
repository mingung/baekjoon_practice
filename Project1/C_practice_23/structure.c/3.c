#include <stdio.h>
#include <math.h>
struct point{
    int x1, x2;
    int y1, y2;
};

int main()
{
    struct point p1;
    printf("첫 번째 점의 좌표: ");
    scanf("%d %d", &p1.x1, &p1.y1);
    printf("두 번째 점의 좌표: ");
    scanf("%d %d", &p1.x2, &p1.y2);

    double x_length, y_length, total_length;
    x_length = (double)(p1.x1 - p1.x2) * (p1.x1 - p1.x2);
    y_length = (double)(p1.y1 - p1.y2) * (p1.y1 - p1.y2);
    total_length = sqrt(x_length + y_length); //sqrt() = 루트 구하는 내장함수

    printf("거리는 %.2lf입니다", total_length);


    return 0;
}
// 두 점 사이의 거리 구하기