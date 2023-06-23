// if 조건문을 이용하여 절댓값을 계산하고 출력하는 프로그램
#include <iostream>
using namespace std;

int main()
{
    // 변수 선언
    int number;
    // 입력 받기
    cout << "정수를 입력하시오: ";
    cin >> number;
    // 절댓값 찾기
    if(number < 0)
    {
        number = -number;
    }
    // 절댓값 출력
    cout << "입력한 숫자의 절댓값 = " << number;
    return 0;
}