#Commands

gcc $name.c -o $name -m32 -fno-pic -z excecstack -mpreferred-stack-boundary=2 -fno-stack-protector

nasm -f elf32 -o $name.obj $name.asm && ld -m elf_i386 -o $name $name.obj