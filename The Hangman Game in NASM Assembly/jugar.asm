
;/*********************************************/
section .data
    msg6 db "                         Juego de ahorcado - Dificultad BAJA ",0x0a,0xD
    len6 equ $ - msg6

    espacio db " "
    lenEspacio equ $ - espacio

    noiguales db " ██▓███  ▓█████  ██▀███  ▓█████▄  ██▓ ▒█████     ▓█████  ██▓        ▄▄▄██▀▀▀█    ██ ▓█████   ▄████  ▒█████ ",0x0a,0xD,"▓██░  ██▒▓█   ▀ ▓██ ▒ ██▒▒██▀ ██▌▓██▒▒██▒  ██▒   ▓█   ▀ ▓██▒          ▒██   ██  ▓██▒▓█   ▀  ██▒ ▀█▒▒██▒  ██▒",0x0a,0xD,"▓██░ ██▓▒▒███   ▓██ ░▄█ ▒░██   █▌▒██▒▒██░  ██▒   ▒███   ▒██░          ░██  ▓██  ▒██░▒███   ▒██░▄▄▄░▒██░  ██▒",0x0a,0xD,"▒██▄█▓▒ ▒▒▓█  ▄ ▒██▀▀█▄  ░▓█▄   ▌░██░▒██   ██░   ▒▓█  ▄ ▒██░       ▓██▄██▓ ▓▓█  ░██░▒▓█  ▄ ░▓█  ██▓▒██   ██░",0x0a,0xD,"▒██▒ ░  ░░▒████▒░██▓ ▒██▒░▒████▓ ░██░░ ████▓▒░   ░▒████▒░██████▒    ▓███▒  ▒▒█████▓ ░▒████▒░▒▓███▀▒░ ████▓▒░",0x0a,0xD,"▒▓▒░ ░  ░░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒▓  ▒ ░▓  ░ ▒░▒░▒░    ░░ ▒░ ░░ ▒░▓  ░    ▒▓▒▒░  ░▒▓▒ ▒ ▒ ░░ ▒░ ░ ░▒   ▒ ░ ▒░▒░▒░ ",0x0a,0xD,"░▒ ░      ░ ░  ░  ░▒ ░ ▒░ ░ ▒  ▒  ▒ ░  ░ ▒ ▒░     ░ ░  ░░ ░ ▒  ░    ▒ ░▒░  ░░▒░ ░ ░  ░ ░  ░  ░   ░   ░ ▒ ▒░ ",0x0a,0xD,"░░          ░     ░░   ░  ░ ░  ░  ▒ ░░ ░ ░ ▒        ░     ░ ░       ░ ░ ░   ░░░ ░ ░    ░   ░ ░   ░ ░ ░ ░ ▒  ",0x0a,0xD,"            ░  ░   ░        ░     ░      ░ ░        ░  ░    ░  ░    ░   ░     ░        ░  ░      ░     ░ ░  ",0x0a,0xD

    lnnoiguales equ $-noiguales

    iguales db "██████    █████  ███    ██  ██████      ███████ ██               ██ ██    ██ ███████  ██████   ██████  ██ ",0x0a,0xD, "██       ██   ██ ████   ██ ██    ██     ██      ██               ██ ██    ██ ██      ██       ██    ██ ██",0x0a,0xD,"██   ███ ███████ ██ ██  ██ ██    ██     █████   ██               ██ ██    ██ █████   ██   ███ ██    ██ ██ ",0x0a,0xD,"██    ██ ██   ██ ██  ██ ██ ██    ██     ██      ██          ██   ██ ██    ██ ██      ██    ██ ██    ██    ",0x0a,0xD,"██████   ██   ██ ██   ████  ██████      ███████ ███████      █████   ██████  ███████  ██████   ██████  ██ ",0x0a,0xD
    lniguales equ $-iguales


    msg7 db "Palabra a adivinar"
    lenMsg7 equ $ - msg7


    msg9 db "                      Voy a tener suerte ",0x0a,0xD,0x0a,0xD,"                      Escriba la palabra: "
    lenMsg9 equ $ - msg9

    msg11 db "Intentos: "
    lenMsg11 equ $ - msg11

    intro db "Presione intro para continuar",0x0a,0xD
    lenIntro equ $ - intro


    pal1 db "Baja"
    pal2 db "Medio"
    lenpal2 equ $ - pal2
    pal3 db "Alto"
 

    Interfaz1 db "                 Juego de ahorcado - Dificultad "
    lenInterfaz1 equ $ - Interfaz1

    Interfaz2 db "                       Palabra a adivinar: "
    lenInterfaz2 equ $ - Interfaz2

    Interfaz3 db "                     Palabra: "
    lenInterfaz3 equ $ - Interfaz3

    Interfaz4 db "                     Letras solicitadas: "
    lenInterfaz4 equ $ - Interfaz4


    Interfaz5 db "                   Voy a tener Suerte [Teclee 3]: "
    lenInterfaz5 equ $ - Interfaz5

    Interfaz6 db "                        Intentos Restantes: "
    lenInterfaz6 equ $ - Interfaz6

    Interfaz7 db "                   Presione Tecla [ESC] para salir "
    lenInterfaz7 equ $ - Interfaz7

    Interfaz8 db "                         Ingrese una letra:  "
    lenInterfaz8 equ $ - Interfaz8

    archivoFacil db "facil.txt",0
    archivoMedio db "medio.txt",0
    archivoAlto db "alto.txt",0
    


