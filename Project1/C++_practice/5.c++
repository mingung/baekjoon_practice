// ��ȣ �ִ� ���� ����ϱ�
/*********************************************************
 * 3ȸ �ŷ� ���� ���� �ܾ��� ���ϴ� ���α׷�
***********************************************************/

#include <iostream>
using namespace std;

int main()
{
    // ���� ����
    int balance = 0;
    int transaction;
    // ù ��° �ŷ� �� �ܾ� ����
    cout << "ù ��° �ŷ� �ݾ� �Է�: ";
    cin >> transaction;
    balance = balance + transaction;

    // �� ��° �ŷ� �� �ܾ� ����
    cout << "�� ��° �ŷ� �ݾ� �Է�: ";
    cin >> transaction;
    balance = balance + transaction ;

    // �� ��° �ŷ� �� �ܾ� ����
    cout << "�� ��° �ŷ� �ݾ� �Է�: ";
    cin >> transaction;
    balance = balance + transaction ;
    
    // ���� �ܾ� ���
    cout << "������ ���� �ܾ��� " << balance << "�޷��Դϴ�.";
    return 0;
}