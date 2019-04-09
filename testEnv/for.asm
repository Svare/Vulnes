
; Pacheco Franco Jesús Enrique
; for (asm)
; 03/Abril/2019

section .data

    i db 0d10 ; Contador para el for

section .text

    global _start   ; Directiva [Punto de Entrada]

    _start:
        
        mov eax, [i]        ; Se mueve el valor del contador al registro a
        mov ebx, 0d0        ; Se inicializa el registro b en 0

        for:
            cmp eax, 0d     ; Comparamos si el valor que hay en a es igual a
                            ; cero
            je fin          ; Si el valor en a es igual a 0 se enciende la
                            ; bandera NZ, je lo detecta y salta a fin, en caso
                            ; contrario se continua con la siguiente instruccion
                            ; de manera normal.
        
        code:
        ; --- Instrucciones a Ejecutar ---
            inc ebx         ; Se incrementa en uno el valor de ebx y se guarda
                            ; en el mismo ebx
        ; --- Fin Instrucciones a Ejecutar ---
            dec eax         ; Se decrementa eax en uno y se guarda en el mismo
                            ; eax que es nuestro contador del for
            jmp for         ; Regresamos a la etiqueta for para volver a
                            ; comparar y ver si ya terminamos.

        fin:
            mov eax, 1      ; Se carga en eax el valor de la llamada al sistema
                            ; "" (1).
            int 0x80        ; Se ejecuta la llamada al sistema.
