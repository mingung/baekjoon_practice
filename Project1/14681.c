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
			printf("��и��� ǥ���� �� �����ϴ�.");
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
			printf("��и��� ǥ���� �� �����ϴ�.");
		}
	}
	else
	{
		printf("��и��� ǥ���� �� �����ϴ�.");
	}
	
}
//��ǥ�� �Է¹޾� ���ϴ� ��и��� ǥ���ϴ� ���α׷�
