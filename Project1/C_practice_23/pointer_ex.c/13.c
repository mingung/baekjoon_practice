#include <stdio.h>
void move(int *xpos, int *ypos); //�Լ� ���� ����

int main()
{
    int x = 10;
    int y = 20;

    printf("������ ��ġ (%d,%d)\n", x, y);
    move(&x, &y); //�Լ� ȣ�� �� �ּ� ���� -> move �Լ���
    printf("������ ��ġ (%d,%d)\n", x, y);

    return 0;
}

void move(int *xpos, int *ypos)  //�ּ� ���� �޴� �Լ�
{
    *xpos = *xpos + 1;
    *ypos = *ypos + 1;

}
