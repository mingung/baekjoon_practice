// ���� ���α׷�, x�� �������� 1�ȼ�, y�� �������� 1�ȼ� �̵�
#include <stdio.h>
void move(int xpos, int ypos);

int main()
{
    int x = 10; // ���ΰ��� x ��ǥ
    int y = 20; // ���ΰ��� y ��ǥ

    printf("������ ��ġ (%d,%d)\n", x, y);
    move(x, y);
    printf("������ ��ġ (%d,%d)\n", x, y); 
    return 0;
}
void move(int xpos, int ypos)
{
    xpos = xpos + 1;
    ypos = ypos + 1;
}
// ��ġ���� x 
// WHY? ���� ���� ȣ�� -> ������ �� ����, ���� ����x return�� �̿��� ��ȯ���־����