#include <stdio.h>
struct point{
    int x;
    int y;
}; // �ҽ��� ó�� �κп��� ����ü �����ϴ°��� *�߿�* 
// ��ü �ҽ� ���Ͽ��� ����Ͽ� ������ ���� �� �ִ�.
//����ü�� x,y �ΰ��� ����� ���� �Ǿ��ִ�
// ���� ����ü ������ ������� �ʾҴ�.

int main()
{
    struct point p1; // ����ü ���� ����

    p1.x = 10;
    p1.y = 20;

    printf("���� x��ǥ=%d\n", p1.x);
    printf("���� y��ǥ=%d\n", p1.y);

    return 0;

}