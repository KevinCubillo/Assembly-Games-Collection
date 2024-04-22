%include 'Macros.asm'
%include 'jugar.asm'


;/*********************************************/

section .data
    ln1 dd "        ██████╗ ██╗███████╗███╗   ██╗██╗   ██╗███████╗███╗   ██╗██╗██████╗  ██████╗      █████╗ ██╗           ", 0x0a, 0xD, "        ██╔══██╗██║██╔════╝████╗  ██║██║   ██║██╔════╝████╗  ██║██║██╔══██╗██╔═══██╗    ██╔══██╗██║           ", 0x0a,0xD,"        ██████╔╝██║█████╗  ██╔██╗ ██║██║   ██║█████╗  ██╔██╗ ██║██║██║  ██║██║   ██║    ███████║██║           ", 0x0a,0xD,"        ██╔══██╗██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║██║  ██║██║   ██║    ██╔══██║██║           ", 0x0a,0xD,"        ██████╔╝██║███████╗██║ ╚████║ ╚████╔╝ ███████╗██║ ╚████║██║██████╔╝╚██████╔╝    ██║  ██║███████╗      ", 0x0a,0xD,"        ╚═════╝ ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝╚═════╝  ╚═════╝     ╚═╝  ╚═╝╚══════╝      ", 0x0a,0xD,0x0a,0xD,"     ██╗██╗   ██╗███████╗ ██████╗  ██████╗     ██████╗ ███████╗██╗          ██████╗  █████╗ ████████╗ ██████╗ ", 0x0a,0xD,"     ██║██║   ██║██╔════╝██╔════╝ ██╔═══██╗    ██╔══██╗██╔════╝██║         ██╔════╝ ██╔══██╗╚══██╔══╝██╔═══██╗", 0x0a,0xD,"     ██║██║   ██║█████╗  ██║  ███╗██║   ██║    ██║  ██║█████╗  ██║         ██║  ███╗███████║   ██║   ██║   ██║", 0x0a,0xD,"██   ██║██║   ██║██╔══╝  ██║   ██║██║   ██║    ██║  ██║██╔══╝  ██║         ██║   ██║██╔══██║   ██║   ██║   ██║", 0x0a,0xD,"╚█████╔╝╚██████╔╝███████╗╚██████╔╝╚██████╔╝    ██████╔╝███████╗███████╗    ╚██████╔╝██║  ██║   ██║   ╚██████╔╝",0x0a,0xD," ╚════╝  ╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝     ╚═════╝ ╚══════╝╚══════╝     ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ", 0x0a,0xD,0x0a,0xD
    len1 equ $ - ln1

    msg1 db 0x0a,0xD,0x0a,0xD,"                                     Seleccione una opción", 0x0a,0xD,0x0a,0xD,0x0a,0xD,0x0a,0xD
    lenMsg1 equ $ - msg1

    msg2 db "                                      1. Inciar juego", 0x0a,0xD
    lenMsg2 equ $ - msg2

    msg3 db "                                         2. Salir", 0x0a,0xD
    lenMsg3 equ $ - msg3

    msg4 db 0x0a,0xD,0x0a,0xD,"Ganó el jugador 1",0x0a,0xD
    lenMsg4 equ $ - msg4

    msg5 db 0x0a,0xD,0x0a,0xD,"Ganó el jugador 2",0x0a,0xD
    lenMsg5 equ $ - msg5

    msg6 db 0x0a,0xD,0x0a,0xD,"Empate!",0x0a,0xD
    lenMsg6 equ $ - msg6

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

    limpiar 
    imprimirColor ln1,len1,colorRandom2                  ;Ascci art Menu principañ
    imprimir msg1,lenMsg1               ;Contenido del menu
    imprimir msg2,lenMsg2               ;Contenido del menu
    imprimir msg3,lenMsg3               ;Contenido del menu
    leer 1                              ;Lectura de teclado
    sub eax,30h                         ;Ajuste de entrada
    cmp eax,1
    je iniciarJuego
   
    cmp eax, 2                          ;Comparacion con salir
    je fin                              ;Salto a salir


    jmp menu                            ;Bucle en caso de ingresar una opcion incorrecta

ganador:
    mov eax, [turno]
    cmp eax, 1
    je ganador1
    imprimirColor msg5, lenMsg5, colorAzul
    jmp fin

ganador1:
    imprimirColor msg4, lenMsg4, colorAzul
    jmp fin

empate:
    imprimirColor msg6, lenMsg6, colorRandom3
    jmp fin
    

fin:  ;-------------------------------------------------------------Finaliza el programa
   mov eax, 1
   mov ebx, 0
   int 0x80