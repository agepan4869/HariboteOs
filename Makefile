default :
	make img

#---------------
#	hankaku char
#---------------
convHankakuTxt : convHankakuTxt.c
	$(CC) $< -o $@
hankaku.c : hankaku.txt convHankakuTxt
	./convHankakuTxt

#---------------
#	haribote
#---------------
FILE = bootpack.c har.ld hankaku.c mysprintf.c mystrcmp.c graphic.c dsctbl.c int.c fifo.c keyboard.c mouse.c memory.c sheet.c timer.c mtask.c window.c console.c file.c tek.c mymemcmp.c
APIFILE = alloca.o api001.o api002.o api003.o api004.o api005.o api006.o api007.o api008.o api009.o api010.o api011.o api012.o api013.o api014.o api015.o api016.o api017.o api018.o api019.o api020.o api021.o api022.o api023.o api024.o api025.o api026.o api027.o
ipl10.bin : ipl10.asm Makefile
	nasm $< -o $@ -l ipl10.lst

nasmhead.bin : nasmhead.asm Makefile
	nasm $< -o $@ -l nasmhead.lst

nasmfunc.o : nasmfunc.asm Makefile
	nasm -g -f elf $< -o $@

#---------------
#	aplication
#---------------
a.o: a.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o a.o a.c

a.hrb: a.o apilib.a
	ld -m elf_i386 -e HariMain -o a.hrb -Tapi.ls a.o  -L. -l:apilib.a

hello.hrb: hello.asm Makefile
	nasm $< -o $@

hello2.hrb: hello2.asm Makefile
	nasm $< -o $@

hello3.o: hello3.c
	gcc -fno-pic -c -m32 -o hello3.o hello3.c

hello3.hrb: hello3.o apilib.a
	ld -m elf_i386 -e HariMain -o hello3.hrb -Tapi.ls hello3.o -L. -l:apilib.a

hello4.o: hello4.c
	gcc -fno-pic -c -m32 -o hello4.o hello4.c

hello4.hrb: hello4.o apilib.a
	ld -m elf_i386 -e HariMain -o hello4.hrb -Tapi.ls hello4.o -L. -l:apilib.a

winhelo.o: winhelo.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o winhelo.o winhelo.c

winhelo.hrb: winhelo.o apilib.a
	ld -m elf_i386 -e HariMain -o winhelo.hrb -Tapi.ls winhelo.o -L. -l:apilib.a

winhelo2.o: winhelo2.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o winhelo2.o winhelo2.c

winhelo2.hrb: winhelo2.o apilib.a
	ld -m elf_i386 -e HariMain -o winhelo2.hrb -Tapi.ls winhelo2.o -L. -l:apilib.a

winhelo3.o: winhelo3.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o winhelo3.o winhelo3.c

winhelo3.hrb: winhelo3.o apilib.a
	ld -m elf_i386 -e HariMain -o winhelo3.hrb -Tapi.ls winhelo3.o -L. -l:apilib.a

star1.o: star1.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o star1.o star1.c

star1.hrb: star1.o apilib.a
	ld -m elf_i386 -e HariMain -o star1.hrb -Tapi.ls star1.o -L. -l:apilib.a

stars.o: stars.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o stars.o stars.c

stars.hrb: stars.o apilib.a
	ld -m elf_i386 -e HariMain -o stars.hrb -Tapi.ls stars.o -L. -l:apilib.a

stars2.o: stars2.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o stars2.o stars2.c

stars2.hrb: stars2.o apilib.a
	ld -m elf_i386 -e HariMain -o stars2.hrb -Tapi.ls stars2.o -L. -l:apilib.a

lines.o: lines.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o lines.o lines.c

lines.hrb: lines.o apilib.a
	ld -m elf_i386 -e HariMain -o lines.hrb -Tapi.ls lines.o -L. -l:apilib.a

walk.o: walk.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o walk.o walk.c

walk.hrb: walk.o apilib.a
	ld -m elf_i386 -e HariMain -o walk.hrb -Tapi.ls walk.o -L. -l:apilib.a

beepdown.o: beepdown.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o beepdown.o beepdown.c

beepdown.hrb: beepdown.o apilib.a
	ld -m elf_i386 -e HariMain -o beepdown.hrb -Tapi.ls beepdown.o -L. -l:apilib.a

color.o: color.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o color.o color.c

color.hrb: color.o apilib.a
	ld -m elf_i386 -e HariMain -o color.hrb -Tapi.ls color.o -L. -l:apilib.a

color2.o: color2.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o color2.o color2.c

color2.hrb: color2.o apilib.a
	ld -m elf_i386 -e HariMain -o color2.hrb -Tapi.ls color2.o -L. -l:apilib.a

typeipl.o: typeipl.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o typeipl.o typeipl.c

typeipl.hrb: typeipl.o apilib.a
	ld -m elf_i386 -e HariMain -o typeipl.hrb -Tapi.ls typeipl.o -L. -l:apilib.a

