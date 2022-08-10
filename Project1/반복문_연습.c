#include <stdio.h>

// while 문

/*int main()
{
	int i = 0;
	int num = 5;

	while (i < num)
	{
		printf("while 문이 %d 번째 반복 수행중입니다.\n", i + 1);
		i++;
	}
	printf("while 문이 종료된 후 변수 i의 값은 %d입니다.\n", i);
}*/
// while 문에서 실행될 명령문이 한 줄 뿐이라면 중괄호({})를 생략할 수 있습니다.

// do while 문

/*int main()
{
	int i = 0;
	int num = 3;

	do {
		printf("do/while 문이 %d번째 반복 수행중입니다.\n", i + 1);
		i++;
	} while (i > num);
	printf("do/while 문이 종료된 후 변수 i의 값은 %d입니다.\n", i);
}*/
// do / while 문 --> 조건식의 결과와 상관없이 무조건 루프 한번 실행


// for 문

/*int main()
{
	int i;
	int num = 7;

	for (i = 0; i < num; i++)
	{
		printf("for 문이 %d 번째 반복 수행중입니다.\n", i + 1);
	}
	printf("for 문이 종료된 후 변수 i의 값은 %d입니다.\n", i);
}*/
// for 문에서 실행될 명령문이 한 줄 뿐이라면 중괄호({})를 생략할 수 있습니다.

// 루프의 제어 //

// continue 문

/*int main()
{
	int i;
	int except_num = 3;

x	for (i = 1; i <= 100; i++)
	{
		if (i % except_num == 0)
		{
			continue;
		}
		printf("%d\n", i);
	}
}*/
// 3의 배수일때 루프의 출력 부분 건너뛰고, 조건식의 판단으로 넘어감

// break 문

/*int main()
{
	int start_num = 1;
	int end_num = 10;
	int sum = 0;

	while (1)
	{
		sum += start_num;
		if (start_num == end_num)
		{
			break;
		}
		start_num++;
	}
	printf("1부터 10까지 더한 값은 %d입니다.\n", sum);
}*/