// 게임 프로그램, x축 방향으로 1픽셀, y축 방향으로 1픽셀 이동
#include <stdio.h>
void move(int xpos, int ypos);

int main()
{
    int x = 10; // 주인공의 x 좌표
    int y = 20; // 주인공의 y 좌표

    printf("현재의 위치 (%d,%d)\n", x, y);
    move(x, y);
    printf("현재의 위치 (%d,%d)\n", x, y); 
    return 0;
}
void move(int xpos, int ypos)
{
    xpos = xpos + 1;
    ypos = ypos + 1;
}
// 위치변경 x 
// WHY? 값에 의한 호출 -> 변수의 값 복사, 원본 변경x return을 이용해 반환해주어야함