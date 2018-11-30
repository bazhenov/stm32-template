cmake_minimum_required(VERSION 3.13)
project(blinky)

add_subdirectory(sdk)
include_directories(./)
set(SOURCES main.c stm32f4xx_it.c)

add_executable(blinky ${SOURCES})
target_link_libraries(blinky PUBLIC stm32-sdk)
target_link_options(blinky PUBLIC -specs=nano.specs -lc -lm -lnosys -T STM32F407VGTx_FLASH.ld -Wl,--gc-sections -fno-common -static -ffunction-sections -fdata-sections)

target_compile_definitions(stm32-sdk PUBLIC STM32F407xx USE_HAL_DRIVER)
target_compile_options(stm32-sdk PUBLIC -mcpu=cortex-m4 -mthumb -mabi=aapcs -Og -g)
