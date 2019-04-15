
; Pacheco Franco Jesús Enrique
; switch (asm)
; 04/Abril/2019

section .text

    global _start   ; Directiva [Punto de Entrada]

    _start:
        
        mov eax, choice     ; Se mueve el valor que sera evaluado para ver a
                            ; donde se va a saltar.
        cmp eax, 0d1        ; Se compara para ver si el valor es uno.
        je one              ; Si el valor es uno saltamos a la etiqueta one.
        cmp eax, 0d2        ; Se compara para ver si el valor es dos.
        je two              ; Si el valor es dos saltamos a la etiqueta two.
        cmp eax, 0d3        ; Se compara para ver si el valor es tres.
        je three            ; Si el valor es tres saltamos a la etiqueta three.
        jmp fin             ; Si el valor es diferente de todo lo que definimos
                            ; se salta a la etiqueta fin.
        
        one:
            mov edx, len_one        ; Se carga la longitud del mensaje.
            mov ecx, msj_one        ; Se carga el mensaje.
            mov ebx, 1              ; descriptor del archivo.
            mov eax, 4              ; Numero de llamada.
            int 0x80                ; Se ejecuta la llamada al sistema.
            jmp fin                 ; Se salta a la etiqueta fin.
        two:
            mov edx, len_two        ; Se carga la longitud del mensaje.
            mov ecx, msj_two        ; Se carga el mensaje.
            mov ebx, 1              ; Descriptor del archivo.
            mov eax, 4              ; Numero de llamada.
            int 0x80                ; Se ejecuta la llamada al sistema.
            jmp fin
            
        three:
            mov edx, len_three      ; Se carga la longitud del mensaje.
            mov ecx, msj_three      ; Se carga el mensaje.
            mov ebx, 1              ; Descriptor del archivo.
            mov eax, 4              ; Numero de llamada.
            int 0x80                ; Se ejecuta la llamada al sistema.

        fin:
            mov eax, 1      ; Se carga en eax el valor de la llamada al sistema
                            ; "" (1).
            int 0x80        ; Se ejecuta la llamada al sistema.

section .data

    choice equ 0d2 ; Elección para el Switch

    msj_one db 'Entraste a Opcion 1', 0xa   ; Mensaje Uno.
    len_one equ $ - msj_one                 ; Longitud Mensaje Uno.
    msj_two db 'Entraste a Opcion 2', 0xa   ; Mensaje Dos.
    len_two equ $ - msj_two                 ; Longitud Mensaje Dos.
    msj_three db 'Entraste a Opcion 3', 0xa ; Mensaje Tres.
    len_three equ $ - msj_three             ; Longitud Mensaje Tres.