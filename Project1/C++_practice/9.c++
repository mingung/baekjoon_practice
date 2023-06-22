/* 이름, 이니셜, 성을 입력 받고
   결합해서 출력하는 프로그램*/

#include <iostream>
#include <string> // string 클래스를 사용하려면 읽어 들여야 함
using namespace std;

int main()
{
    // 변수 선언
    string first;
    string initial;
    string last;
    string space = " ";
    string dot = ".";
    string fullname;
    // 이름, 이니셜, 성 입력받기
    cout << "이름(first name) 입력하기: ";
    cin >> first;
    cout << "이니셜(initial) 입력하기: ";
    cin >> initial;
    cout << "성(last name) 입력하기: ";
    cin >> last;
    // 결합 연산자를 사용해서 문자열 연결
    fullname = first + space + last + dot + space + initial;
    // 전체 이름 출력
    cout << "전체이름(full name)" << fullname;
    return 0;   

    

}

