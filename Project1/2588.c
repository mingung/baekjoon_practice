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
// 결괏값은 출력 하되 중간 프린트 값을 정확하게 나타내기 위한 /10, /100을 해준다.

