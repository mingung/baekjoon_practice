//구구단 출력 프로그램
#include <stdio.h>
int main()
{
	int N;
	int i;
	scanf("%d", &N);

	for (i = 0; i < 9; i++)
	{
		printf("%d * %d = %d\n", N, i + 1, N * (i + 1));
	}
} 