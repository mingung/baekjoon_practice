// �⺻�� ����ϱ�
// �⺻ �Ű������� ����ϴ� ���α׷�

#include <iostream>
using namespace std;

// �Լ� ����: �� ��° �Ű������� �⺻���� 40
double calcEarnings(double rate, double hours = 40);

int main()
{
    // ù ��° �Լ� ȣ���� �⺻ �Ű������� ����ϰ� ����
    cout << "���� 1�� �ӱ�: " << calcEarnings(22.0) << endl;
    cout << "���� 2�� �ӱ�: " << calcEarnings(12.50, 18);
    return 0;
}
/*******************************************************
 * �Լ� ���𿡼� �̹� �⺻ �Ű������� ����߱� ������
 * �Լ� ���ǿ����� �⺻ �Ű������� �Է����� ����
********************************************************/
double calcEarnings(double rate, double hours)
{
    double pay;
    pay = hours * rate;
    return pay;
}