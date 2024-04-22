%include 'Macros.asm'
%include 'jugar.asm'


;/*********************************************/

section .data
    ln1 dd " ___    _                                    _      _                  _       _                           ", 0x0a, 0xD, "| _ )  (_)   ___   _ _   __ __  ___   _ _   (_)  __| |  ___     __ _  | |     (_)  _  _   ___   __ _   ___ ", 0x0a,0xD,"| _ \  | |  / -_) | ' \  \ V / / -_) | ' \  | | / _` | / _ \   / _` | | |     | | | || | / -_) / _` | / _ \", 0x0a,0xD,"|___/  |_|  \___| |_||_|  \_/  \___| |_||_| |_| \__,_| \___/   \__,_| |_|    _/ |  \_,_| \___| \__, | \___/", 0x0a,0xD," ___                   _                                 _                  |__/               |___/       ", 0x0a,0xD,"|   \   ___     __ _  | |_    ___   _ _   __   __ _   __| |  ___ ", 0x0a,0xD,"| |) | / -_)   / _` | | ' \  / _ \ | '_| / _| / _` | / _` | / _ \", 0x0a,0xD,"|___/  \___|   \__,_| |_||_| \___/ |_|   \__| \__,_| \__,_| \___/", 0x0a,0xD,0x0a,0xD,0x0a,0xD,0x0a,0xD,0x0a,0xD
    len1 equ $ - ln1

    msg1 db "                               Seleccione una opción", 0x0a,0xD,0x0a,0xD,0x0a,0xD,0x0a,0xD
    lenMsg1 equ $ - msg1

    msg2 db "                               1. Inciar juego", 0x0a,0xD
    lenMsg2 equ $ - msg2

    msg3 db "                               2. Salir", 0x0a,0xD
    lenMsg3 equ $ - msg3

    msg4 db "                             Selecione la dificultad: ",0x0a,0xD,"                               1. Bajo",0x0a,0xD,"                               2. Medio",0x0a,0xD,"                               3. Alto",0x0a,0xD,"                               4. Ir a menu anterior",0x0a,0xD 
    lenMSg4 equ $ - msg4

    ln2 dd "  ___          _        _                     _                           ", 0x0a, 0xD," |_ _|  _ _   (_)  __  (_)  __ _   _ _     _ | |  _  _   ___   __ _   ___ ", 0x0a, 0xD,"  | |  | ' \  | | / _| | | / _` | | '_|   | || | | || | / -_) / _` | / _ \", 0x0a, 0xD," |___| |_||_| |_| \__| |_| \__,_| |_|      \__/   \_,_| \___| \__, | \___/", 0x0a, 0xD,"                                                              |___/       ",0x0a,0xD,0x0a,0xD,0x0a,0xD,0x0a,0xD
    len2 equ $ - ln2

    ln db 0xa,0xd
    lenln equ $-ln

    colorRojo db 0x1b,"[31;1m"
    
    colorRandom1 db 0x1b,"[36;1m"
    colorRandom2 db 0x1b,"[33;1m"
    colorRandom3 db 0x1b,"[35;1m"
    colorAzul db 0x1b,"[34;1m"
    colorVerde db 0x1b,"[32;1m"

section .text
    global _start

_start:


menu: ;----------------------------------------------------------------Menu principal
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx
    limpiar 
    imprimirColor ln1,len1,colorRandom2                  ;Ascci art Menu principañ
    imprimir msg1,lenMsg1               ;Contenido del menu
    imprimir msg2,lenMsg2               ;Contenido del menu
    imprimir msg3,lenMsg3               ;Contenido del menu
    leer 1                              ;Lectura de teclado
    sub eax,30h                         ;Ajuste de entrada

    cmp eax, 1                          ;comparación Iniciar juego                     
    je dificultad                       ;Salto a seleccion de dificultad

    cmp eax, 2                          ;Comparacion con salir
    je fin                              ;Salto a salir

    jmp menu                            ;Bucle en caso de ingresar una opcion incorrecta


dificultad: ;--------------------------------------------------------Pantalla de seleccion de dificultad
    limpiar                             ;Macro para limpiar pantalla
    imprimirColor ln2, len2,colorRandom1
    imprimir msg4,lenMSg4
    leer 1
    sub eax, 30h

    ;------Comparadores de dificultad
    cmp eax, 1
    je bajo

    cmp eax, 2
    je medio

    cmp eax, 3
    je alto

    cmp eax, 4
    je menu

    jmp dificultad                      ;Bucle en caso de ingresar una opcion incorrecta

fin:  ;-------------------------------------------------------------Finaliza el programa
   mov eax, 1
   mov ebx, 0
   int 0x80

