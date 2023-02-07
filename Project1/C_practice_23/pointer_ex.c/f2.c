#include <stdio.h>
int add(int x, int y) // int x, int y = 매개변수
{
    int result;

    result = x + y;

    return(result);

// 함수 호출해서 인수를 통해 매개변수에 전달 후 return 통해 호출한 곳으로 반환한다.

}

int main()
{
    int sum;
    sum = add(2, 3); // (2,3) = 인수
    printf("덧셈결과 = %d \n", sum);

    sum = add(6, 8);
    printf("덧셈결과 = %d \n", sum);

    return 0;


}

