
; Jesus Enrique Pacheco Franco
; Cifrador
; 07/Abril/2019

.data

    string db "GG_Man"      ; Cadena a cifrar.
    str_len equ $ - string  ; Longitud cadena a cifrar.

.text

    global _start           ; Directiva [Punto de Entrada].

    _start:

        ; edx sera el apuntador a la cadena que nos va a servir para poder
        ; iterar sobre la misma, cada que se aplican las operaciones de
        ; cifrado a un byte edx se incrementa en una unidad.

        lea edx, [string]   ; Cargamos la direccion de memoria de la cadena.
        mov ecx, str_len    ; Cargamos la longitud de la cadena.
        xor ebx, ebx        ; Se limpia ebx.

        for:

            mov al, [edx]   ; Se carga el byte a cifrar.
            inc al          ; Se incrementa en uno el byte.
            ror al, 3       ; Se realiza una rotacion a la derecha 3 bits.
            dec al          ; Se decrementa en uno el byte.
            rol al, 3       ; Se realiza una rotacion a la izquierda 3 bits.
            not al          ; Se niega el byte.

            ; Esta seccion comprueba si ya se cifraron 4 bytes y de ser asi
            ; se almacenan los 4 bytes cifrados en la pila y se limpian los
            ; registros ebx y eax.

            inc ebx
            cmp ebx, 0d4
            jne continue

            push eax        ; Se guardan 4 bytes cifrados en la pila.
            xor ebx, ebx    ; Se limpia el registro ebx.
            xor eax, eax    ; Se limpia el registro eax.

        continue:

            sal eax, 8      ; Corrimiento a la izquierda de 8 bits para liberar
                            ; espacio para poder meter el siguiente byte.
            inc edx         ; Se incrementa en uno el apuntador a la cadena.
            loop for        ; Decrementa ecx y si no da 0 salta a for si en 
                            ; efecto es cero se continua con la siguiente
                            ; instruccion.
            cmp ebx, 0d0    ; Se checa si hay bytes cifrados por guardar.
            je end          ; Si no salta a end.
            sar eax, 8      ; Si en efecto faltan revertimos el corrimiento.
            push eax        ; Se guardan los ultimos bytes cifrados.
    
    end: ; Salida del Programa.

        mov eax, 1          ; Llamada al sistema exit.
        int 0x80            ; Se ejecuta llamada al sistema.
