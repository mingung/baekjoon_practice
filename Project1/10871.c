#include <stdio.h>
int main()
{
	int N, X, A, i;
	scanf("%d %d", &N, &X);

	for (i = 0; i < N; i++)
	{
		scanf("%d", &A);

		if (A < X)
		{
			printf("%d ", A);
		}
		else
		{
		
		}
	}
}
//for 반복에서 scanf 사용시 처음에 반복 횟수 만큼 입력해도 잘 구동된다.