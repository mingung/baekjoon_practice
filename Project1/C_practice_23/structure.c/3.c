#include <stdio.h>
#include <math.h>
struct point{
    int x1, x2;
    int y1, y2;
};

int main()
{
    struct point p1;
    printf("ù ��° ���� ��ǥ: ");
    scanf("%d %d", &p1.x1, &p1.y1);
    printf("�� ��° ���� ��ǥ: ");
    scanf("%d %d", &p1.x2, &p1.y2);

    double x_length, y_length, total_length;
    x_length = (double)(p1.x1 - p1.x2) * (p1.x1 - p1.x2);
    y_length = (double)(p1.y1 - p1.y2) * (p1.y1 - p1.y2);
    total_length = sqrt(x_length + y_length);

    printf("�Ÿ��� %.2lf�Դϴ�", total_length);


    return 0;
}
