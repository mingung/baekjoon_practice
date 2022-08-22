#include <stdio.h>
int main()
{
	int A, B;
	int i = 0;

	while (1)
	{
		scanf("%d %d", &A, &B);
	
		if (A == 0 && B == 0)
		{
			break;
		}
		i++;
		printf("%d\n", A + B);

	}
}