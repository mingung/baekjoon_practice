// �ڷ��� ��ȯ
/*
* ��� �����ڰ� ���� �ڷ���(bool, char, short, float)��
* ��� �����ڸ� �����ؼ� �Ϲ��� �ڷ��� ��ȯ�ϱ�
*/

#include <iostream>
#include <typeinfo>
using namespace std;

int main()
{
    // ����
    bool x = true;
    char y = 'A';
    short z = 14;
    float t = 24.5;
    // bool���� int�� �ڷ��� ��ȯ
    cout << "x + 100�� �ڷ���: " << typeid(x + 100).name() << endl;
    cout << "x + 100�� ��: " << x + 100 << endl;
    // char���� int�� �ڷ��� ��ȯ
    cout << "y + 1000�� �ڷ���: " << typeid(y + 1000).name() << endl;
    cout << "y + 1000�� ��: " << y + 1000 << endl;
    // short���� int�� �ڷ��� ��ȯ
    cout << "z * 100�� �ڷ���: " << typeid(z * 100).name() << endl;
    cout << "z * 100�� ��: " << z * 100 << endl;
    // float���� double�� ��ȿ�� ��ȯ
    cout << "t + 15000.2�� �ڷ���: " << typeid(t + 15000.2).name() << endl;
    cout << "t + 15000.2�� ��: " << t + 15000.2;
    return 0;

}