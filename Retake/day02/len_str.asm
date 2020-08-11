section .text
global _start
_start:
	mov ecx,1
	mov edx,2
	cmp ecx,edx
	je iguales
	jmp distintos

salir:

	mov ebx,1
	mov eax,1
	int 0x80

distintos:

	mov edx,len_dis
	mov ecx,msg_dis
	mov ebx,1
	mov eax,4
	int 0x80
	jmp salir

iguales:

	mov edx,len_equ
	mov ecx,msg_equ
	mov ebx,1
	mov eax,4
	int 0x80
	jmp salir

section .data

	msg_dis: db 'son distintos',0xa
	len_dis: equ $ - msg_dis
	msg_equ: db 'son iguales',0xa
	len_equ: equ $ - msg_equ
