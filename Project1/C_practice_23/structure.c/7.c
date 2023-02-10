#include <stdio.h>
#define N 4

struct student{
    char name[20];
    int eng;
    int math;
    int phy;
};
struct student list[4] = {
        {"홍길동", 82, 72, 58},
        {"강감찬", 97, 82, 39},
        {"이순신", 52, 62, 39},
        {"장보고", 88, 72, 62}
    };

int main(void)
{
    int i;
    for (i = 0; i < N; i++)
    {
        printf("%s: 영어 = %d 수학 = %d 물리 = %d\n",list[i].name, list[i].eng, list[i].math, list[i].phy);
    }
    return (0); //(0) ??
}

