/****************************************************************
 *  서로 다른 시그니처를 갖는 함수 3개를
 *  오버로딩하는 예를 보여주는 프로그램
 *  오버로딩(이름이 같은 함수를 다수 정의하는 것) -> 시그니처(자료형과 조합을 다르게)
*****************************************************************/

#include <iostream>
using namespace std;

// 함수 선언
int max(int num1, int num2);
int max(int num1, int num2, int num3);
int max(int num1, int num2, int num3, int num4);

int main()
{
    // 오버로딩 처리한 max 함수들을 호출
    cout << "maxumum(5, 7) = " << max(5, 7) << endl;
    cout << "maxumum(7, 9, 8) = " << max(7, 9, 8) << endl;
    cout << "maxumum(14, 3, 12, 11) = " << max(14, 3, 12, 11);
    return 0;
}
/*******************************************************
 * 매개변수 2개(num1, num2)를 갖는 max 함수의 정의
 * 매개변수 2개 중에서 더 큰 것을 리턴
********************************************************/
int max(int num1, int num2)
{
    int larger; // 지역 변수
    if(num1 >= num2)
    {
        larger = num1;
    }
    else
    {
        larger = num2;
    }
    return larger;
}
/*****************************************************
 * 매개변수 3개를 갖는 max 함수의 정의
 * 이전에 만들었던 max 함수를 사용해서
 * num1, num2 중 큰 값을 찾은 후,
 * 그 값과 num3 중에 큰 값을 찾아 리턴
******************************************************/
int max(int num1, int num2, int num3)
{
    return max(max(num1, num2), num3);
}
/******************************************************
 * 매개변수 4개를 갖는 max 함수의 정의
 * 이전에 만들었던 매개변수가 3개인 함수를 호출해서
 * num1, num2, num3 중에 큰 값을 찾고
 * 매개변수가 2개인 max 함수를 호출해서,
 * 이 값과 num4 중에 큰 값을 찾아 리턴
********************************************************/
int max(int num1, int num2, int num3, int num4)
{
    return max(max(num1, num2, num3), num4);
}

