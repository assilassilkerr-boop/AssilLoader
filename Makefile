# Makefile for AssilLoader

# Project variables
PROJECT_NAME = AssilLoader
BOOTOS_DIR = bootos
BUILD_DIR = build
SRC_DIR = src
KERNEL_BIN = $(BUILD_DIR)/kernel.bin
OS_IMAGE = assiloader-image.bin

# Default target
all: $(OS_IMAGE)

# 1. Build the bootloader
$(BOOTOS_DIR)/build/bootos:
    $(MAKE) -C $(BOOTOS_DIR) build

# 2. Compile your kernel C code
$(BUILD_DIR)/kernel.o: $(SRC_DIR)/kernel.c | $(BUILD_DIR)
    gcc -ffreestanding -m32 -c $< -o $@

# 3. Link the kernel to a raw binary at address 0x1000
$(KERNEL_BIN): $(BUILD_DIR)/kernel.o
    ld -m elf_i386 -Ttext 0x1000 --oformat binary $< -o $@

# 4. Create the final floppy disk image
$(OS_IMAGE): $(BOOTOS_DIR)/build/bootos $(KERNEL_BIN)
    cat $^ /dev/zero | dd of=$@ bs=512 count=2880

# Create build directory
$(BUILD_DIR):
    mkdir -p $(BUILD_DIR)

# Clean up
clean:
    rm -rf $(BUILD_DIR)
    $(MAKE) -C $(BOOTOS_DIR) clean

# Run in QEMU
emu: $(OS_IMAGE)
    qemu-system-x86_64 -drive format=raw,file=$<

# Create a README with project info
init-readme:
    echo "# AssilLoader" > README.md
    echo "" >> README.md
    echo "A simple operating system loader based on antoninhrlt/bootos." >> README.md
    echo "" >> README.md
    echo "## Build" >> README.md
    echo "make all" >> README.md
    echo "" >> README.md
    echo "## Run" >> README.md
    echo "make emu" >> README.md

.PHONY: all clean emu init-readme