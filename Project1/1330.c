#include <stdio.h>
int main(void)
{
	int A, B;
	scanf("%d %d", &A, &B);

	if (A < B)
	{
		printf("<");
	}
	else
	{
		if (A == B)
		{
			printf("==");
		}
		else
		{
			printf(">");
		}
	}
}
// 정수 A와 B를 입력받아 두 수를 비교하는 프로그램