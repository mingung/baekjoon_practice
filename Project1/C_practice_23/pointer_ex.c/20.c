 #include <stdio.h>
 int get_min(int, int); //�Լ��������ǰ� �ݵ�� �ο�

 int main()
 {
    int n1, n2, result;
    int (*pf) (int, int); //�Լ� ������ ����

    printf("ù ���� ��:");
    scanf("%d", &n1);
    printf("�� ���� ��:");
    scanf("%d", &n2);

    pf = get_min; //�Լ� �����Ϳ� get_min() �Լ��� �ּҸ� �����Ѵ�. ex *p = &i;
    result = pf(n1, n2); //�Լ� �����͸� ���� �Լ� ȣ�� (*pf) (n1, n2) �� ��Ģ������ * ���� ����

    printf("�� ���� ���� %d �Դϴ�.\n", result);
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