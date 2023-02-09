 #include <stdio.h>
 #include <string.h>

 struct student{
    int number;
    char name[10]; //문자 배열에 문자열을 저장할때는 strcpy()를 사용
    double gpa;

 };

 int main(void)
 {
    struct student s; //지역변수 s 초깃값 --> 쓰레기값

    s.number = 20140001;
    strcpy(s.name, "홍길동"); //name = "홍길동" --> 허용x
    s.gpa = 4.3;

    printf("학번: %d\n", s.number);
    printf("이름: %s\n", s.name);
    printf("학번: %lf\n", s.gpa);

    return 0;


 }