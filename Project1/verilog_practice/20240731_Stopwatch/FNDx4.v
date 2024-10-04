#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "sleep.h"

#define KEY_CHANNEL 1
#define FND_CHANNEL 1
#define printf  xil_printf

int main()
{
    int Status;
    XGpio GpioFnd, GpioKey; /* The driver instance for GPIO Device. */

    u16 fnd_data = 0;  // �ʱ� FND ������ (16������ �ʱ�ȭ ����)
    u32 btn = 0;

    printf("AXI GPIO Polled Mode Example for FND Control\r\n");

    Status = XGpio_Initialize(&GpioKey, XPAR_AXI_GPIO_0_DEVICE_ID);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    Status = XGpio_Initialize(&GpioFnd, XPAR_AXI_GPIO_1_DEVICE_ID);
    if (Status != XST_SUCCESS) return XST_FAILURE;

    // Set the direction
    XGpio_SetDataDirection(&GpioKey, KEY_CHANNEL, 0x3); // ��ư�� �Է�
    XGpio_SetDataDirection(&GpioFnd, FND_CHANNEL, 0);   // FND�� ���

    // �ʱ� FND ������ ���
    XGpio_DiscreteWrite(&GpioFnd, FND_CHANNEL, fnd_data);

    while(1){
        btn = XGpio_DiscreteRead(&GpioKey, KEY_CHANNEL);
        if(btn){
            printf("Input Data: %d\r\n", btn);
            
            // ��ư �Է¿� ���� FND ������ ����
            if(btn == 1) {
                fnd_data = (fnd_data << 1) & 0xFFFF; // ������ ����Ʈ (����)
            } else {
                fnd_data = (fnd_data >> 1) & 0xFFFF; // ������ ����Ʈ (������)
            }

            // FND�� ���ο� ������ ���
            XGpio_DiscreteWrite(&GpioFnd, FND_CHANNEL, fnd_data);

            usleep(100000);
        }
    }

    cleanup_platform();
    return 0;
}