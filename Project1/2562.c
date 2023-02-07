#include <stdio.h>
int main()
{
    int array[9];
    int i,j, max;
    

    for (i = 0; i < 9; i++)
    {
        scanf("%d", &array[i]);
    }
    
    max = array[0];
    for (i = 0; i < 9; i++)
    {
        if (max <= array[i])
        {
            max = array[i];
            j = i;
        }
    }
    printf("%d\n%d", max, j+1);

}
// �ִ��� ����� �迭�� �ִ��� ã�� ����