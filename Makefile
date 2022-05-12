all: mod
	rm rs rs.o
	chmod +x a.out

mod: zero
	dd if=rs of=a.out bs=1 count=7 seek=7 skip=4096 conv=notrunc
	dd if=data of=a.out bs=1 count=3 seek=14 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=24 skip=5 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=32 skip=6 conv=notrunc
	dd if=rs of=a.out bs=1 count=6 seek=40 skip=4103 conv=notrunc
	dd if=data of=a.out bs=1 count=2 seek=46 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=54 skip=3 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=56 skip=4 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=64 skip=4 conv=notrunc
	dd if=rs of=a.out bs=1 count=11 seek=72 skip=4109 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=83 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=84 skip=7 conv=notrunc
	dd if=rs of=a.out bs=1 count=3 seek=88 skip=4117 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=91 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=92 skip=7 conv=notrunc

zero: cp
	dd if=/dev/zero of=a.out bs=1 count=8 seek=24 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=40 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=42 seek=54 conv=notrunc

cp: rs
	dd if=rs of=a.out bs=1 count=48
	dd if=rs of=a.out bs=1 count=48 seek=48 skip=120
	dd if=rs of=a.out bs=1 count=39 seek=96 skip=4120

rs: rs.o
	ld -o rs rs.o

rs.o: rs.s
	as -o rs.o rs.s

.PHONY:
clean:
	rm a.out
