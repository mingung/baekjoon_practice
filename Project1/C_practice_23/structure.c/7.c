#include <stdio.h>
#define N 4

struct student{
    char name[20];
    int eng;
    int math;
    int phy;
};
struct student list[4] = {
        {"ȫ�浿", 82, 72, 58},
        {"������", 97, 82, 39},
        {"�̼���", 52, 62, 39},
        {"�庸��", 88, 72, 62}
    };

int main(void)
{
    int i;
    for (i = 0; i < N; i++)
    {
        printf("%s: ���� = %d ���� = %d ���� = %d\n",list[i].name, list[i].eng, list[i].math, list[i].phy);
    }
    return (0); //(0) ??
}

