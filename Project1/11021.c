#include <stdio.h>
int main()
{
	int T, A, B, i;
	scanf("%d", &T);

	for (i = 0; i < T; i++)
	{
		scanf("%d %d", &A, &B);
		printf("Case #%d: %d\n", i + 1, A + B);
	}
}
// 케이스의 갯수를 선언 후 각 케이스 마다의 합을 출력하는 프로그램