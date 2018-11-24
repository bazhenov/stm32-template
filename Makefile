CC := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
SDK ?= /Users/bazhenov/Downloads/stm32f1-sdk

C_INCLUDES := -I./ \
	-I$(SDK)/Drivers/STM32F1xx_HAL_Driver/Inc \
	-I$(SDK)/Drivers/CMSIS/Device/ST/STM32F1xx/Include \
	-I$(SDK)/Drivers/CMSIS/Include

C_DEFS := -DUSE_HAL_DRIVER \
	-DSTM32F103x6

LINKER_FLAGS := -specs=nano.specs -lc -lm -lnosys\
	-T $(SDK)/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/gcc/linker/STM32F103X6_FLASH.ld

CC_FLAGS := -o firmware.elf -Wl,--gc-sections -O0 -mthumb -mabi=aapcs -Wall -Wextra -fno-common -static -ffunction-sections -fdata-sections

CPU := -mcpu=cortex-m3

C_SOURCES = main.c \
$(SDK)/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_i2c.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c \
$(SDK)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c \
$(SDK)/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/gcc/startup_stm32f103x6.s

compile:
	@echo "Making firmware..."
	$(CC) $(LINKER_FLAGS) $(C_DEFS) $(CC_FLAGS) $(CPU) $(C_INCLUDES) $(C_SOURCES)
	arm-none-eabi-objcopy -O ihex firmware.elf firmware.hex

flash: compile
	st-flash --format ihex write ./firmware.hex

all: flash
