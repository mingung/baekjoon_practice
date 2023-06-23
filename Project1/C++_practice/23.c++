// 변의 갯수와 길이를 입력받고
// 정다각형의 둘레와 넓이를 구하는 프로그램

#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    // 변수 선언
    const double PI = 3.141592;
    int n;
    double s, peri, area;
    // 변의 갯수 입력받기
    do
    {
        cout << "변의 개수를 입력하세요(4 이상의 정수): ";
        cin >> n;
    }
    while(n < 4); // do-while: do{} 한번 무조건 실행 후 조건 확인
    // 변의 길이 입력받기
    do
    {
        cout << "변의 길이를 입력하세요: ";
        cin >> s;  
    } while(s <= 0.0);
    // 둘레와 넓이 구하기
    peri = n * s;
    area = (n * pow (s, 2)) / (n * tan(PI / n));
    // 결과 출력
    cout << "둘레: " << peri << endl;
    cout << "넓이: " << area << endl;
    return 0;
}