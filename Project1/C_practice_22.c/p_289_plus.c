#include <stdio.h>
float PoundtoKG(float Pound);

int main()
{
    float a, result;
    scanf("%f", &a);
    result = PoundtoKG(a);
    printf("%fPound�� KG���� ��ȯ�Ѱ��� %f�Դϴ�.\n", a, result);
    

}

float PoundtoKG(float Pound)
{
    float KG;
    KG = Pound * 0.453592;
    return(KG);
}

// Pound�� kG���� ��ȯ