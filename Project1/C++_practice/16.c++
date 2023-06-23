// 주어진 부동 소수점의 정수 부분과 소수점 아래 부분을
// 추출해서 출력하는 프로그램
#include <iostream>
#include <iomanip> // 매개변수가 있는 조정자를 사용하기 위한 헤더파일
using namespace std;

int main()
{
    // 변수 선언
    double number;
    int intPart;
    double fractPart;
    // 입력 받기
    cout << "부동 소수점 입력: ";
    cin >> number;
    // 처리
    intPart = static_cast<int>(number); // 캐스팅: 자료형을 원하는 형태로 강제로 변환
    fractPart = number - intPart;
    // 출력
    cout << fixed << showpoint << setprecision(2);
    cout << "원래 값: " << number << endl;
    cout << "정수 부분: " << intPart << endl;
    cout << "소수점 아래 부분: " << fractPart;
    return 0; 
}

// fixed, showpoint, setprecision 조정자 사용