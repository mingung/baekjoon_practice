#include <stdio.h>
int main()
{
	int A, B, C;
	scanf("%d %d %d", &A, &B, &C);

	if (A == B && B == C)
	{
		printf("%d", 10000 + A * 1000);
	}
	else if (A == B && B != C)
	{
		printf("%d", 1000 + A * 100);
	}
	else if (B == C && C != A)
	{
		printf("%d", 1000 + B * 100);
	}
	else if (C == A && A != B)
	{
		printf("%d", 1000 + C * 100);
	}
	else if (A != B && B != C && C != A)
	{
		if (A > B && A > C)
		{
			printf("%d", A * 100);
		}
		else if (B > A && B > C)
		{
			printf("%d", B * 100);
		}
		else if (C > A && C > B)
		{
			printf("%d", C * 100);
		}

	}

}
// 주사위 던져서 값 계산하는 프로그램