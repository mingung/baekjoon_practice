// ���� �������� ���� ã�� ���α׷�
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    // ���� ����
    int a, b, c;
    double term;
    // ��� �Է¹ޱ�
    cout << "��� a�� ���� �Է��ϼ���: ";
    cin >> a;
    cout << "��� b�� ���� �Է��ϼ���: ";
    cin >> b;
    cout << "��� c�� ���� �Է��ϼ���: ";
    cin >> c;
    // �Ǻ���(b^2 - 4ac) ���
    term = pow(b, 2) - 4 * a * c;
    if(term < 0)
    {
        cout << "���� �����ϴ�." << endl;
    }
    else if(term == 0)
    {
        cout << "�� ���� �����ϴ�." << endl;
        cout << "x1 = x2 =" << -b / (2*a) << endl;
    }
    else
    {
        cout << "���� �ٸ� �� ���� �ֽ��ϴ�." << endl;
        cout << "x1 = " << (-b + sqrt(term)) / (2 * a) << endl;
        cout << "x2 = " << (-b - sqrt(term)) / (2 * a) << endl;
    }
    return 0;


}