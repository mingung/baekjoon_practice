#include <stdio.h>
struct student{
    char name[20];
    int number;
    double gpa;
};

struct student list[3] = {
    {"kim", 202112767, 3.6},
    {"kang", 292321322, 4.1},
    {"park", 231232313, 4}
};

int main(void)
{
    struct student max;
    int i;
    max = list[0];
    
    for (i = 0; i <3; i++)
    {
        
        if (list[i].gpa > max.gpa)
        {
            max = list[i];
        }
    }

    printf("�̸�: %s, �й�: %d, ����: %f\n", max.name, max.number, max.gpa);

}
//�� �Ϸ� ** -> �Ϸ��