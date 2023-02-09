#include <stdio.h>
void menu1(void);
void menu2(void);
void menu3(void);

int main(void)
{
    int choice;

    int (*pf[3]) (void); // 함수 포인터의 배열 선언

    pf[0] = menu1;
    pf[1] = menu2;
    pf[2] = menu3; // 배열 요소에 함수의 주소를 대입한다.

    printf("메뉴를 선택하시오(0:햄버거 1:치킨 2:콜라)");
    scanf("%d", &choice);

    if( choice >=0 && choice <=2)
    {
        pf[choice](); //함수 포인터를 이용하여 함수 호출한다.
        return 0;
    }
}
void menu1(void)
{
    printf("햄버거가 호출되었습니다\n");
}
void menu2(void)
{
    printf("치킨이 호출되었습니다\n");

}
void menu3(void)
{
    printf("콜라가 호출되었습니다\n");

}