 #include <stdio.h>
 #include <string.h>

 struct student{
    int number;
    char name[10]; //���� �迭�� ���ڿ��� �����Ҷ��� strcpy()�� ���
    double gpa;

 };

 int main(void)
 {
    struct student s; //�������� s �ʱ갪 --> �����Ⱚ

    s.number = 20140001;
    strcpy(s.name, "ȫ�浿"); //name = "ȫ�浿" --> ���x
    s.gpa = 4.3;

    printf("�й�: %d\n", s.number);
    printf("�̸�: %s\n", s.name);
    printf("�й�: %lf\n", s.gpa);

    return 0;


 }