section .bss
    estado resb 400
    solicitadas resb 400
    solicitadas2 resb 400
    palabra resb 400
    longitud resb 4
    turno resb 10
    intentos resb 1
    condicion resb 1
    tipo resb 400
    tipo2 resb 400
    pos resb 400
    indice resb 1
    var1 resb 100
    var2 resb 8

    
section .text



bajo:
    leerArchivo archivoFacil            ;Lee las palabras del archivo de text
    mov eax, [pal1]                     ;Mueve a eax el tipo de dificultad [Baja]
    mov [tipo], eax                     ;Se mueve a la variable tipo la dificultad
    mov eax,[tipo]
    mov [tipo2],eax
    jmp init

medio:
    leerArchivo archivoMedio           ;Lee las palabras del archivo de texto
    mov eax, [pal2]                    ;Mueve a eax el tipo de dificultad [Medio]
    mov [tipo], eax
    mov eax,[tipo]
    mov [tipo2],eax
    jmp init

alto:
    leerArchivo archivoAlto           ;Lee las palabras del archivo de texto
    mov eax, [pal3]                   ;Mueve a eax el tipo de dificultad [Alto]
    mov [tipo], eax
    mov eax,[tipo]
    mov [tipo2],eax
    jmp init

init:
    limpiar
    xor eax,eax
    xor ecx,ecx
    xor ebx,ebx
    rdtsc
    mov edx,0
    mov ecx, 5
    div ecx
    mov [indice],edx

    seleccionarPalabra [indice]
    mov eax, 0
    mov [pos],eax                   ;Se inicializa Pos en 0
    mov ecx,[longitud]              ;Se asigna a ecx la longitud de la palabra
    mov edx,0
    mov [turno],edx                 ;Se asigna a turno un 0
    mov esi,estado                  ;Se mueve a esi el estado de las entradas del usuario, en este momento "_"
    mov edi,0
    mov ebx,57
    mov [intentos],ebx
    mov [condicion],edx

generarPalabra:
    mov al,"_"
    mov [esi],al
    add esi,1
    add edi,1
    loop generarPalabra

    mov esi,estado          ;Se mueve la palabra que se va a imprimir
    mov edi,0               ;Se indica la posicion 0 del arreglo
    mov ecx,[longitud]          ;Se mueve a ECX el largo del estado

comenzar:
    push rcx

    imprimirColor Interfaz1,lenInterfaz1,colorAzul
    imprimir tipo2,lenpal2

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz2,lenInterfaz2
    imprimirNumeros [longitud]
    imprimir var2,1
    imprimir var1,1     

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz3,lenInterfaz3

    pop rcx


