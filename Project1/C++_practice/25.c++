// time(0) �Լ��� ����ؼ� ���� �ð��� ã�� ���α׷�

#include <iostream>
#include <ctime>
using namespace std;

int main()
{
    // ����� �� ���� �ð��� ���� �� ã��
    long elapsedSeconds = time(0);
    int currntSecond = elapsedSeconds % 60;
    // ����� �� ���� �ð��� ���� �� ã��
    long elpasedMinutes = elapsedSeconds / 60;
    int currentMinute = elpasedMinutes % 60;
    // ����� �ð��� �� ���� �ð� ã��
    long elapsedHours = elpasedMinutes / 60;
    int currentHour = elapsedHours % 24;
    // ���� �ð��� ���
    cout << "����ð� = ";
    cout << currentHour << " : " << currentMinute << " : " << currntSecond;
    return 0;
}