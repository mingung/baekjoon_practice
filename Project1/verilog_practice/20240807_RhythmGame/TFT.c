
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "platform.h"
    #include "xil_printf.h"
    #include "xparameters.h"
    #include "xgpio.h"
    #include "xstatus.h"
    #include "Delay.h"
    #include "SPI.h"
    #include "LCD_GUI.h"
    #include "LCD_Driver.h"
    #include "string.h"
    #include "sleep.h"
    #include "xadcps.h"
    #include "xil_types.h"
    #include "xscugic.h"
    #include "xil_exception.h"
    #include "xscutimer.h"
    #include "ssm2518.h"
    #include "PAJ7620U2.h"


    #define DELAY 1000000

    #define DIS_CHANNEL 	1
    #define VER_CHANNEL		2
    #define BTN_CHANNEL 	1
    #define SWI_CHANNEL 	1
    #define TCH_CHANNEL 	1
    #define	BUZ_CHANNEL		1
    #define LED_CHANNEL 	1

    #define DIS_ID		XPAR_AXI_GPIO_0_DEVICE_ID
    #define BTN_ID		XPAR_AXI_GPIO_1_DEVICE_ID
    #define SWI_ID		XPAR_AXI_GPIO_2_DEVICE_ID
    #define TCH_ID		XPAR_AXI_GPIO_3_DEVICE_ID
    #define	BUZ_ID		XPAR_AXI_GPIO_4_DEVICE_ID
    #define	LED_ID		XPAR_AXI_GPIO_5_DEVICE_ID
    #define TFT_ID 		XPAR_AXI_GPIO_6_DEVICE_ID

    #define TIMER_DEVICE_ID		XPAR_XSCUTIMER_0_DEVICE_ID
    #define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
    #define TIMER_IRPT_INTR		XPAR_SCUTIMER_INTR

    #define TOTAL_BLOCK 	99
    #define GOAL 			134
    #define BLOCK_SIZE 		(159 - GOAL)

    #define EASY		20
    #define NORMAL		10
    #define HARD		5
    #define EXTREME		1
    #define	LEGEND		0

    #define OUTPUT  0
    #define	INPUT	1

    #define LineXSTART(X) 	(X*32-31)
    #define LineXEND(X) 	(X*32-1)

    #define MAX_Y(a, b, c) ((*a > *b) ? ((*a > *c) ? a : c) : ((*b > *c) ? b : c))
    #define toBCD(num) ((((num) / 1000) % 10) << 12 | (((num) / 100) % 10) << 8 | (((num) / 10) % 10) << 4 | ((num) % 10))

    extern XSpi  SpiInstance;	 /* The instance of the SPI device */
    extern XGpio gpio0;

    XGpio	GpioDIS,
            GpioBTN,
            GpioSWI,
            GpioTCH,
            GpioBUZ,
            GpioLED;

    unsigned short Gesture_Data;

    XScuTimer 			Timer;
    XScuGic				Intc;
    XScuTimer_Config 	*TMRConfigPtr;
    uint32_t 			Timer_Value;
    uint32_t            timer_flag;

    uint32_t btn;
    uint32_t tch;
    uint32_t swi;
    uint32_t level = 1;

    int n;
    int total;
    int score;
    int speed;

    static void TimerIntrHandler(void *CallBackRef){
        XScuTimer *TimerInstancePtr = (XScuTimer *) CallBackRef;
        XScuTimer_ClearInterruptStatus(TimerInstancePtr);
        timer_flag = 1;
    }

    static int SetupInterruptSystem(XScuGic *GicInstancePtr, XScuTimer *TimerInstancePtr, u16 TimerIntrId) {
        XScuGic_Config *IntcConfig;

        Xil_ExceptionInit();

        IntcConfig = XScuGic_LookupConfig(INTC_DEVICE_ID);
        XScuGic_CfgInitialize(GicInstancePtr, IntcConfig, IntcConfig->CpuBaseAddress);

        Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, GicInstancePtr);
        XScuGic_Connect(GicInstancePtr, TimerIntrId, (Xil_ExceptionHandler)TimerIntrHandler, (void *)TimerInstancePtr);

        XScuGic_Enable(GicInstancePtr, TimerIntrId);
        XScuTimer_EnableInterrupt(TimerInstancePtr);

        Xil_ExceptionEnableMask(XIL_EXCEPTION_IRQ);
        return XST_SUCCESS;
    }

    unsigned char PAJ7620U2_init(){
        int i;
        usleep(500);

        if(SSM2518_ReadReg(0x00) != 0x20) return 0;// Wake up failed
        SSM2518_WriteReg(PAJ_BANK_SELECT, 0);// Select Bank 0

        for (i = 0 ; i < Init_Array ; i++) //Power up initialize
            SSM2518_WriteReg(Init_Register_Array[i][0], Init_Register_Array[i][1]);
        for (i = 0 ; i < Gesture_Array_SIZE; i++) //Gesture register initializes
            SSM2518_WriteReg(Init_Gesture_Array[i][0], Init_Gesture_Array[i][1]);
        return 1;
    }


    static int SetupPeripherals() {
        int Status;

        Status = XGpio_Initialize(&GpioDIS, DIS_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XGpio_Initialize(&GpioBTN, BTN_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XGpio_Initialize(&GpioSWI, SWI_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XGpio_Initialize(&GpioTCH, TCH_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XGpio_Initialize(&GpioBUZ, BUZ_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XGpio_Initialize(&GpioLED, LED_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XGpio_Initialize(&gpio0, TFT_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        Status = XSpi_Init(&SpiInstance, SPI_DEVICE_ID);
        if (Status != XST_SUCCESS) return XST_FAILURE;

        if(!PAJ7620U2_init()) return XST_FAILURE;

        XGpio_SetDataDirection(&GpioDIS, DIS_CHANNEL, OUTPUT);
        XGpio_SetDataDirection(&GpioDIS, VER_CHANNEL, INPUT);
        XGpio_SetDataDirection(&GpioBTN, BTN_CHANNEL, INPUT);
        XGpio_SetDataDirection(&GpioSWI, SWI_CHANNEL, INPUT);
        XGpio_SetDataDirection(&GpioTCH, TCH_CHANNEL, INPUT);
        XGpio_SetDataDirection(&GpioBUZ, BUZ_CHANNEL, OUTPUT);
        XGpio_SetDataDirection(&GpioLED, LED_CHANNEL, OUTPUT);

        LCD_SCAN_DIR LCD_ScanDir = SCAN_DIR_DFT;    //SCAN_DIR_DFT = L2R_U2D
        LCD_Init(LCD_ScanDir);

        TMRConfigPtr = XScuTimer_LookupConfig(TIMER_DEVICE_ID);
        if(TMRConfigPtr == NULL) return XST_FAILURE;

        Status = XScuTimer_CfgInitialize(&Timer, TMRConfigPtr, TMRConfigPtr->BaseAddr);
        if(Status != XST_SUCCESS) return XST_FAILURE;

        Status = SetupInterruptSystem(&Intc, &Timer, TIMER_IRPT_INTR);
        if(Status != XST_SUCCESS) return XST_FAILURE;

        printf("Version : %lx \n",XGpio_DiscreteRead(&GpioDIS, VER_CHANNEL));

        return XST_SUCCESS;
    }

    static void DrawXLine(POINT x_start, POINT x_end, POINT y_end, COLOR color){
        LCD_SetWindows(x_start, y_end-1, x_end, y_end);
        LCD_SetColor(color, x_end-x_start, 1);
    }

    static void DrawYLine(POINT x_end, POINT y_start, POINT y_end, COLOR color){
        LCD_SetWindows(x_end-1, y_start, x_end, y_end);
        LCD_SetColor(color, 1, y_end-y_start);
    }

    static void DrawRectangle(POINT x_start, POINT x_end, POINT y_start, POINT y_end, COLOR color){
        LCD_SetWindows(x_start, y_start, x_end, y_end);
        LCD_SetColor(color, x_end-x_start, y_end-y_start);
    }

    static void SelectDifficulty() {
        swi = XGpio_DiscreteRead(&GpioSWI, SWI_CHANNEL);
        switch(swi){
            case  8: n = EASY;     speed = 1; 	break;
            case  4: n = NORMAL;   speed = 1; 	break;
            case  2: n = HARD;  	  speed = 1; 	break;
            case  1: n = EXTREME;  speed = 1; 	break;
            case 15: n = LEGEND;   speed = 2;	break;
            default: n = 0;	 	  speed = 0; 	break;
        }

        Gesture_Data = SSM2518_ReadReg(PAJ_INT_FLAG1);
        if (Gesture_Data){
            switch (Gesture_Data){
                case PAJ_UP:		if(level > 1) level--; 	break;
                case PAJ_DOWN:		if(level < 7) level++; 	break;
                default: break;
            }
            printf("Level : %ld \n", level);
            Gesture_Data=0;
            usleep(1000000);
        }

    }

    static void ProcessTch(int tch, int *Line_Y1, int *Line_Y2, int *Line_Y3, int *max_Y, int *random_X1, int *random_X2, int *random_X3) {

        max_Y = MAX_Y(Line_Y1, Line_Y2, Line_Y3);

        if (*max_Y > 2 * GOAL - 159) {
            if (*max_Y == *Line_Y1)  	 *random_X1 = 0;
            else if (*max_Y == *Line_Y2) *random_X2 = 0;
            else 						 *random_X3 = 0;

            DrawRectangle(tch * 32 - 31, tch * 32 - 1, *max_Y - speed, *max_Y + (159 - GOAL), BLACK);
            DrawXLine(1, 128, GOAL, WHITE);
            DrawXLine(1, 128, 160, WHITE);

            if (*max_Y >= (GOAL - n) && *max_Y <= (GOAL + n)) {
    //			DrawRectangle(tch * 32 - 31, tch * 32 - 1, GOAL, 159, BLUE);
                score++;
            }
    //		else DrawRectangle(tch * 32 - 31, tch * 32 - 1, GOAL, 159, RED);
            total--;
            *max_Y = 0;
        }
    }

    static void HandleTch(int index1, int index2, int *random_X1, int *random_X2, int *random_X3, int **max_Y, int *Line_Y1, int *Line_Y2, int *Line_Y3) {
        ProcessTch(index1, &Line_Y1[index1-1], &Line_Y2[index1-1], &Line_Y3[index1-1], max_Y[index1-1], random_X1, random_X2, random_X3);
        if(index2)
            ProcessTch(index2, &Line_Y1[index2-1], &Line_Y2[index2-1], &Line_Y3[index2-1], max_Y[index2-1], random_X1, random_X2, random_X3);
    }

    static void GenBlock(int *LineY, int *otherLineY, int *otherLineY2, int *randomX, int *randomY) {
        if (memcmp(LineY, (int[4]){0}, sizeof(int) * 4) == 0) {
            for (int i = 0; i < 4; i++) {
                if (otherLineY[i] > *randomY) {
                    for(int j = 0; j < 4; j++) {
                        if(otherLineY2[j] > *randomY){
                            srand(XScuTimer_GetCounterValue(&Timer));
                            *randomX = (rand() % 4) + 1;

                            srand(XScuTimer_GetCounterValue(&Timer));
                            *randomY = (rand() % 21) + 30;

                            return;
                        }
                    }
                }
            }
        }
    }

    static void DropBlock(int LineNum, int *Line_Y) {
        if (!*Line_Y)		 		DrawRectangle(LineXSTART(LineNum), LineXEND(LineNum), *Line_Y, 						 *Line_Y + BLOCK_SIZE, WHITE);
        else if (*Line_Y <= GOAL) 	DrawRectangle(LineXSTART(LineNum), LineXEND(LineNum), *Line_Y + BLOCK_SIZE - speed , *Line_Y + BLOCK_SIZE, WHITE);

        DrawRectangle(LineXSTART(LineNum), LineXEND(LineNum), *Line_Y - speed, *Line_Y, BLACK);

        if (*Line_Y == GOAL) {
            DrawXLine(1, 128, GOAL, WHITE);
            *Line_Y += speed;
        }
        else if (*Line_Y == 159) {
            *Line_Y = 0;
            total--;
        }
        else if (*Line_Y + speed >= 159) 	 *Line_Y = 159;
        else if (!*Line_Y && (GOAL % speed)) *Line_Y += GOAL % speed;
        else 								 *Line_Y += speed;
    }

    static void StartGame() {
        LCD_SetWindows(0, 0, 128, 160);
        LCD_SetColor(BLACK, 128, 160);

        GUI_DisString_EN(12,30,"Rhythm Game",&Font24,BLACK,WHITE);
        GUI_DisString_EN(43,90,"Made by:",&Font8,BLACK,WHITE);
        GUI_DisString_EN(27,105,"GOLD NECKLACE",&Font8,BLACK,YELLOW);
        GUI_DisString_EN(10,120,"Press BTN to Start",&Font8,BLACK,WHITE);
        while(1){

            btn = XGpio_DiscreteRead(&GpioBTN, BTN_CHANNEL);
            if(btn == 1) break;

            usleep(10000);
        }
    }

    static void SelectMode() {
        char ModeText[20]; // 모드를 출력하기 위한 문자열
        int prevSwi = -1;   // 이전 swi 값을 저장하는 변수
        int prevGestureData = -1; // 이전 Gesture_Data 값을 저장하는 변수

        LCD_SetWindows(0, 0, 128, 160);
        LCD_SetColor(BLACK, 128, 160);

        GUI_DisString_EN(12, 30, "Select Level", &Font24, BLACK, WHITE);
        GUI_DisString_EN(10, 90, "Switch Up to Select", &Font8, BLACK, WHITE);

        // Level 출력
        GUI_DisNum(80, 125, Gesture_Data, &Font12, BLACK, YELLOW);

        while (1) {
            swi = XGpio_DiscreteRead(&GpioSWI, SWI_CHANNEL);
            Gesture_Data = SSM2518_ReadReg(PAJ_INT_FLAG1);

            // swi 값이 변경되었을 때만 화면 업데이트
            if (swi != prevSwi) {
                // 이전 숫자를 지우기 위해 배경색으로 영역 다시 그리기
                DrawRectangle(10, 120, 105, 120, BLACK);

                // swi 값에 따른 레벨 텍스트 설정
                switch (swi) {
                    case 0:
                        sprintf(ModeText, "MODE: CHOOSE");
                        break;
                    case 1:
                        sprintf(ModeText, "MODE: EASY");
                        break;
                    case 2:
                        sprintf(ModeText, "MODE: NORMAL");
                        break;
                    case 4:
                        sprintf(ModeText, "MODE: HARD");
                        break;
                    case 8:
                        sprintf(ModeText, "MODE: EXTREME");
                        break;
                    case 15:
                        sprintf(ModeText, "MODE: LEGEND");
                        break;
                    default:
                        sprintf(ModeText, "MODE: NOTHING");
                        break;
                }
                

                // 설정된 레벨 텍스트를 화면에 표시
                GUI_DisString_EN(10, 105, ModeText, &Font12, BLACK, YELLOW);

                prevSwi = swi; // 이전 swi 값을 갱신
            }

            // Gesture_Data 값이 변경되었을 때만 화면 업데이트
            if (Gesture_Data != prevGestureData) {
                // 이전 숫자를 지우기 위해 배경색으로 영역 다시 그리기
                DrawRectangle(50, 125, 125, 140, BLACK);

                // Ges 값에 따른 레벨 텍스트 설정
                GUI_DisString_EN(10, 125, "Level:", &Font12, BLACK, YELLOW);
                GUI_DisNum(80, 125, Gesture_Data, &Font12, BLACK, YELLOW);
                
                prevGestureData = Gesture_Data; // 이전 Gesture_Data 값을 갱신
            }
        
            SelectDifficulty();

            btn = XGpio_DiscreteRead(&GpioBTN, BTN_CHANNEL);
            if (speed && btn == 1) break;

            usleep(10000);
        }
    }

    static void InitGameBoard() {
        LCD_SetWindows(0, 0, 128, 160);
        LCD_SetColor(BLACK, 128, 160);

        DrawXLine(0, 128, 160, WHITE);
        DrawXLine(0, 128, GOAL, WHITE);

        DrawYLine(1, 0, 160, WHITE);
        DrawYLine(128, 0, 160, WHITE);

        for (int i = 32; i <= 96; i += 32) {
            DrawYLine(i, 0, 160, WHITE);
            DrawYLine(i + 1, 0, 160, WHITE);
        }
    }

    static void PlayGame(){
        XScuTimer_LoadTimer(&Timer, (8-level)*500000+500000);
        XScuTimer_EnableAutoReload(&Timer);

        XScuTimer_Start(&Timer);

        total = TOTAL_BLOCK;
        score = 0;

        XGpio_DiscreteWrite(&GpioDIS, DIS_CHANNEL, toBCD(total * 100 + score));

        for(int i=0; i<3; i++){
            XGpio_DiscreteWrite(&GpioBUZ, BUZ_CHANNEL, 1);
            usleep(DELAY/10);
            XGpio_DiscreteWrite(&GpioBUZ, BUZ_CHANNEL, 0);
            usleep(DELAY-(DELAY/10));
        }

        int Line_Y1[4] = {0}, Line_Y2[4] = {0}, Line_Y3[4] = {0};
        int random_X1 = 0, random_X2 = 0, random_X3 = 0;
        int random_Y = 50;
        int *max_Y[4] = {0};

        while(1){
            XGpio_DiscreteWrite(&GpioDIS, DIS_CHANNEL, toBCD(total * 100 + score));

            btn = XGpio_DiscreteRead(&GpioBTN, BTN_CHANNEL);
            if(btn == 1) {
                LCD_SetWindows(0, 0, 128, 160);
                LCD_SetColor(BLACK, 128, 160);
                DrawRectangle(40, 50, 50, 100, WHITE);
                DrawRectangle(70, 80, 50, 100, WHITE);
                usleep(DELAY);
                while(1){
                    btn = XGpio_DiscreteRead(&GpioBTN, BTN_CHANNEL);
                    if(btn == 1) {
                        InitGameBoard();

                        if(random_X1)DrawRectangle(LineXSTART(random_X1), LineXEND(random_X1), Line_Y1[random_X1-1], Line_Y1[random_X1-1] + BLOCK_SIZE, WHITE);
                        if(random_X2)DrawRectangle(LineXSTART(random_X2), LineXEND(random_X2), Line_Y2[random_X2-1], Line_Y2[random_X2-1] + BLOCK_SIZE, WHITE);
                        if(random_X3)DrawRectangle(LineXSTART(random_X2), LineXEND(random_X2), Line_Y3[random_X3-1], Line_Y3[random_X3-1] + BLOCK_SIZE, WHITE);

                        usleep(DELAY);
                        break;
                    }
                    usleep(10000);
                }
            } else if (btn == 2) break;	

            if(total > 2){
                if(!random_X1 && !random_X2 && !random_X3) random_X1 = 1;
                else if(!random_X2 && !random_X3 && Line_Y1[0] > random_Y) random_X2 = 3;

                GenBlock(Line_Y1, Line_Y2, Line_Y3, &random_X1, &random_Y);
                GenBlock(Line_Y2, Line_Y3, Line_Y1, &random_X2, &random_Y);
                GenBlock(Line_Y3, Line_Y1, Line_Y2, &random_X3, &random_Y);
            } else {
                if(!random_X1 && !random_X2 && !random_X3) break;
            }

            tch = XGpio_DiscreteRead(&GpioTCH, TCH_CHANNEL);
            switch (tch) {
                case 6:  HandleTch(2, 3, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                case 12: HandleTch(1, 2, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                case 3:  HandleTch(3, 4, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                case 8:  HandleTch(1, 0, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                case 4:  HandleTch(2, 0, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                case 2:  HandleTch(3, 0, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                case 1:  HandleTch(4, 0, &random_X1, &random_X2, &random_X3, max_Y, Line_Y1, Line_Y2, Line_Y3); break;
                default: break;
            }

            if(timer_flag){
                timer_flag = 0;
                if(random_X1){
                    DropBlock(random_X1, &Line_Y1[random_X1-1]);
                    if(!Line_Y1[random_X1-1]) random_X1 = 0;
                }
                if(random_X2){
                    DropBlock(random_X2, &Line_Y2[random_X2-1]);
                    if(!Line_Y2[random_X2-1]) random_X2 = 0;
                }
                if(random_X3){
                    DropBlock(random_X3, &Line_Y3[random_X3-1]);
                    if(!Line_Y3[random_X3-1]) random_X3 = 0;
                }
            }
        }

        XScuTimer_Stop(&Timer);
        usleep(DELAY);
    }

    static void EndGame(){
        LCD_SetWindows(0, 0, 128, 160);
        LCD_SetColor(BLACK, 128, 160);

        GUI_DisString_EN(29,30,"GAME OVER",&Font24,BLACK,WHITE);
        GUI_DisString_EN(30,90,"Score:",&Font12,BLACK,WHITE);
        if(score/10)	GUI_DisNum		(83,90,score,&Font12,BLACK,WHITE);
        else if(score)	GUI_DisNum		(89,90,score,&Font12,BLACK,WHITE);
        else			GUI_DisString_EN(89,90,"0",&Font12,BLACK,WHITE);
        GUI_DisString_EN(6,120,"Press BTN to Restart",&Font8,BLACK,WHITE);
        while(1){
            usleep(10000);
            btn = XGpio_DiscreteRead(&GpioBTN, BTN_CHANNEL);
            if(btn == 1) break;
        }
    }

    int main()
    {
        SetupPeripherals();

        while(1){
            StartGame();

            SelectMode();

            InitGameBoard();

            PlayGame();

            EndGame();
        }

        return 0;
    }
