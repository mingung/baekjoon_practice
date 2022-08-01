#include <stdio.h>
int main(void)
{
	int x, y;
	scanf("%d\n%d", &x, &y);

	if (-1000 <= x && 0 > x)
	{
		if (0 > y && -1000 <= y)
		{
			printf("3");
		}
		else if (0 < y && 1000 >= y)
		{
			printf("2");
		}
		else
		{
			printf("사분면을 표시할 수 없습니다.");
		}
	}
	else if (1000 >= x && 0 < x)
	{
		if (0 > y && -1000 <= y)
		{
			printf("4");
		}
		else if (0 < y && 1000 >= y)
		{
			printf("1");
		}
		else
		{
			printf("사분면을 표시할 수 없습니다.");
		}
	}
	else
	{
		printf("사분면을 표시할 수 없습니다.");
	}
	
}
//좌표를 입력받아 원하는 사분면을 표시하는 프로그램
