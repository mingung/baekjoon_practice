// �Ű������� �ִ� void �Լ�
// ������ ����ϴ� ���α׷�

#include <iostream>
using namespace std;

/********************************************
 * pattern �Լ��� ����
 * pattern �Լ��� �Ű������� �ִ� void �Լ�
 * �Լ��� ȣ��� �� �Ű������� ������ ũ��(size)�� ���޹���
 * �� �Ű������� ������ ũ�⸦ ��Ÿ��
*********************************************/

void pattern(int size)
{
    for(int i = 0; i < size; i++)
    {
        for(int j = 0; j < size; j++)
        {
            cout << "*";
        }
        cout << endl;
    }
    return;
}

int main()
{
    // ����
    int patternSize; // �Լ��� ������ ��
    // �Է� ��ȿ�� �˻�
    do
    {
        cout << "������ ũ�⸦ �Է��ϼ���: ";
        cin >> patternSize;
    } while(patternSize <= 0);
    // �Լ� ȣ��
    pattern(patternSize); // �̶� patternSize�� �μ�(argument) -> size ��� ������ �Ҵ�
    return 0;
}