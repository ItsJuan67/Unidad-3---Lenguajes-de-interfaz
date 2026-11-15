; 03 - Práctica SIZEOF
; Leer un nombre desde teclado usando SIZEOF para limitar el buffer
; y mostrar cuántos caracteres se escribieron (ReadString deja el conteo en EAX)

INCLUDE Irvine32.inc

.data
    mensajeEntrada BYTE "Escribe tu nombre: ",0
    caracteresEscritos BYTE "Numero de caracteres: ",0
    nombre BYTE 20 DUP(0)           ;duplicate duplicar los numeros dentro del tamaño que tenemos de informacion, este caso llaman al buffer



.code
main PROC
    mov edx, OFFSET mensajeEntrada
    call WriteString


    mov edx, OFFSET nombre      ;Direccion hacia donde va a apuntar el primer caracter
    mov ecx, SIZEOF nombre      ;sizeof da el numero de caracteres que se almacenan en la etiqueta

    call ReadString ;ReadString para ver lo que esta escrito en el buffer
    call Crlf

    mov edx, OFFSET nombre
    call WriteString
    call Crlf
    mov edx, OFFSET caracteresEscritos
    call WriteString
    call WriteDec               ;muestra EAX = numero de caracteres leidos



    exit
main ENDP

END main
