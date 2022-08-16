#include <stdio.h>
int main()
{
	int T, A, B;
	int i = 0;
	scanf("%d", &T);

	while (i < T)
	{
		scanf("%d %d", &A, &B);
		printf("Case #%d: %d + %d = %d\n", i + 1, A, B, A + B);
		i++;
	}
}
// 11021에서 출력 값만 추가
