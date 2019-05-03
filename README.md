# Vulnes

## Comandos Útiles

    name=shellcode

    gcc $name.c -o $name -no-pie -ggdb -m32 -fno-pic -z execstack -mpreferred-stack-boundary=2 -fno-stack-protector

    nasm -f elf32 -o $name.obj $name.asm && ld -m elf_i386 -o $name $name.obj

## ASLR

    PATH: 			/proc/sys/kernel/randomize_va_space
    Disable Randomization: 	sysctl -w kernel.randomize_va_space=0
