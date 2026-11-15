; 04 - Práctica MANEJO DE PILAS
; Pasar parámetros a un procedimiento por medio de la pila (stack frame con EBP)
; El procedimiento lee los dos parámetros, los multiplica (resultado en EAX),
; conserva el valor original de EBX y limpia la pila con RET 8.

INCLUDE Irvine32.inc

.data

.code

main PROC
    mov ebx, 999        ; valor de EBX que debe conservarse despues del CALL

    push 3              ; segundo parametro -> [ebp+12]
    push 25             ; primer parametro  -> [ebp+8]

    call SumarPila      ; al regresar: EAX = 25 * 3 = 75, EBX = 999
    nop ; REVERSO DEL CALL SUMARPILA
    exit

main ENDP

SumarPila PROC
push ebp                ; guarda el EBP del llamador
mov ebp, esp            ; EBP apunta al marco de pila actual

push ebx                ; preserva EBX

mov eax, [ebp+8]        ; EAX = primer parametro (25)
mov ebx, [ebp+12]       ; EBX = segundo parametro (3)

imul eax, ebx           ; EAX = EAX * EBX

pop ebx                 ; restaura EBX (999)
pop ebp                 ; restaura EBP

ret 8                   ; regresa y saca de la pila los 2 parametros (2 x 4 bytes)

SumarPila ENDP

END main
