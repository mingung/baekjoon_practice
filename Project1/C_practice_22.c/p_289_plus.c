#include <stdio.h>
float PoundtoKG(float Pound);

int main()
{
    float a, result;
    scanf("%f", &a);
    result = PoundtoKG(a);
    printf("%fPound를 KG으로 변환한값은 %f입니다.\n", a, result);
    

}

float PoundtoKG(float Pound)
{
    float KG;
    KG = Pound * 0.453592;
    return(KG);
}

// Pound를 kG으로 변환