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
//열의 번호 만큼 별 갯수 출력하는 프로그램