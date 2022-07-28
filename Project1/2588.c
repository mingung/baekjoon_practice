#include <stdio.h>
int main(void)
{
	int A, B, C, D, E;
	scanf("%d\n %d", &A, &B);
	C = B % 10;
	D = ((B % 100) - (B % 10))/10;
	E = B / 100;
	printf("%d\n", A * C); // 1의자리
	printf("%d\n", A * D); // 10의 자리
	printf("%d\n", A * E); //100의 자리
	printf("%d\n", A * B);

}
// 결괏값은 출력 하되 중간 프린트 값을 정확하게 나타내기 위한 /10, /100을 해준다.

//생각해보니 마지막결과는 그냥 A * B 하면 된다. 

