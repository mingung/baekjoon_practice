#include <stdio.h>
int add(int x, int y) // int x, int y = �Ű�����
{
    int result;

    result = x + y;

    return(result);

// �Լ� ȣ���ؼ� �μ��� ���� �Ű������� ���� �� return ���� ȣ���� ������ ��ȯ�Ѵ�.

}

int main()
{
    int sum;
    sum = add(2, 3); // (2,3) = �μ�
    printf("������� = %d \n", sum);

    sum = add(6, 8);
    printf("������� = %d \n", sum);

    return 0;


}

