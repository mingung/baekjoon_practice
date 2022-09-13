#include <stdio.h>
int FtoC(int temp_f);

int main()
{
    float c,f;
    f = 32;
    c = FtoC(f);
    printf("È­¾¾¿Âµµ %fÀº ¼·¾¾¿Âµµ %f¿¡ ÇØ´çÇÑ´Ù.\n",f, c);
    


}
int FtoC(int temp_f)
{
    float temp_c;
    temp_c = ((float)temp_f - 32) /1.8;
    return(temp_c);
}