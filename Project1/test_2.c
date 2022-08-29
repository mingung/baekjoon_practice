// 타입 배열이름[배열길이];
// int array[3];
//배열은 꼭 선언 후 초기화 과정을 거쳐야함

// 배열의 선언과 동시에 초기화
// 타입 배열이름[배열길이] = {배열요소1, 배열요소2, ...};
// 초기화 리스트의 타입 == 배열의 타입
// 타입 배열이름[] = {배열요소1, 배열요소2,...};
// 배열의 길이를 따로 입력x -> 초기화 리스트의 배열 요소의 갯수에 맞춰 자동으로 길이 설정

#include <stdio.h>
int main()
{
    // int i;
    // int sum = 0;
    // int grade[3]; // 길이가 3인 int형 배열 선언

    // /* 배열의 초기화*/
    // grade[0] = 85; // 국어 점수
    // grade[1] = 65; // 영어 점수
    // grade[2] = 90; // 수학 점수

    // for (i = 0; i < 3; i++)
    // {
    //     sum += grade[i]; // 인덱스를 이용한 배열의 접근
    // }
    // printf("국영수 과목 총 점수 합계는 %d점이고, 평균점수는 %f점입니다.\n", sum, (double)sum/3);

    // int arr[] = {1, 2, 3}; 초기화 리스트 갯수에 맞춰 배열 길이 초기화
    int i;
    int sum = 0;
    int grade[3] = { 85, 65, 90 }; //grade[0]. grade[1], grade[2]민 선언 및 초기화
    //grade[3]를 선언하지 않고 초기화 진행

    for (i = 0; i < 4; i++)
    {
        sum += grade[i];
    }
    printf("국영수 과목 총 점수 합계는 %d이고, 평균 점수는 %f입니다.\n", sum, (double)sum / 3);
}

