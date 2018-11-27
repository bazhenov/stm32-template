CC := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
SDK ?= /Users/bazhenov/Downloads/stm32f1-sdk

C_INCLUDES := -I./ \
	-I$(SDK)/Drivers/STM32F4xx_HAL_Driver/Inc \
	-I$(SDK)/Drivers/CMSIS/Device/ST/STM32F4xx/Include \
	-I$(SDK)/Drivers/CMSIS/Include

C_DEFS := -DUSE_HAL_DRIVER -DSTM32F407xx

LINKER_FLAGS := -specs=nano.specs -lc -lm -lnosys \
	-T STM32F407VGTx_FLASH.ld

CC_FLAGS := -o firmware.elf -Wl,--gc-sections -Og -mthumb -mabi=aapcs -Wall -Wextra -fno-common -static -ffunction-sections -fdata-sections

CPU := -mcpu=cortex-m4

C_SOURCES = main.c \
stm32f4xx_it.c \
$(SDK)/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c \
$(SDK)/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f407xx.s \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c \
$(SDK)/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c

compile:
	@echo "Making firmware..."
	$(CC) $(LINKER_FLAGS) $(C_DEFS) $(CC_FLAGS) $(CPU) $(C_INCLUDES) $(C_SOURCES)
	arm-none-eabi-objcopy -O ihex firmware.elf firmware.hex

flash: compile
	st-flash --format ihex write ./firmware.hex

all: flash
