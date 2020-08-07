section .text
global _start			; must be declared for linker
_start:				; entry point
	mov eax,0x1234		; movs valores inmediatos
	mov ebx,0x5678
	mov edi,eax		; movs entre registros
	mov esi,ebx
	mov edi,mem1		; movs direcciones
	mov esi,mem2		; check x/x &mem1, content x/s &mem1

	mov [name],dword 'Done'	; x/s 0x804...
	mov eax,1		; system call numbre (sys_exit)
	int 0x80		; call kernel

section .data

	name: db 'Test',0xa
	mem1: db "hello",0xa
	mem2: db "word",0xa
