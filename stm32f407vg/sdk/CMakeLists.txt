cmake_minimum_required(VERSION 3.13)
project(stm32-sdk)
enable_language(C ASM)

include_directories(STM32F4xx_HAL_Driver/Inc CMSIS/Include CMSIS/Device/ST/STM32F4xx/Include ./)
set(SOURCES
  CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c
  CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f437xx.s
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
  STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
)

add_library(stm32-sdk STATIC ${SOURCES})
target_include_directories(stm32-sdk PUBLIC STM32F4xx_HAL_Driver/Inc CMSIS/Include CMSIS/Device/ST/STM32F4xx/Include ./)
