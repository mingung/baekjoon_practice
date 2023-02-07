#include <stdio.h>
int main()
{
    int i = 10;
    float f = 12.3;
    char c = 69;
    // c는 아스키코드 E
    printf("i의 주소%d\n", &i);
    printf("f의 주소%d\n", &f);
    printf("c의 주소%d\n", &c);

}
// 각 변수의 주소 추출
// 포인터는 베모리의 주소를 가지고 있는 변수
// 변수 i는 주소 6422300번지에 저장된다.