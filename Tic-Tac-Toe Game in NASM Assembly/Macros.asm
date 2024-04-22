
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

    %macro leerString 0
        mov     rax, 0
        mov     rdi, 0
        mov     rsi, text
        syscall
        mov eax, text  
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

    ;----------Macro para posicionar
    %macro posicionar 2        ;Formato[entrada][turno]  "1"
        mov eax, %1
        mov ecx,3
        xor ebx,ebx
        xor edx,edx
        mov bl, byte[eax]

        obtener2:
            mov dl, byte[eax]
            inc eax
        loop obtener2

        formula:
        sub bl, 30h
        sub dl, 30h

        cmp bl,2
        jg invalida

        cmp dl,2
        jg invalida


        mov cl,bl
        add dl,bl
        add bl,bl
        add bl,dl
        add bl,cl
        inc bl                   


        ;Se prepara para recorrer la matriz
        mov ecx,ebx
        mov edx,matriz
        
        buscar:
        inc edx
        loop buscar

        dec edx               

        ;manejo de "errores"
        cmp byte[edx], " "
        jne invalida

        cmp byte[edx], '#'
        je posicionInvalida 
        jmp revisarTurno

        posicionInvalida:
        inc edx

        revisarTurno:
        mov eax, %2
        cmp eax,0
        je turno0
        mov byte[edx], 'o'
        mov eax, 'o'
        mov eax, 0
        mov [turno],eax

        
        
        jmp terminar

        invalida:
        imprimir error, lenError
        leer 1
        jmp terminar

        turno0:
        mov byte[edx], 'x'
        mov eax, 'x'
        mov eax, 1
        mov [turno],eax
        
        jmp terminar
        

        terminar:
    %endmacro

    text        times 255 db 0
    error db "¡Ingrese las coordenadas de un espacio en blanco!"
    lenError equ $-error

section .bss
    pos resb 1
    entrada resb 1
    idarchivo resd 1
    contenido resb 400
    val resb 4


section .text

 


