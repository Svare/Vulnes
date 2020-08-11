

# Preparando el Ambiente

   # hostnamectl

   Static hostname: ubuntu
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 141c0288eebd4f06834723b3be758589
           Boot ID: 3dc1590ebdc6413892eabcffb7ff1aeb
    Virtualization: vmware
  Operating System: Ubuntu 16.04.6 LTS
            Kernel: Linux 4.15.0-45-generic
      Architecture: x86-64


sudo apt install gcc-multilib
sudo dpkg --add-architecture i386
	dpkg-architecture --list
	dpkg --print-foreign-architectures
	dpkg --remove-architecture i386
sudo apt install cmake build-essential libboost-dev gdb
sudo apt install nasm

alias compile_asm='nasm -f elf32 -o $fuente.obj $fuente.asm && ld -m elf_i386 -o $fuente $fuente.obj'
alias compile_shellcode='nasm -f elf32 -o $fuente.obj $fuente.asm && ld -N -m elf_i386 -o $fuente $fuente.obj'
alias compile_c='gcc test.c -o testc  -m32  -fno-pic -z execstack -mpreferred-stack-boundary=2 -fno-stack-protector'

