// ��ȣ ���� ���� �ڷ����� �����÷ο�� ����÷ο� Ȯ���ϱ�
#include <iostream>
#include <limits>
using namespace std;

int main()
{
    // ��ȣ ���� ������ �ִ밪�� �ּҰ� �˻�
    unsigned int num1 = numeric_limits<unsigned int>::max();
    unsigned int num2 = numeric_limits<unsigned int>::min();
    // �ִ񰪰� �ּڰ� ���
    cout << "��ȣ ���� ������ �ִ�: " << num1 << endl;
    cout << "��ȣ ���� ������ �ּڰ�: " << num2 << endl;
    // ������ �����÷ο�� ����÷ο� �߻�
    num1 += 1;
    num2 -= 1;
    // �����÷ο�� ����÷ο�� �� ���
    cout << "�����÷ο찡 �Ͼ num1 + 1�� ��: " << num1 << endl;
    cout << "����÷ο찡 �Ͼ num1 + 1�� ��: " << num2 << endl;
    return 0;



}