/* �̸�, �̴ϼ�, ���� �Է� �ް�
   �����ؼ� ����ϴ� ���α׷�*/

#include <iostream>
#include <string> // string Ŭ������ ����Ϸ��� �о� �鿩�� ��
using namespace std;

int main()
{
    // ���� ����
    string first;
    string initial;
    string last;
    string space = " ";
    string dot = ".";
    string fullname;
    // �̸�, �̴ϼ�, �� �Է¹ޱ�
    cout << "�̸�(first name) �Է��ϱ�: ";
    cin >> first;
    cout << "�̴ϼ�(initial) �Է��ϱ�: ";
    cin >> initial;
    cout << "��(last name) �Է��ϱ�: ";
    cin >> last;
    // ���� �����ڸ� ����ؼ� ���ڿ� ����
    fullname = first + space + last + dot + space + initial;
    // ��ü �̸� ���
    cout << "��ü�̸�(full name)" << fullname;
    return 0;   

    

}

