// ���� ���ڸ� ����� ���� ����

#include <iostream>
#include <cstdlib> // rand�Լ� ���� �ʿ��� �������
#include <ctime>
using namespace std;

int main()
{
    // ����� �ʱ�ȭ
    int low = 5;
    int high = 15;
    int trylimit = 5;
    int guess;
    // ���� ���� ����
    srand(time(0));
    int temp = rand();
    int num = temp % (high - low + 1) + low;
    // ������ ���� �ݺ�
    int counter = 1;
    bool found = false;
    while(counter <= trylimit && !found)
    {
        do
        {
            cout << "5~15 ������ ������ �Է��ϼ���: ";
            cin >> guess;
        } while(guess < 5 || guess > 15);

        if(guess == num)
        {
            found = true;
        }
        else if(guess > num)
        {
            cout << "�� ���� �����Դϴ�." <<  endl;
        }
        else
        {
            cout << "�� ū �����Դϴ�." << endl;
        }
        counter++;
    }
    // ������ ������ ���
    if(found)
    {
        cout << "������ �����߽��ϴ�. ";
        cout << "�� = " << num;
    }
    // ������ ������ ���
    else
    {
        cout << "�ƽ��� ������ �����߽��ϴ�. ";
        cout << "�� = " << num;
    }
    return 0; 
}

