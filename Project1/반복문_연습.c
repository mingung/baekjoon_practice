#include <stdio.h>

// while ��

/*int main()
{
	int i = 0;
	int num = 5;

	while (i < num)
	{
		printf("while ���� %d ��° �ݺ� �������Դϴ�.\n", i + 1);
		i++;
	}
	printf("while ���� ����� �� ���� i�� ���� %d�Դϴ�.\n", i);
}*/
// while ������ ����� ��ɹ��� �� �� ���̶�� �߰�ȣ({})�� ������ �� �ֽ��ϴ�.

// do while ��

/*int main()
{
	int i = 0;
	int num = 3;

	do {
		printf("do/while ���� %d��° �ݺ� �������Դϴ�.\n", i + 1);
		i++;
	} while (i > num);
	printf("do/while ���� ����� �� ���� i�� ���� %d�Դϴ�.\n", i);
}*/
// do / while �� --> ���ǽ��� ����� ������� ������ ���� �ѹ� ����


// for ��

/*int main()
{
	int i;
	int num = 7;

	for (i = 0; i < num; i++)
	{
		printf("for ���� %d ��° �ݺ� �������Դϴ�.\n", i + 1);
	}
	printf("for ���� ����� �� ���� i�� ���� %d�Դϴ�.\n", i);
}*/
// for ������ ����� ��ɹ��� �� �� ���̶�� �߰�ȣ({})�� ������ �� �ֽ��ϴ�.

// ������ ���� //

// continue ��

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
// 3�� ����϶� ������ ��� �κ� �ǳʶٰ�, ���ǽ��� �Ǵ����� �Ѿ

// break ��

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
	printf("1���� 10���� ���� ���� %d�Դϴ�.\n", sum);
}*/