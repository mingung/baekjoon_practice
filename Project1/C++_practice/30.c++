// �Ű������� ���ϰ��� �ִ� �Լ�
// ����ڷκ��� �Է¹��� �� ���� ���� �߿� � ���ڰ� �� ū��
// Ȯ���ϴ� �Լ��� �����ϰ� Ȱ���ϴ� ���α׷�

#include <iostream>
using namespace std;

/* larger �Լ��� �� ���� �Ű������� �ް�
   �� �߿� �� ū���� ã�Ƽ� ���� �����ϴ� �Լ�
   ������ �ΰ� �ۿ��� ����
*/

int larger(int fst, int snd)
{
    int max;
    if(fst > snd)
    {
        max = fst;
    }
    else
    {
        max = snd;
    }
    return (max);
}

int main()
{
    // ����
    int first, second;
    // �Է¹ޱ�
    cout << "ù ��° ���ڸ� �Է��ϼ���: ";
    cin >> first;
    cout << "�� ��° ���ڸ� �Է��ϼ���: ";
    cin >> second;
    // �Լ� ȣ��
    cout << "�� �� �߿� ū �� = " << larger(first, second) << endl; // �� ���� larger �Լ��� ���� -> larger �Լ������� �� �� �� ū ���� ����
    return 0; 
}
