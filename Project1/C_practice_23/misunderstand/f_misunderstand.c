#include <stdio.h>

void update_array(int x[])
{
    x[0] = 99;
}

int main()
{
    int a[] = {10, 20, 30, 40};
    update_array(a); //배열이름은 배열의 주소이므로 인수로 채택된 a가 매개변수 int x[]로 주소가 전달된다.
    printf("a[0]=%d a[1]=%d a[2]=%d\n", a[0], a[1], a[2]); // a[] 배열 요소 값이 변경되었다. 

    return 0;
}

// 이해x
// 이해 완료
