// ���ĺ��� ������ ����, 
// �ҹ��ڸ� ��� �빮�ڷ� �����ϴ� ���α׷�

#include <iostream>
#include <cctype>
using namespace std;

int main()
{
    // ����
    char ch;
    int count = 0;
    // ���� �Է¹ް� ó��
    while (cin >> noskipws >> ch) // noskipws: ���� ���� ���� x -> �д´�
    {
        if (isalpha(ch)) // isalpha = �Ű������� ���ĺ����� Ȯ��
        {
            count++;
        }
        ch = toupper(ch);
        cout << ch;
    }
    // ���� ���� ���
    cout << "���ĺ� ������ ���� = " << count;
    return 0;

}