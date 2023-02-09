#include <stdio.h>
struct point{
    int x;
    int y;
}; // 소스의 처음 부분에서 구조체 정의하는것이 *중요* 
// 전체 소스 파일에서 사용하여 변수룰 만들 수 있다.
//구조체는 x,y 두개의 멤버로 정의 되어있다
// 아직 구조체 변수는 선언되지 않았다.

int main()
{
    struct point p1; // 구조체 변수 선언

    p1.x = 10;
    p1.y = 20;

    printf("점의 x좌표=%d\n", p1.x);
    printf("점의 y좌표=%d\n", p1.y);

    return 0;

}