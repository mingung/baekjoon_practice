#include <stdio.h>
int main(void)
{
	int A, B, C, D, E;
	scanf("%d\n %d", &A, &B);
	C = B % 10;
	D = ((B % 100) - (B % 10))/10;
	E = B / 100;
	printf("%d\n", A * C); // 1���ڸ�
	printf("%d\n", A * D); // 10�� �ڸ�
	printf("%d\n", A * E); //100�� �ڸ�
	printf("%d\n", A * B);

}
// �ᱣ���� ��� �ϵ� �߰� ����Ʈ ���� ��Ȯ�ϰ� ��Ÿ���� ���� /10, /100�� ���ش�.

//�����غ��� ����������� �׳� A * B �ϸ� �ȴ�. 