noodle.o: noodle.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o noodle.o noodle.c

noodle.hrb: noodle.o apilib.a
	ld -m elf_i386 -e HariMain  -e dec2asc -e hex2asc -e sprintf -o noodle.hrb -Tapi.ls noodle.o -L. -l:apilib.a

hello5.o: hello5.asm
	nasm -g -f elf32 -o hello5.o hello5.asm

hello5.hrb: hello5.o
	ld -m elf_i386 -o hello5.hrb -Tapi.ls hello5.o


sosu.o: sosu.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o sosu.o sosu.c

sosu.hrb: sosu.o apilib.a
	ld -m elf_i386 -e HariMain -o sosu.hrb -Tapi.ls sosu.o -L. -l:apilib.a

sosu2.o: sosu2.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o sosu2.o sosu2.c

sosu2.hrb: sosu2.o apilib.a
	ld -m elf_i386 -e HariMain -o sosu2.hrb -Tapi.ls sosu2.o -L. -l:apilib.a

sosu3.o: sosu3.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o sosu3.o sosu3.c

sosu3.hrb: sosu3.o apilib.a
	ld -m elf_i386 -e HariMain -o sosu3.hrb -Tapi.ls sosu3.o -L. -l:apilib.a

type.o: type.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o type.o type.c

type.hrb: type.o apilib.a
	ld -m elf_i386 -e HariMain -o type.hrb -Tapi.ls type.o -L. -l:apilib.a

iroha.o: iroha.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o iroha.o iroha.c

iroha.hrb: iroha.o apilib.a
	ld -m elf_i386 -e HariMain -o iroha.hrb -Tapi.ls iroha.o -L. -l:apilib.a

chklang.o: chklang.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o chklang.o chklang.c

chklang.hrb: chklang.o apilib.a
	ld -m elf_i386 -e HariMain -o chklang.hrb -Tapi.ls chklang.o -L. -l:apilib.a

notrec.o: notrec.c
	gcc -fno-pic -fno-stack-protector -c -m32 -o notrec.o notrec.c

notrec.hrb: notrec.o apilib.a
	ld -m elf_i386 -e HariMain -o notrec.hrb -Tapi.ls notrec.o -L. -l:apilib.a

bball.o: bball.c
	gcc -fno-pic -c -m32 -o bball.o bball.c

bball.hrb: bball.o apilib.a
	ld -m elf_i386 -e HariMain -o bball.hrb -Tapi.ls bball.o -L. -l:apilib.a

crack7.o: crack7.asm
	nasm -g -f elf32 -o crack7.o crack7.asm

crack7.hrb: crack7.o
	ld -m elf_i386 -o crack7.hrb -Tapi.ls crack7.o

%.hrb: %.asm
	nasm $< -o $@
	
alloca.o: alloca.asm
	nasm -f elf32 -o alloca.o alloca.asm

api001.o: api001.asm
	nasm -f elf32 -o api001.o api001.asm

api002.o: api002.asm
	nasm -f elf32 -o api002.o api002.asm

api003.o: api003.asm
	nasm -f elf32 -o api003.o api003.asm

api004.o: api004.asm
	nasm -f elf32 -o api004.o api004.asm

api005.o: api005.asm
	nasm -f elf32 -o api005.o api005.asm

api006.o: api006.asm
	nasm -f elf32 -o api006.o api006.asm

api007.o: api007.asm
	nasm -f elf32 -o api007.o api007.asm

api008.o: api008.asm
	nasm -f elf32 -o api008.o api008.asm

api009.o: api009.asm
	nasm -f elf32 -o api009.o api009.asm

api010.o: api010.asm
	nasm -f elf32 -o api010.o api010.asm

api011.o: api011.asm
	nasm -f elf32 -o api011.o api011.asm

api012.o: api012.asm
	nasm -f elf32 -o api012.o api012.asm

api013.o: api013.asm
	nasm -f elf32 -o api013.o api013.asm

api014.o: api014.asm
	nasm -f elf32 -o api014.o api014.asm

api015.o: api015.asm
	nasm -f elf32 -o api015.o api015.asm

api016.o: api016.asm
	nasm -f elf32 -o api016.o api016.asm

api017.o: api017.asm
	nasm -f elf32 -o api017.o api017.asm

api018.o: api018.asm
	nasm -f elf32 -o api018.o api018.asm

api019.o: api019.asm
	nasm -f elf32 -o api019.o api019.asm

api020.o: api020.asm
	nasm -f elf32 -o api020.o api020.asm

api021.o: api021.asm
	nasm -f elf32 -o api021.o api021.asm

api022.o: api022.asm
	nasm -f elf32 -o api022.o api022.asm

api023.o: api023.asm
	nasm -f elf32 -o api023.o api023.asm

api024.o: api024.asm
	nasm -f elf32 -o api024.o api024.asm

