/*************************************
 * 키보드로부터 2개의 숫자 값을 입력받은 뒤에
 * 두 값을 더한 후 출력하는 프로그램
***************************************/
#include <iostream>
using namespace std;

int main()
{
    // 선언
    int num1;
    int num2;
    int sum;
    // 입력받기
    cout << "첫 번째 숫자 입력: ";
    cin >> num1; //scanf
    cout << "두 번째 숫자 입력: ";
    cin >> num2;
    // 계산과 결과 저장
    sum = num1 + num2;
    // 출력
    cout << "두 숫자의 합: " << sum << endl; // cout(모니터는), <<(출력한다), "~~"(이러한 메세지를) 
    return 0;
}
