; 05 - Práctica MACROS
; Definir y usar macros con parámetros:
;   MostrarMensaje -> imprime una cadena y un salto de línea
;   Multiplicar    -> multiplica dos operandos e imprime el resultado (EAX)

INCLUDE Irvine32.inc

; Macro que despliega la cadena recibida como parametro
MostrarMensaje MACRO texto
    mov edx, OFFSET texto
    call WriteString
    call Crlf
ENDM

; Macro que multiplica op1 * op2 y muestra el resultado con signo
Multiplicar MACRO op1, op2
    mov eax, op1
    imul eax, op2
    call WriteInt
    call Crlf
ENDM

.data
    mensajeBienvenida BYTE "Bienvenido al sistema", 0
    mensajeFin BYTE "Hasta luego, vuelva pronto", 0

.code
main PROC
    MostrarMensaje mensajeBienvenida    ; se expande en mov/call WriteString/call Crlf
    MostrarMensaje mensajeFin

    Multiplicar 5, 6                    ; imprime +30

    exit
main ENDP

END main
