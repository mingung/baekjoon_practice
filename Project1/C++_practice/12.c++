// ���� �Ҵ� ǥ������ ��� �����ִ� ���α׷�
#include <iostream>
using namespace std;

int main()
{
    // 5���� ���� ����� �ʱ�ȭ
    int x = 20;
    int y = 30;
    int z = 40;
    int t = 50;
    int u = 60;
    // ���� �Ҵ� ���
    x += 5;
    y -= 3;
    z *= 10;
    t /= 8;
    u %= 7;
    // ���
    cout << "x�� ��: " << x << endl;
    cout << "y�� ��: " << y << endl;
    cout << "z�� ��: " << z << endl;
    cout << "t�� ��: " << t << endl;
    cout << "u�� ��: " << u << endl;
    return 0; 
}