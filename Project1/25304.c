#include <stdio.h>
int main()
{
	int X, N, a, b;
	int i;
	int sum = 0;
	scanf("%d", &X); // 영수증에 적힌 총 금액
	scanf("%d", &N); // 영수증에 적힌 구매한 물건의 종류의 수
	
	for (i = 0; i < N; i++)
	{
		scanf("%d %d", &a, &b); // 각 물건의 가격, 개수
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
// 영수증에 적힌 금액과 산 총액을 비교하여 계산의 합당 여부를 판단하는 프로그램