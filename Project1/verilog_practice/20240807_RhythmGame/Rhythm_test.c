#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "sleep.h"

#define TOUCH_CHANNEL 1
#define FND_CHANNEL 1

#define TOUCH_ONE 0x1 // 터치 1
#define TOUCH_TWO 0x2 // 터치 2
#define TOUCH_THREE 0x4 // 터치 3
#define TOUCH_FOUR 0x8 // 터치 4


#define MAX_COUNT 999
#define MIN_COUNT -999

XGpio GpioTouch, GpioFnd; // GPIO 인스턴스

void DisplayNumber(int num);
int CalcScore(int LineY, int LineNum);

int main() {
    int Status;
    int count = 0;
    u16 Touch;
    printf("AXI GPIO POlled Mode Example Test v4.0\r\n");
    // GPIO 초기화
    Status = XGpio_Initialize(&GpioTouch, XPAR_AXI_GPIO_0_DEVICE_ID);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    Status = XGpio_Initialize(&GpioFnd, XPAR_AXI_GPIO_1_DEVICE_ID);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    // 방향 설정: 버튼은 입력, FND는 출력
    XGpio_SetDataDirection(&GpioTouch, TOUCH_CHANNEL, 0xF);
    XGpio_SetDataDirection(&GpioFnd, FND_CHANNEL, 0);

    // 초기 FND 디스플레이
    DisplayNumber(count);

    while(1) {
        Touch = XGpio_DiscreteRead(&GpioTouch, TOUCH_CHANNEL);

        // 터치 1 ~ 4 중 하나라도 눌린 경우
        if(Touch & (TOUCH_ONE | TOUCH_TWO | TOUCH_THREE | TOUCH_FOUR)) { // 증가 버튼

        // Debouncing 및 속도 제어
            usleep(100000); 

        // 터치 입력을 다시 읽어들여 모든 터치가 해제된 상태인지 확인
            Touch = XGpio_DiscreteRead(&GpioTouch, TOUCH_CHANNEL);

            if(count < MAX_COUNT && Touch == 0) count ++;
            printf("increase count = %d\n", count);
            DisplayNumber(count);
        }

        usleep(100000); // Debouncing 및 속도 제어
    }

    cleanup_platform();
    return 0;
}

void DisplayNumber(int num) {
    u16 fnd_data = 0;
    int abs_num = num < 0 ? -num : num; // 절대값

    if (num < 0) {
        // 음수를 표현할 때 첫 자리에 마이너스 기호로 0xA를 사용
        fnd_data = 0xA << 12 | ((abs_num / 100) % 10) << 8 | ((abs_num / 10) % 10) << 4 | (abs_num % 10);
    }

    else {
        fnd_data = ((abs_num / 100) % 10) << 8 | ((abs_num / 10) % 10) << 4 | (abs_num % 10);
    }

    // FND 데이터 출력
    XGpio_DiscreteWrite(&GpioFnd, FND_CHANNEL, fnd_data);
}

int CalcScore(int LineY, int LineNum)
{
int score;
score = LineY >= 125 ? 1: 0; // 획득 점수 유예 범위
return score;
}

// [] [] [] []
// 부순 블록, 남은 블록
// 터치 시 return score를 fnd에 전달