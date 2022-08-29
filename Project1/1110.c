#include <stdio.h>
int main()
{
	int N, a, b;
	int i = 0;
	int result_clear;
	scanf("%d", &N);
	a = N/10;
	b = N%10;
	result_clear = N;
	while(1)
	{
		a = result_clear/10;
		b = result_clear%10;
		result_clear = b*10 + (a+b)%10;
		// 68
		// 84
		// 42
		// 26
		i++;
		if (result_clear == N)
		{
			printf("%d", i);
			break;

		}

	}
}