#include <stdio.h>
int FtoC(int temp_f);

int main()
{
    float c,f;
    f = 32;
    c = FtoC(f);
    printf("ȭ���µ� %f�� �����µ� %f�� �ش��Ѵ�.\n",f, c);
    


}
int FtoC(int temp_f)
{
    float temp_c;
    temp_c = ((float)temp_f - 32) /1.8;
    return(temp_c);
}