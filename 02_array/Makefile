#usage:
#	make PROJECT=target name
#e.g: for source in hello.s use
#	make PROJECT=hello

AS=arm-none-eabi-as
LD=arm-none-eabi-ld
OBJ_CPY=arm-none-eabi-objcopy

LD_FLAGS=-Ttext=0x0 -o

SOURCES = $(wildcard *.s)
OBJECTS = $(SOURCES:.s=.o)
ELFS = $(SOURCES:.s=.elf)
BINS = $(SOURCES:.s=.bin)

NO_OP=2> /dev/null

all: $(BINS)
	@dd if=/dev/zero of=flash.bin bs=4096 count=4096 $(NO_OP)
	@dd if=$(PROJECT).bin of=flash.bin bs=4096 conv=notrunc $(NO_OP)
	@qemu-system-arm -M connex -pflash flash.bin -nographic -serial /dev/null $(NO_OP)

%.o: %.s
	@$(AS) -o $@ $< $(NO_OP)

%.elf: %.o
	@$(LD) $(LD_FLAGS) $@ $< $(NO_OP)

%.bin: %.elf
	@$(OBJ_CPY) -O binary $< $@ $(NO_OP)

.PHONY: clean

clean:
	@rm -rf *.bin *.o *.elf $(NO_OP)
