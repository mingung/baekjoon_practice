// ������ ���� ��Ŀ���򿡼� parameter�� ������
// argument�� ������ �شٴ� ���� Ȯ���ϴ� ���α׷�

#include <iostream>
using namespace std;

// �Լ� ����
void fun(int& y); //& ��ȣ�� y�� ������� ���� ��Ÿ�� (�μ��� �Ű������� �޸� ��ġ�� ����)

int main()
{
    // ���� ����
    int x = 10;
    // x�� argument�� fun �Լ� ȣ��
    fun(x);
    // x�� ���� ���ߴ��� Ȯ��(����)
    cout << "main �Լ� ������ x = " << x << endl;
    return 0;
}

/***************************************************
 * fun �Լ��� y�� ������ ���޹���
 * ���� y�� �Լ� ȣ�� �� argument�� ��Ī�� ��
 * parameter�� �����ϸ�
 * argument�� �Բ� ����
****************************************************/
void fun(int& y)
{
    y++;
    cout << "fun �Լ� ������ y = " << y << endl;
    return;
}