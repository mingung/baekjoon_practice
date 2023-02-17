#include <iostream>
//  불 변수의 값을 사용하는 프로그램

#include <iostream>
using namespace std;

int main()
{
    // 변수 선언
    bool x = 132;
    bool y = -8;
    bool z = 0;
    bool t = -0;
    bool u = true;
    bool v = false;
    // 값 출력
    cout << "x의 값: " << x << endl;
    cout << "y의 값: " << y << endl;
    cout << "z의 값: " << z << endl;
    cout << "t의 값: " << t << endl;
    cout << "u의 값: " << u << endl;
    cout << "v의 값: " << v << endl;
    return 0;
}
// 0이 아닌 값은 양수와 음수를 포함하여 ture로 변환
