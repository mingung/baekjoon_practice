#include <stdio.h>

int add(int x, int y)
{
    int result;

    result = x + y;
    return(result); //result °ªÀÌ ¹ÝÈ¯µÈ´Ù.
}

int main(void)
{
    int sum;

    sum = add(2, 3);
    printf("µ¡¼À °á°ú = %d \n", sum);

    sum = add(6, 8);
    printf("µ¡¼À °á°ú = %d \n", sum);

    return 0;


}