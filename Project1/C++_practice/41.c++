// 전역 변수의 셰도잉
// 지역 변수가 전역 변수를 셰도잉
#include <iostream>
using namespace std;

int num = 5; // 전역 변수

int main()
{
    cout << num << endl; // 전역 변수 num
    int num = 25; // 지역 변수
    cout << num; // 지역 변수 num이 전역 변수 num을 가림(셰도잉)
    return 0;
}