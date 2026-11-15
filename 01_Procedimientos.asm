; 01 - Práctica PROCEDIMIENTO
; Desplegar mensajes dentro y fuera de un procedimiento

INCLUDE Irvine32.inc

.data
mensajeInicio        BYTE "Inicio del programa",0
mensajeProcedimiento BYTE "Estoy dentro del procedimiento",0
mensajeFin           BYTE "Fin del programa",0

.code
main PROC
    mov  edx, OFFSET mensajeInicio
    call WriteString
    call Crlf

    mov  eax, 10
    ; PRIMER LLAMADO
    call MostrarAviso

    mov  eax, 20
    ; SEGUNDO LLAMADO
    call MostrarAviso

    mov  eax, 30

    mov  edx, OFFSET mensajeFin
    call WriteString
    call Crlf

    exit
main ENDP

MostrarAviso PROC
    mov  edx, OFFSET mensajeProcedimiento
    call WriteString
    call Crlf
    ret                 ; regresa al punto donde se hizo el CALL
MostrarAviso ENDP

END main
