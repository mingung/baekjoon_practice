// �־��� �ε� �Ҽ����� ���� �κа� �Ҽ��� �Ʒ� �κ���
// �����ؼ� ����ϴ� ���α׷�
#include <iostream>
#include <iomanip> // �Ű������� �ִ� �����ڸ� ����ϱ� ���� �������
using namespace std;

int main()
{
    // ���� ����
    double number;
    int intPart;
    double fractPart;
    // �Է� �ޱ�
    cout << "�ε� �Ҽ��� �Է�: ";
    cin >> number;
    // ó��
    intPart = static_cast<int>(number); // ĳ����: �ڷ����� ���ϴ� ���·� ������ ��ȯ
    fractPart = number - intPart;
    // ���
    cout << fixed << showpoint << setprecision(2);
    cout << "���� ��: " << number << endl;
    cout << "���� �κ�: " << intPart << endl;
    cout << "�Ҽ��� �Ʒ� �κ�: " << fractPart;
    return 0; 
}

// fixed, showpoint, setprecision ������ ���