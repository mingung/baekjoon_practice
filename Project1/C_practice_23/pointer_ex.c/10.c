// 참조에 의한 전달
#include <stdio.h>
void move(int *xpos, int *ypos);

int main()
{
    int x = 10;
    int y = 20;

    printf("현재의 위치 (%d,%d) \n", x, y);
    move(&x, &y);
    printf("현재의 위치 (%d,%d) \n", x, y);

    return 0; 
}

void move(int *xpos, int *ypos) // x, y변수의 주소가 매개변수로 전달된다.
{
    *xpos = *xpos + 1;
    *ypos = *ypos + 1;

}