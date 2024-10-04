
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "sleep.h"
#define KEY_CHANNEL 1
#define LED_CHANNEL 1
#define printf	xil_printf

int main()
{
	int Status;
	XGpio GpioLed, GpioKey;	/* The driver instance for GPIO Device. */

	u32 led = 1, btn = 0;
	printf("AXI GPIO POlled Mode Example Test v4.0\r\n");

	Status = XGpio_Initialize(&GpioKey, XPAR_AXI_GPIO_0_DEVICE_ID);
	if (Status != XST_SUCCESS) return XST_FAILURE;

	Status = XGpio_Initialize(&GpioLed, XPAR_AXI_GPIO_1_DEVICE_ID);
	if (Status != XST_SUCCESS) return XST_FAILURE;


	// Set the direction
	XGpio_SetDataDirection(&GpioKey, KEY_CHANNEL, 0x3);
	XGpio_SetDataDirection(&GpioLed, LED_CHANNEL, 0);


	// Turn on the LED
	XGpio_DiscreteWrite(&GpioLed, LED_CHANNEL, led);

	while(1){
		btn = XGpio_DiscreteRead(&GpioKey, KEY_CHANNEL);
		if(btn){
			printf("InputData : %d \r\n", btn);
			if(btn == 1)	led = ((led << 1) + (led >> 3)) & 0xf;
			else					led = ((led >> 1) + (led << 3)) & 0xf;
			XGpio_DiscreteWrite(&GpioLed, LED_CHANNEL, led);

			usleep(100000);
		}
	}
    cleanup_platform();
    return 0;
}
