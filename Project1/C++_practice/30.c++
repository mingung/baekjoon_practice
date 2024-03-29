// 매개변수와 리턴값이 있는 함수
// 사용자로부터 입력받은 두 양의 정수 중에 어떤 숫자가 더 큰지
// 확인하는 함수를 정의하고 활용하는 프로그램이다

#include <iostream>
using namespace std;

/* larger 함수는 두 값을 매개변수로 받고
   둘 중에 더 큰수를 찾아서 값을 리턴하는 함수
   별도의 부가 작용은 없음
*/

int larger(int fst, int snd)
{
    int max;
    if(fst > snd)
    {
        max = fst;
    }
    else
    {
        max = snd;
    }
    return (max);
}

int main()
{
    // 선언
    int first, second;
    // 입력받기
    cout << "첫 번째 숫자를 입력하세요: ";
    cin >> first;
    cout << "두 번째 숫자를 입력하세요: ";
    cin >> second;
    // 함수 호출
    cout << "두 수 중에 큰 것 = " << larger(first, second) << endl; // 두 값을 larger 함수로 전달 -> larger 함수에서는 둘 중 더 큰 값을 리턴함
    return 0; 
}
