// 셰도잉 무시, 전역 엔티티 접근 시
// 범위 해결 연산자(::) 사용
#include <iostream>
using namespace std;

int num = 5; // 전역 변수

int main()
{
    int num = 25; // 지역 변수
    cout << "전역 변수 num의 값 = " << ::num << endl;
    cout << "지역 변수 num의 값 = " << num << endl;
    return 0;
}