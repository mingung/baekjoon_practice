// 단순 할당 연산자 확인하기
#include <iostream>
using namespace std;
int main()
{
    // 변수 선언
    int x;
    int y;
    // 첫 번째 할당
    cout << "할당 표현식의 리턴값: " << (x = 14) << endl;
    cout << "변수 x의 값: " << x << endl;
    // 두 번째 할당
    cout << "할당 표현식의 리턴값: " << (y = 87) << endl; // *할당을 명확하게 표현할 수 있게 () 표시*
    cout << "변수 y의 값: " << y << endl;
    return 0; 
}