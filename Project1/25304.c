#include <stdio.h>
int main()
{
	int X, N, a, b;
	int i;
	int sum = 0;
	scanf("%d", &X); // �������� ���� �� �ݾ�
	scanf("%d", &N); // �������� ���� ������ ������ ������ ��
	
	for (i = 0; i < N; i++)
	{
		scanf("%d %d", &a, &b); // �� ������ ����, ����
		sum = sum + a * b;
	}
	if (X == sum)
	{
		printf("Yes");
	}
	else
	{
		printf("No");
	}
}
// �������� ���� �ݾװ� �� �Ѿ��� ���Ͽ� ����� �մ� ���θ� �Ǵ��ϴ� ���α׷