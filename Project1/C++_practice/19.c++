// if ���ǹ��� �̿��Ͽ� ������ ����ϰ� ����ϴ� ���α׷�
#include <iostream>
using namespace std;

int main()
{
    // ���� ����
    int number;
    // �Է� �ޱ�
    cout << "������ �Է��Ͻÿ�: ";
    cin >> number;
    // ���� ã��
    if(number < 0)
    {
        number = -number;
    }
    // ���� ���
    cout << "�Է��� ������ ���� = " << number;
    return 0;
}