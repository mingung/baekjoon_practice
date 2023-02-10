// 구조체 선언 및 초기화
struct point{
    int x;
    int y;
};
struct point p1 = {10, 20}; // 구조체 초깃값은 중괄호 안에 멤버의 순서대로 나열한다.

// student에 초깃값을 저장하는 문장
struct point{
    int number;
    char name[10];
    double gpa;

};
struct point s = {24,"kim",4.3}; // 구조체를 선언 및 동시에 초기화 할때 문자열을 저장할때는 strcpy()를 사용 xxx (배열에 바로 문자열이 저장)