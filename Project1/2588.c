#include <stdio.h>
int main(void)
{
	int A, B;

	scanf("%d\n %d", &A, &B);
	printf("%d\n", A * (B % 10)); // 1���ڸ�
	printf("%d\n", A * ((B % 100) - (B % 10))/10); // 10�� �ڸ�
	printf("%d\n", A * (B / 100)); //100�� �ڸ�
	printf("%d\n", A * (B % 10)+ A * ((B % 100) - (B % 10)) + A * (B / 100) * 100);
}


