#include <stdio.h>
void menu1(void);
void menu2(void);
void menu3(void);

int main(void)
{
    int choice;

    int (*pf[3]) (void); // �Լ� �������� �迭 ����

    pf[0] = menu1;
    pf[1] = menu2;
    pf[2] = menu3; // �迭 ��ҿ� �Լ��� �ּҸ� �����Ѵ�.

    printf("�޴��� �����Ͻÿ�(0:�ܹ��� 1:ġŲ 2:�ݶ�)");
    scanf("%d", &choice);

    if( choice >=0 && choice <=2)
    {
        pf[choice](); //�Լ� �����͸� �̿��Ͽ� �Լ� ȣ���Ѵ�.
        return 0;
    }
}
void menu1(void)
{
    printf("�ܹ��Ű� ȣ��Ǿ����ϴ�\n");
}
void menu2(void)
{
    printf("ġŲ�� ȣ��Ǿ����ϴ�\n");

}
void menu3(void)
{
    printf("�ݶ� ȣ��Ǿ����ϴ�\n");

}