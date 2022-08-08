#include <stdio.h>
int main()
{
	int H, M;

	scanf("%d %d", &H, &M);
	if (H == 0)
	{
		if (45 <= M && 59 >= M)
		{
			printf("%d %d", H, M - 45);
		}
		else if (45 > M && 0 <= M)
		{
			printf("23 %d", M + 15);
		}
	}
	else if (45 <= M && 59 >= M)
	{
		printf("%d %d", H, M - 45);
	}
	else if (45 > M && 0 <= M)
	{
		printf("%d %d", H - 1, M + 15);
	}

	return 0;
}
//알람 맞추면 어차피 더 자니까 맞춘 시각보다 45분 일찍 울리게 해놓는 프로그램