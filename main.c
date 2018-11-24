#include "stm32f1xx_hal.h"
#include "stm32f1xx_hal_gpio.h"

int main(void) {
	SystemInit();
	HAL_Init();

	__HAL_RCC_GPIOC_CLK_ENABLE();

  GPIO_InitTypeDef ledPin;
  ledPin.Pin = GPIO_PIN_13;
  ledPin.Speed = GPIO_SPEED_FREQ_HIGH;
  ledPin.Mode = GPIO_MODE_OUTPUT_PP;

  HAL_GPIO_Init(GPIOC, &ledPin);

  while (1) {
      HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_RESET);
			HAL_Delay(500);

      HAL_GPIO_WritePin(GPIOC, GPIO_PIN_13, GPIO_PIN_SET);
      HAL_Delay(500);
  }
    while(1);
}
