/********************************************
 * 연도를 나타내는 정수를 입력받는 함수,
 * 윤년인지 확인하는 함수,
 * 결과를 출력하는 함수를 정의하고 활용하는 프로그램
*********************************************/

#include <iostream>
using namespace std;

// 선언(프로토타입)
int input();
bool process(int year);
void output(int year, bool result);

int main()
{
    // Input, processing, output
    int year = input();
    bool result = process(year);
    output(year, result);
    return 0;
}

/************************************************
 * input 함수의 정의
 * intput 함수는 main 함수로부터 호출
 * 사용자로부터 연도를 나타내는 값을 입력받고(부가 작용) 리턴
 * 입력을 받을 때 1582년 이후의 연도인지 확인
 * 이 함수는 매개변수가 없지만 리턴값이 있는 함수
 * **********************************************/
int input()
{
    int year;
    do
    {
        cout << "1582년 이후의 연도를 입력하세요: ";
        cin >> year;
    } while(year <= 1582);
    return year;
}
/************************************************
 * process 함수의 정의
 * main 함수로부터 매개변수를 전달 받고,
 * 연도를 나타내는 매개변수가 윤년에 해당하는지 확인하고,
 * 불 자료형을 릴턴
 * 이 함수는 매개변수와 리턴값이 있으며 부가 작용은 없음
 * **********************************************/
bool process(int year)
{
    bool criterial = (year % 4 == 0);
    bool criteria2 = (year % 100 != 0) || (year % 400 == 0);
    return(criterial) && (criteria2);
}
/************************************************
 * output 함수는 연도를 나타내는 int 자료형과
 * 윤년인지 나타내는 불 자료형의 값을 입력받고 이를 화면에 출력
 * 매개변수 2개를 void 함수
 * **********************************************************/
void output(int year, bool result)
{
    if(result)
    {
        cout << year << "년은 윤년입니다";
    }
    else // return 0 -> 반환값이 없다고 판단
    {
        cout << year << "년은 윤년이 아닙니다";
    }
    return;
}