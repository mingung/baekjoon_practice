#include <stdio.h>
#include <string.h>

struct person{
    char name[20];
    char address[20];
    char number[100];
};

int main(void)
{
    struct person s;
    printf("�̸��� �Է��Ͻÿ�: ");
    gets(s.name);
    printf("�ּҸ� �Է��Ͻÿ�: ");
    gets(s.address);
    printf("��ȭ��ȣ�� �Է��Ͻÿ�: ");
    gets(s.number);

    printf("�̸�: %s\n", s.name);
    printf("�ּ�: %s\n", s.address);
    printf("��ȭ��ȣ: %s\n", s.number);

    return 0;



    
}