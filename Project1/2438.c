#include <stdio.h>
int main()
{
	int N, i, j;
	char x = '*';
	
	scanf("%d", &N);

	for (i = 1; i <= N; i++)
	{
		for (j = 0; j < i; j++)
		{
			printf("%c", x);
		}
		printf("\n");
	}
}
//���� ��ȣ ��ŭ �� ���� ����ϴ� ���α׷