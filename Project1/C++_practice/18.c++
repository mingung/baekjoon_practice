// �� ������ �Է¹��� �ð��� ��, ��, �� ������ �����
// ����ϴ� ���α׷�

#include <iostream>
using namespace std;

int main()
{
    // ���� ����
    unsigned long duration, hours, minutes, seconds;
    // �Է� �ޱ�
    cout << "�� ���� �ð��� ���� ������ �Է�: ";
    cin >> duration;
    // ó��
    hours = duration / 3600L;
    minutes = (duration - (hours * 3600L)) / 60L;
    seconds = duration - (hours * 3600L) - (minutes * 60);
    // ���
    cout << "�Էµ� �� ���� �ð�: " << duration << endl;
    cout << "���: ";
    cout << hours << "�� ";
    cout << minutes << "�� ";
    cout << seconds << "��";
    return 0;

}