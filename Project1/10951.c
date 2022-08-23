#include <stdio.h>
int main()
{
	int A, B;

	while (scanf("%d %d", &A, &B) != EOF)
	{
		printf("%d\n", A + B);
	}

}
/* EOF(end of file): 파일 끝에 도달했을 때 특별한 값 반환(-1)
 최대 몇개의 입력이 들어오는지 모를때 사용..*/

