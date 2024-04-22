
;/*********************************************/
section .data

    noiguales db " ██▓███  ▓█████  ██▀███  ▓█████▄  ██▓ ▒█████     ▓█████  ██▓        ▄▄▄██▀▀▀█    ██ ▓█████   ▄████  ▒█████ ",0x0a,0xD,"▓██░  ██▒▓█   ▀ ▓██ ▒ ██▒▒██▀ ██▌▓██▒▒██▒  ██▒   ▓█   ▀ ▓██▒          ▒██   ██  ▓██▒▓█   ▀  ██▒ ▀█▒▒██▒  ██▒",0x0a,0xD,"▓██░ ██▓▒▒███   ▓██ ░▄█ ▒░██   █▌▒██▒▒██░  ██▒   ▒███   ▒██░          ░██  ▓██  ▒██░▒███   ▒██░▄▄▄░▒██░  ██▒",0x0a,0xD,"▒██▄█▓▒ ▒▒▓█  ▄ ▒██▀▀█▄  ░▓█▄   ▌░██░▒██   ██░   ▒▓█  ▄ ▒██░       ▓██▄██▓ ▓▓█  ░██░▒▓█  ▄ ░▓█  ██▓▒██   ██░",0x0a,0xD,"▒██▒ ░  ░░▒████▒░██▓ ▒██▒░▒████▓ ░██░░ ████▓▒░   ░▒████▒░██████▒    ▓███▒  ▒▒█████▓ ░▒████▒░▒▓███▀▒░ ████▓▒░",0x0a,0xD,"▒▓▒░ ░  ░░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒▓  ▒ ░▓  ░ ▒░▒░▒░    ░░ ▒░ ░░ ▒░▓  ░    ▒▓▒▒░  ░▒▓▒ ▒ ▒ ░░ ▒░ ░ ░▒   ▒ ░ ▒░▒░▒░ ",0x0a,0xD,"░▒ ░      ░ ░  ░  ░▒ ░ ▒░ ░ ▒  ▒  ▒ ░  ░ ▒ ▒░     ░ ░  ░░ ░ ▒  ░    ▒ ░▒░  ░░▒░ ░ ░  ░ ░  ░  ░   ░   ░ ▒ ▒░ ",0x0a,0xD,"░░          ░     ░░   ░  ░ ░  ░  ▒ ░░ ░ ░ ▒        ░     ░ ░       ░ ░ ░   ░░░ ░ ░    ░   ░ ░   ░ ░ ░ ░ ▒  ",0x0a,0xD,"            ░  ░   ░        ░     ░      ░ ░        ░  ░    ░  ░    ░   ░     ░        ░  ░      ░     ░ ░  ",0x0a,0xD

    lnnoiguales equ $-noiguales

    iguales db "██████    █████  ███    ██  ██████      ███████ ██               ██ ██    ██ ███████  ██████   ██████  ██ ",0x0a,0xD, "██       ██   ██ ████   ██ ██    ██     ██      ██               ██ ██    ██ ██      ██       ██    ██ ██",0x0a,0xD,"██   ███ ███████ ██ ██  ██ ██    ██     █████   ██               ██ ██    ██ █████   ██   ███ ██    ██ ██ ",0x0a,0xD,"██    ██ ██   ██ ██  ██ ██ ██    ██     ██      ██          ██   ██ ██    ██ ██      ██    ██ ██    ██    ",0x0a,0xD,"██████   ██   ██ ██   ████  ██████      ███████ ███████      █████   ██████  ███████  ██████   ██████  ██ ",0x0a,0xD
    lniguales equ $-iguales

    info db 0x0a,0xD,0x0a,0xD,"Jugador 1: x",0x0a,0xD,"Jugador 2: o",0x0a,0xD,"Coordenadas: "
    lenInfo equ $-info

    matriz db "   #   #   "
    lenMatriz equ $-matriz

    abierto db "["
    lenAbierto equ $-abierto

    x db "x"
    lenX equ $-x

    cerrado db "]"
    lenCerrado equ $-cerrado

    linea db 0x0a,0xD,"=========",0x0a,0xD,
    lenLinea equ $-linea


section .bss
turno resb 4;
boolean resb 1;
contador resb 1;

section .text

iniciarJuego:       ;En está etiqueta se inicia el juego
   mov ebx,1
   mov [turno], ebx
   mov eax, 1
   mov [boolean], eax
   dec eax
   mov [contador], eax

