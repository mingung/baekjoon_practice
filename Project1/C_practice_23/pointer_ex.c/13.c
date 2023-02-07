#include <stdio.h>
void move(int *xpos, int *ypos); //함수 원형 선언

int main()
{
    int x = 10;
    int y = 20;

    printf("현재의 위치 (%d,%d)\n", x, y);
    move(&x, &y); //함수 호출 및 주소 전달 -> move 함수로
    printf("현재의 위치 (%d,%d)\n", x, y);

    return 0;
}

void move(int *xpos, int *ypos)  //주소 전달 받는 함수
{
    *xpos = *xpos + 1;
    *ypos = *ypos + 1;

}
