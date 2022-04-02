all: mod
	rm rs rs.o
	chmod +x a.out

mod: zero
	dd if=rs of=a.out bs=1 count=7 seek=7 skip=4096 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=14 conv=notrunc
	dd if=rs of=a.out bs=1 count=1 seek=15 skip=4456 conv=notrunc
	dd if=rs of=a.out bs=1 count=1 seek=16 skip=4440 conv=notrunc
	dd if=rs.o of=a.out bs=1 count=1 seek=24 skip=60 conv=notrunc
	dd if=rs of=a.out bs=1 count=1 seek=32 skip=4432 conv=notrunc
	dd if=rs of=a.out bs=1 count=6 seek=40 skip=4103 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=46 conv=notrunc
	dd if=rs of=a.out bs=1 count=1 seek=47 skip=4456 conv=notrunc
	dd if=rs of=a.out bs=1 count=1 seek=48 skip=64 conv=notrunc
	dd if=rs of=a.out bs=1 count=1 seek=52 skip=68 conv=notrunc
	dd if=rs of=a.out bs=1 count=12 seek=72 skip=4109 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=84 conv=notrunc
	dd if=rs.s of=a.out bs=1 count=1 seek=85 conv=notrunc
	dd if=rs of=a.out bs=1 count=4 seek=88 skip=4117 conv=notrunc
	dd if=data of=a.out bs=1 count=1 seek=92 conv=notrunc
	dd if=rs.s of=a.out bs=1 count=1 seek=93 conv=notrunc
	dd if=rs of=a.out bs=1 count=8 seek=96 skip=4121 conv=notrunc

zero: cp
	dd if=/dev/zero of=a.out bs=1 count=8 seek=24 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=8 seek=40 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=2 seek=52 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=6 seek=58 conv=notrunc
	dd if=/dev/zero of=a.out bs=1 count=34 seek=68 conv=notrunc

cp: rs
	dd if=rs of=a.out bs=1 count=104
	dd if=rs of=a.out bs=1 count=46 seek=104 skip=4129

rs: rs.o
	ld -T test.ld -o rs rs.o

rs.o: rs.s
	as -o rs.o rs.s

.PHONY:
clean:
	rm a.out
