#include <stdio.h>
#include <string.h>

struct person{
    char name[20];
    char address[20];
    char number[100];
};

int main(void)
{
    struct person s;
    printf("이름을 입력하시오: ");
    gets(s.name);
    printf("주소를 입력하시오: ");
    gets(s.address);
    printf("전화번호를 입력하시오: ");
    gets(s.number);

    printf("이름: %s\n", s.name);
    printf("주소: %s\n", s.address);
    printf("전화번호: %s\n", s.number);

    return 0;



    
}