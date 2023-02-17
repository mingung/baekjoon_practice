// 부호 있는 정수 사용하기
/*********************************************************
 * 3회 거래 후의 계좌 잔액을 구하는 프로그램
***********************************************************/

#include <iostream>
using namespace std;

int main()
{
    // 변수 선언
    int balance = 0;
    int transaction;
    // 첫 번째 거래 후 잔액 조정
    cout << "첫 번째 거래 금액 입력: ";
    cin >> transaction;
    balance = balance + transaction;

    // 두 번째 거래 후 잔액 조정
    cout << "두 번째 거래 금액 입력: ";
    cin >> transaction;
    balance = balance + transaction ;

    // 세 번째 거래 후 잔액 조정
    cout << "두 번째 거래 금액 입력: ";
    cin >> transaction;
    balance = balance + transaction ;
    
    // 최종 잔액 출력
    cout << "계좌의 최종 잔액은 " << balance << "달러입니다.";
    return 0;
}