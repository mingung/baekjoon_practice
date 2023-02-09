#include <stdio.h>
int main()
{
    int i = 10;
    float f = 12.3;
    char c = 69;
    // c�� �ƽ�Ű�ڵ� E
    printf("i�� �ּ�%d\n", &i);
    printf("f�� �ּ�%d\n", &f);
    printf("c�� �ּ�%d\n", &c);

}
// �� ������ �ּ� ����
// �����ʹ� ������ �ּҸ� ������ �ִ� ����
// ���� i�� �ּ� 6422300������ ����ȴ�.