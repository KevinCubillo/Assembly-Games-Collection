
;/*********************************************/

section .data

;Macro para imprimir texto---------------------------------------

    %macro imprimir 2 ; formato [TEXTO] [LONGITUD]
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 0x80
    %endmacro

; Macro para imprimir texto con color

    %macro imprimirColor 3 ; formato [TEXTO] [LONGITUD] [color]
        mov eax,4
        mov ebx,0
        mov ecx,%3
        mov edx,7
        int 80h
        
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 0x80
    %endmacro

; Macro para Limpiar pantalla---------------------------------------

    ClearTerm: db   27,"[H",27,"[2J"    
    CLEARLEN   equ  $-ClearTerm         

    %macro limpiar 0
        mov eax, 4                          
        mov ebx, 1                          
        mov ecx, ClearTerm                  
        mov edx, CLEARLEN                   
        int 80h
    %endmacro

;Macro para leer valores---------------------------------------

    %macro leer 1
        xor eax, eax
        mov eax, 3
        mov ebx, 2
        mov ecx, entrada
        mov edx, %1
        int 0x80
        mov eax, [entrada]
        cmp eax, 27
        je fin
    %endmacro

;------Macro para remplazar

    %macro remplazar 2
        mov %1,%2
    %endmacro


    %macro leerArchivo 1
        mov eax, 5
        mov ebx, %1
        mov ecx, 0002h
        int 0x80

        mov dword[idarchivo], eax

        mov eax, 3
        mov ebx, [idarchivo]
        mov ecx, contenido
        mov edx, 200
        int 0x80
    %endmacro

    %macro seleccionarPalabra 1
        mov eax,contenido           ;Se pasa a eax la lista de palabras
        mov cl,%1                   ;Se asigna a CL el especificador de inicio
        add cl,30h                  ;Se ajusta a caracter ASCII

        ;-----------Bucle que recorre el letra la lista de palabras------------
        encontrar:
            cmp byte[eax],cl        ;Compara con el especificador de inicio
            je preProceso           ;El carácter coincide 
            inc eax                 ;Incrementa EAX
        jmp encontrar

        ;------------Alista algunos registros antes de continuar---------------
        preProceso:
            mov esi,palabra
            mov edi,0
            add cl,1
            mov edx,0
            add eax,1

        ;-----------Bucle que lee las letras que forman la palabra------------
        lectura:
            cmp byte[eax],cl
            je asignar

            mov bl,byte[eax]
            mov [esi],bl
            inc esi
            inc edi
            inc eax
            inc edx
        jmp lectura

        ;--------------------Asigna el tamaño a longitud-----------------------
        asignar:
            mov [longitud],edx

    %endmacro

    %macro imprimirNumeros 1
    mov ecx,%1
    mov eax,0
    mov ebx,0
    primerBucle:
        inc eax
        cmp eax,11
        je aumento
        loop primerBucle
    
    jmp asignacion

    aumento:
        inc ebx
        mov eax,0
        jmp primerBucle

    asignacion:
        add eax,30h
        add ebx,30h
        mov [var1],eax
        mov [var2],ebx

    %endmacro


section .bss
    entrada resb 1
    idarchivo resd 1
    contenido resb 400
    val resb 4

section .text

 


