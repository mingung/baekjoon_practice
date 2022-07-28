#include <stdio.h>
int main(void)
{
	int A, B;

	scanf("%d\n %d", &A, &B);
	printf("%d\n", A * (B % 10)); // 1의자리
	printf("%d\n", A * ((B % 100) - (B % 10))/10); // 10의 자리
	printf("%d\n", A * (B / 100)); //100의 자리
	printf("%d\n", A * (B % 10)+ A * ((B % 100) - (B % 10)) + A * (B / 100) * 100);
}