SolicitarCoordenadas:
    limpiar
    mov esi,matriz
    mov edi,0
    mov ecx,9
    jmp dibujarMatriz

dibujarMatriz:
    mov dl,[esi]
    cmp dl,"#"
    je dibujarLinea
    push rcx
    push rax
    imprimirColor abierto,lenAbierto,colorRandom1
    imprimir esi,1
    imprimir cerrado,lenCerrado
    pop rax
    pop rcx
    inc edi
    inc esi
    loop dibujarMatriz
    mov eax, [boolean]
    cmp eax, 0
    je ganador
    cmp eax, 3
    je empate
    jmp solicitar

dibujarLinea:
    push rcx
    imprimir linea,lenLinea
    inc edi
    inc esi
    pop rcx
    jmp dibujarMatriz

solicitar:
    imprimir info,lenInfo
    leerString
    posicionar text, [turno]
    jmp continuar


continuar: 
    mov eax, matriz
    add eax, 5
    mov bl, byte[eax]
    cmp bl, ' '
    jne verficarDiagonal
    jmp continuar1
    
    
verficarDiagonal: ;Revisa la digonal izquierda derecha
    mov eax, matriz
    add eax, 5
    mov bl, byte[eax]
    add eax, 5
    cmp bl, byte[eax]
    jne verficarDiagonal2
    sub eax, 10
    cmp bl, byte[eax]
    je modificarBool

verficarDiagonal2: ;Revisa la digonal derecha izquirda
    sub eax, 5
    add eax, 3
    cmp bl, byte[eax]
    jne verificaColumnaCentral
    sub eax, 6
    cmp bl, byte[eax]
    je modificarBool

verificaColumnaCentral: ;Revisa la columna central
    mov eax, matriz
    add eax, 5
    mov bl, byte[eax]
    add eax, 4
    cmp bl, byte[eax]
    jne verificaFilaCentral
    sub eax, 8
    cmp bl, byte[eax]
    je modificarBool

verificaFilaCentral:  ;Revisa la fila central
    mov eax, matriz
    add eax, 5
    mov bl, byte[eax]
    add eax, 1
    cmp bl, byte[eax]
    jne continuar1
    sub eax, 2
    cmp bl, byte[eax]
    je modificarBool

continuar1: 
    mov eax, matriz
    add eax, 10
    mov bl, byte[eax]
    cmp bl, ' '
    jne ComprobobarColumnaD
    jmp continuar2

ComprobobarColumnaD:  ;Revisa la columna derecha
    mov eax, matriz
    add eax, 10
    mov bl, byte[eax]
    sub eax,4
    cmp bl, byte[eax]
    jne ComprobobarFilaInferior
    sub eax, 4
    cmp bl, byte[eax]
    je modificarBool

ComprobobarFilaInferior:  ;Revisa la fila de abajo 
    mov eax, matriz
    add eax,10
    mov bl, byte[eax]
    sub eax, 1
    cmp bl, byte[eax]
    jne continuar2
    sub eax, 1
    cmp bl, byte[eax]
    je modificarBool

continuar2: 
    mov eax, matriz
    mov bl, byte[eax]
    cmp bl, ' '
    jne ComprobobarColumnaI
    jmp SolicitarCoordenadas


ComprobobarColumnaI:  ;Revisa la columna izquierda 
    mov eax, matriz
    add eax, 4
    mov bl, byte[eax]
    sub eax,4
    cmp bl, byte[eax]
    jne ComprobarFilaSuperior
    add eax, 8
    cmp bl, byte[eax]
    je modificarBool

ComprobarFilaSuperior: ;Revisa la fila superior 
    mov eax, matriz
    add eax, 1
    mov bl, byte[eax]
    sub eax, 1
    cmp bl, byte[eax]

    mov ecx, lenMatriz
    mov eax, matriz

    jne verificarEmpate
    add eax, 2
    cmp bl, byte[eax]
    je modificarBool
    jmp SolicitarCoordenadas


modificarBool:
    mov eax, 0
    mov [boolean], eax
    jmp SolicitarCoordenadas

verificarEmpate:    
    cmp byte[eax], ' '
    je SolicitarCoordenadas
    inc eax
    loop verificarEmpate
    jmp modificarBool1
    

modificarBool1:
    mov eax, 3
    mov [boolean], eax
    jmp SolicitarCoordenadas
