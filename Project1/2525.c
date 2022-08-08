#include <stdio.h>
int main()
{
	int A, B, C, D, E;
	scanf("%d %d\n%d", &A, &B, &C);
	D = (B + C) / 60; //총 시간을 시간으로
	E = (B + C) % 60; //총 시간을 분으로

	if (A + D < 24)
	{
		printf("%d %d", A + D, E);
	}
	else if (A + D == 24)
	{
		printf("0 %d", E);
	}
	else if (A + D > 24)
	{
		printf("%d %d", (A + D) % 24, E);
	}
	return 0;
}
// 오븐시계 시작 시간과 조리시간을 계산하여 끝나는 시간을 출력하는 프로그램