imprimirEstado:
    push rcx
    imprimir esi,1
    imprimir espacio,1
    inc esi
    inc edi
    pop rcx
    loop imprimirEstado

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz4,lenInterfaz4
    imprimir solicitadas,100

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz5,lenInterfaz5

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz6,lenInterfaz6
    imprimir intentos,1

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz7,lenInterfaz7

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir Interfaz8,lenInterfaz8


leerLetras:
    ;------------------------------Se solicita una letra
    mov esi,estado              ;Se mueve la palabra que se va a imprimir
    mov edi,0                   ;Se indica la posicion 0 del arreglo
    mov ecx,[longitud]          ;Se mueve a ECX el largo del estado
 
    leer 1
    leer 1

    mov al,[entrada]
    mov edx,solicitadas
    mov ecx,[turno]
    add edx,ecx
    mov byte[edx],al
    inc edx
    mov al,"-"
    mov byte[edx],al

    mov eax,[turno]
    add eax,2
    mov [turno],eax


    ;------------------------------Se ingresa "Voy a tener suerte"
    mov al, [entrada]
    cmp al, '3'
    je ProbarSuerte

    ;------------------------------Proceso de comparar arreglos

    mov edx, estado             ;Se almacena en edx el estado actual de la palabra
    mov ebx, palabra            ;Se almacena en ebx la palabra
    mov al,[entrada]            ;Se almacena en al la letra ingresada
    mov ecx,[longitud]                   ;Se pasa la cantidad de veces que el bucle se repetira
    mov esi,estado
    mov edi,pos

comparar:
    cmp byte[ebx],al            ;Se compara la letra ingresada con una posicion en especifico
    je remplaza
    inc edx
    inc ebx
    loop comparar
    limpiar
    jmp PedirOtra

;------------------------------Se remplaza
remplaza:
    push rcx
    mov ecx,1
    mov [condicion],ecx
    pop rcx
    mov byte[edx],al          ;SI las letras coinciden se remplaza
    inc edx
    inc ebx
    jmp comparar

;------------------------------Se pide otra letra
PedirOtra:
    mov eax,[pos]
    inc eax
    mov [pos],eax

    mov ebx,0
    cmp [condicion],ebx
    je bajar
    mov ebx,0
    mov [condicion],ebx
    cld
    mov ecx, [longitud]
    mov esi, estado
    mov edi, palabra
    repe cmpsb
    je gano
    mov esi,estado          ;Se mueve la palabra que se va a imprimir
    mov edi,0               ;Se indica la posicion 0 del arreglo
    mov ecx,[longitud]          ;Se mueve a ECX el largo del estado
    mov ebx,0
    cmp [condicion],ebx
    mov ebx,'0'
    cmp [intentos],ebx
    je perdio
    jmp comenzar

;------------------------------Se disminuye un intento disponible
bajar:
    mov al,[intentos]
    mov ebx,1
    mov [condicion],ebx
    dec al
    mov [intentos],al
    jmp PedirOtra

    ;------------------------------EL usuario puede ingresar la palabra completa
ProbarSuerte:
    limpiar
    imprimirColor msg9,lenMsg9,colorRandom3
    leer 20
    leer 20
    cld
    mov ecx, [longitud]
    mov esi, palabra
    mov edi, entrada
    repe cmpsb
    jne perdio
    jmp gano

;------------------------------Se ejecuta este fragmento en caso de que el usuario gane
gano:
    limpiar
    imprimirColor iguales,lniguales,colorVerde
    imprimir ln, lenln

    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln


    imprimir intro, lenIntro
    leer 1
    leer 1

    limpiar
    
    jmp fin

;------------------------------Se ejecuta este fragmento en caso de que el usuario pierda
perdio:
    limpiar
    imprimirColor noiguales, lnnoiguales, colorRojo
    imprimir ln, lenln


    imprimir ln,lenln
    imprimir ln,lenln
    imprimir ln,lenln

    imprimir intro, lenIntro
    
    leer 1
    leer 1

    limpiar

    jmp fin




