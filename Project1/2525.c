#include <stdio.h>
int main()
{
	int A, B, C, D, E;
	scanf("%d %d\n%d", &A, &B, &C);
	D = (B + C) / 60; //�� �ð��� �ð�����
	E = (B + C) % 60; //�� �ð��� ������

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
// ����ð� ���� �ð��� �����ð��� ����Ͽ� ������ �ð��� ����ϴ� ���α׷