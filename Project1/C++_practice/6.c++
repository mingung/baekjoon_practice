/**************************************
 * 3가지 정수 자료형의 크기를 확인하는 프로그램
***************************************/

#include <iostream>
using namespace std;

int main()
{
    cout << "short int의 크기는 " << sizeof(short int) << "바이트입니다." << endl;
    cout << "int의 크기는 " << sizeof(int) << "바이트입니다." << endl;
    cout << "long int의 크기는 " << sizeof(long int) << "바이트입니다." << endl;
    return 0;

}