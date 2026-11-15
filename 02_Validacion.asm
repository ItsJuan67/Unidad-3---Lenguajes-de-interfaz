; 02 - Práctica VALIDACION
; Validar si una entrada está vacía usando un procedimiento (ECX = longitud)

INCLUDE Irvine32.inc

.data
    mensajeVacia BYTE "Entrada vacia", 0
    mensajeNoVacia BYTE "Entrada no vacia", 0

.code

main PROC

    ; PRUEBA 1: ECX = 0
    mov ecx, 0
    call ValidarNoVacia

    test eax, eax
    jz entradaInvalida

    ; Si no esta vacia
    mov edx, OFFSET mensajeNoVacia
    call WriteString
    call Crlf

    jmp segundaPrueba

entradaInvalida:
    mov edx, OFFSET mensajeVacia
    call WriteString
    call Crlf

segundaPrueba:

    ; PRUEBA 2: ECX = 7
    mov ecx, 7
    call ValidarNoVacia

    test eax, eax
    jz entradaInvalida2

    mov edx, OFFSET mensajeNoVacia
    call WriteString
    call Crlf

    jmp finalizar

entradaInvalida2:
    mov edx, OFFSET mensajeVacia
    call WriteString
    call Crlf

finalizar:
    exit

main ENDP


;----------------------------------------
; PROCEDIMIENTO: ValidarNoVacia
; Entrada: ECX
; Salida: EAX
; EAX = 0 -> Entrada vacia
; EAX = 1 -> Entrada no vacia
;----------------------------------------

ValidarNoVacia PROC

    mov eax, 1

    cmp ecx, 0
    jne entradaValida

    mov eax, 0

entradaValida:
    ret

ValidarNoVacia ENDP

END main
