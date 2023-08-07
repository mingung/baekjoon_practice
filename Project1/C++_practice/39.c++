/****************************************************************
 *  ���� �ٸ� �ñ״�ó�� ���� �Լ� 3����
 *  �����ε��ϴ� ���� �����ִ� ���α׷�
 *  �����ε�(�̸��� ���� �Լ��� �ټ� �����ϴ� ��) -> �ñ״�ó(�ڷ����� ������ �ٸ���)
*****************************************************************/

#include <iostream>
using namespace std;

// �Լ� ����
int max(int num1, int num2);
int max(int num1, int num2, int num3);
int max(int num1, int num2, int num3, int num4);

int main()
{
    // �����ε� ó���� max �Լ����� ȣ��
    cout << "maxumum(5, 7) = " << max(5, 7) << endl;
    cout << "maxumum(7, 9, 8) = " << max(7, 9, 8) << endl;
    cout << "maxumum(14, 3, 12, 11) = " << max(14, 3, 12, 11) << endl;
    return 0;
}
/*******************************************************
 * �Ű����� 2��(num1, num2)�� ���� max �Լ��� ����
 * �Ű����� 2�� �߿��� �� ū ���� ����
********************************************************/
int max(int num1, int num2)
{
    int larger; // ���� ����
    if(num1 >= num2)
    {
        larger = num1;
    }
    else
    {
        larger = num2;
    }
    return larger;
}
/*****************************************************
 * �Ű����� 3���� ���� max �Լ��� ����
 * ������ ������� max �Լ��� ����ؼ�
 * num1, num2 �� ū ���� ã�� ��,
 * �� ���� num3 �߿� ū ���� ã�� ����
******************************************************/
int max(int num1, int num2, int num3)
{
    return max(max(num1, num2), num3);
}
/******************************************************
 * �Ű����� 4���� ���� max �Լ��� ����
 * ������ ������� �Ű������� 3���� �Լ��� ȣ���ؼ�
 * num1, num2, num3 �߿� ū ���� ã��
 * �Ű������� 2���� max �Լ��� ȣ���ؼ�,
 * �� ���� num4 �߿� ū ���� ã�� ����
********************************************************/
int max(int num1, int num2, int num3, int num4)
{
    return max(max(num1, num2, num3), num4);
}
