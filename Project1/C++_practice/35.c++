// ���� swap �ϱ�
/******************************************
 * ������ ���� ��Ŀ������ ����ؼ�
 * �� ���� swap�ϴ� ���α׷�
*******************************************/

#include <iostream>
using namespace std;

void swap(int& first, int& second); // �Լ� ����

int main()
{
    // ����
    int first = 10;
    int second = 20;
    swap(first, second); // �Լ� ȣ��
    // swap Ȯ��
    cout << "main �Լ��� first �� = " << first << endl;
    cout << "main �Լ��� second �� = " << second << endl;
    return 0;
}
/********************************************************
 * swap �Լ��� ������ ���� ��Ŀ��������
 * 2���� parameter�� ����
 * temp��� �ӽ� ������ ����ؼ� fst�� snd�� ���� swap
 * ������ ���� ��Ŀ�������� ���� parameter�� ���������Ƿ�
 * argument(main �Լ��� first�� second)���� ������ ��ħ 
*********************************************************/
void swap(int& fst, int& snd)
{
    int temp = fst;
    fst = snd;
    snd = temp;
    return;
}

