// �� �ڷ����� boolalpha ������ ����ϱ�
#include <iostream>
using namespace std;

int main()
{
    // ����
    bool x = true;
    bool y = false;
    // ������ ���� ���
    cout << "�⺻���� x�� ���: " << x << endl;
    cout << "�⺻���� y�� ���: " << y << endl;
    // ������ ����Ͽ� ���
    cout << "�����ڸ� ����� x�� ��: " << boolalpha << x << endl; //boolalpha�� ��½�Ʈ�� ����
    cout << "y�� ��: " << y; // boolalpha ��� x
    return 0;



}