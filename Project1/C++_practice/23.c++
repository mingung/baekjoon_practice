// ���� ������ ���̸� �Է¹ް�
// ���ٰ����� �ѷ��� ���̸� ���ϴ� ���α׷�

#include <iostream>
#include <cmath>
using namespace std;

int main()
{
    // ���� ����
    const double PI = 3.141592;
    int n;
    double s, peri, area;
    // ���� ���� �Է¹ޱ�
    do
    {
        cout << "���� ������ �Է��ϼ���(4 �̻��� ����): ";
        cin >> n;
    }
    while(n < 4); // do-while: do{} �ѹ� ������ ���� �� ���� Ȯ��
    // ���� ���� �Է¹ޱ�
    do
    {
        cout << "���� ���̸� �Է��ϼ���: ";
        cin >> s;  
    } while(s <= 0.0);
    // �ѷ��� ���� ���ϱ�
    peri = n * s;
    area = (n * pow (s, 2)) / (n * tan(PI / n));
    // ��� ���
    cout << "�ѷ�: " << peri << endl;
    cout << "����: " << area << endl;
    return 0;
}