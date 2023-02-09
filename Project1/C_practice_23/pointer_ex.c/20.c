 #include <stdio.h>
 int get_min(int, int); //함수원형정의가 반드시 핑요

 int main()
 {
    int n1, n2, result;
    int (*pf) (int, int); //함수 포인터 선언

    printf("첫 번쨰 값:");
    scanf("%d", &n1);
    printf("두 번쨰 값:");
    scanf("%d", &n2);

    pf = get_min; //함수 포인터에 get_min() 함수의 주소를 대입한다. ex *p = &i;
    result = pf(n1, n2); //함수 포인터를 통해 함수 호출 (*pf) (n1, n2) 가 원칙이지만 * 생략 가능

    printf("더 작은 값은 %d 입니다.\n", result);
    return 0;
 }
 int get_min(int a, int b)
 {
    if (a < b)
    {
        return a;
    
    }
    else
    {
        return b;
    }
 }