api025.o: api025.asm
	nasm -f elf32 -o api025.o api025.asm

api026.o: api026.asm
	nasm -f elf32 -o api026.o api026.asm

api027.o: api027.asm
	nasm -f elf32 -o api027.o api027.asm

%.o : %.c
	$(CC) -c -fno-pic -m32 -march=i486 -nostdlib $*.c -o $*.o

apilib.a:$(APIFILE)
	ar r apilib.a $(APIFILE)

#bootpack.hrb : bootpack.o hankaku.o nasmfunc.o mysprintf.o graphic.o dsctbl.o har.ld
#	ld -m elf_i386 -T har.ld bootpack.o hankaku.o nasmfunc.o mysprintf.o graphic.o dsctbl.o -o $@

#---------------
#	haribote
#---------------

bootpack.hrb : $(FILE) nasmfunc.o Makefile
	gcc -Wl,-Map=bootpack.map -march=i486 -m32 -nostdlib -T har.ld -fno-pic $(FILE) nasmfunc.o -o $@

haribote.sys : nasmhead.bin bootpack.hrb Makefile
	cat nasmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy haribote.sys -i haribote.img ::
#	mcopy -i haribote.img hello.hrb ::
#	mcopy -i haribote.img hello2.hrb ::
#	mcopy -i haribote.img a.hrb ::
#	mcopy -i haribote.img hello3.hrb ::
#	mcopy -i haribote.img crack1.hrb ::
#	mcopy -i haribote.img crack2.hrb ::
#	mcopy -i haribote.img crack3.hrb ::
#	mcopy -i haribote.img crack4.hrb ::
#	mcopy -i haribote.img crack5.hrb ::
#	mcopy -i haribote.img crack6.hrb ::
#	mcopy -i haribote.img crack7.hrb ::
#	mcopy -i haribote.img bug1.hrb ::
#	mcopy -i haribote.img bug2.hrb ::
#	mcopy -i haribote.img bug3.hrb ::
#	mcopy -i haribote.img hello4.hrb ::
#	mcopy -i haribote.img hello5.hrb ::
#	mcopy -i haribote.img winhelo.hrb ::
#	mcopy -i haribote.img winhelo2.hrb ::
#	mcopy -i haribote.img winhelo3.hrb ::
#	mcopy -i haribote.img star1.hrb ::
#	mcopy -i haribote.img stars.hrb ::
#	mcopy -i haribote.img stars2.hrb ::
	mcopy -i haribote.img lines.hrb ::
#	mcopy -i haribote.img walk.hrb ::
#	mcopy -i haribote.img noodle.hrb ::
#	mcopy -i haribote.img beepdown.hrb ::
#	mcopy -i haribote.img color.hrb ::
#	mcopy -i haribote.img color2.hrb ::
#	mcopy -i haribote.img sosu.hrb ::
#	mcopy -i haribote.img sosu2.hrb ::
#	mcopy -i haribote.img sosu3.hrb ::
#	mcopy -i haribote.img typeipl.hrb ::
#	mcopy -i haribote.img ipl10.asm ::
#	mcopy -i haribote.img type.hrb ::
#	mcopy -i haribote.img iroha.hrb ::
	mcopy -i haribote.img nihongo.fnt ::
#	mcopy -i haribote.img jis.txt ::
#	mcopy -i haribote.img euc.txt ::
#	mcopy -i haribote.img chklang.hrb ::
#	mcopy -i haribote.img notrec.hrb ::
	mcopy -i haribote.img bball.hrb ::
	
	
asm :
	make -r ipl10.bin

img :
	make -r haribote.img

hrb :
	make hello.hrb
	make hello2.hrb
	make a.hrb
	make hello3.hrb
#	make crack1.hrb
#	make crack2.hrb
#	make crack3.hrb
#	make crack4.hrb
#	make crack5.hrb
#	make crack6.hrb
	make crack7.hrb
#	make bug1.hrb
#	make bug2.hrb
#	make bug3.hrb
	make hello4.hrb
	make hello5.hrb
	make winhelo.hrb
	make winhelo2.hrb
	make winhelo3.hrb
	make star1.hrb
	make stars.hrb
	make stars2.hrb
	make lines.hrb
	make walk.hrb
	make noodle.hrb
	make beepdown.hrb
	make color.hrb
	make color2.hrb
	make sosu.hrb
	make sosu2.hrb
	make sosu3.hrb
	make typeipl.hrb
	make type.hrb
	make iroha.hrb
	make chklang.hrb
	make notrec.hrb
	make bball.hrb
	
run :
	make apilib.a
	make hrb
	make hello2.hrb
	make img
	qemu-system-i386 -fda haribote.img

debug :
	make img
	qemu-system-i386 -fda haribote.img -gdb tcp::10000 -s

clean :
	rm *.lst 
	rm *.bin
	rm *.o
	rm *.sys
	rm *.img
	rm *.hrb
	rm *.map