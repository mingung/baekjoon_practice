// ���� �������� ������� �ѷ��� ������ ���ϴ� ���α׷�

#include <iostream>
using namespace std;

int main()
{
    // ��� ����
    const double PI = 3.141592;
    // ���� 3�� ����
    double radius;
    double perimeter;
    double area;
    // ������ �Է¹ޱ�
    cout << "���� ������ �Է�: ";
    cin >> radius;
    // �ѷ��� ������ ����ϰ� ������ ����
    perimeter = 2 * PI * radius;
    area = PI * radius * radius;
    // ������, �ѷ�, ���� ���
    cout << "������: " << radius << endl;
    cout << "�ѷ�: " << perimeter << endl;
    cout << "����: " << area << endl;
    
    return 0;





}