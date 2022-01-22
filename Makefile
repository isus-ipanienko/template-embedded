.PHONY: all build cmake flash clean

BUILD_DIR := build
BUILD_TYPE ?= Debug

all: build

${BUILD_DIR}/Makefile:
	cmake

cmake: ${BUILD_DIR}/Makefile

build: cmake
	$(MAKE) -C ${BUILD_DIR} --no-print-directory

flash: all
	openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c "program ${BUILD_DIR}/binary.elf verify reset exit" // TODO add binary name
	
clean:
	