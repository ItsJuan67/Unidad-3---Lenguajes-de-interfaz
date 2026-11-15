# Unidad 3 - Lenguajes de Interfaz


- **Materia:** Lenguajes de Interfaz
- **Unidad:** 3
- **Alumno:** Juan Ramon Romero Adrian
- **Horario:** 8 a 9
- **Docente:** Dr. José Luis Medina Jiménez

## Índice de prácticas

| Práctica | Nombre | Archivos |
| --- | --- | --- |
| 1 | Procedimientos | [Código](01_Procedimientos.asm) |
| 2 | Validación con procedimiento | [Código](02_Validacion.asm) |
| 3 | Operador SIZEOF | [Código](03_SIZEOF.asm) |
| 4 | Manejo de pilas (paso de parámetros) | [Código](04_Manejo_Pilas.asm) |
| 5 | Macros | [Código](05_Macros.asm) |

> Todos los programas usan la biblioteca **Irvine32** (`INCLUDE Irvine32.inc`) y se ensamblan con MASM en Visual Studio.

---

## 1. Procedimientos — `01_Procedimientos.asm`

**Qué hace:** muestra un mensaje de inicio, llama dos veces al procedimiento `MostrarAviso` (con `CALL`) y al final muestra un mensaje de fin. `MostrarAviso` imprime *"Estoy dentro del procedimiento"* y regresa con `RET` al punto donde se hizo el `CALL`.

**Qué se comprobó al ejecutarlo:**
- La salida aparece en este orden: `Inicio del programa` → `Estoy dentro del procedimiento` (2 veces) → `Fin del programa`.
- Después de cada `RET` la ejecución continúa en la instrucción siguiente al `CALL` (se ve con los valores de `EAX` = 10, 20 y 30 en el depurador).

## 2. Validación — `02_Validacion.asm`

**Qué hace:** el procedimiento `ValidarNoVacia` recibe una longitud en `ECX` y regresa en `EAX` un `0` si la entrada está vacía o un `1` si no lo está. El programa principal hace dos pruebas y usa `TEST` + `JZ` para decidir qué mensaje mostrar.

**Qué se comprobó al ejecutarlo:**
- Prueba 1 (`ECX = 0`): `EAX` regresa en 0 y se muestra `Entrada vacia`.
- Prueba 2 (`ECX = 7`): `EAX` regresa en 1 y se muestra `Entrada no vacia`.

## 3. SIZEOF — `03_SIZEOF.asm`

**Qué hace:** pide el nombre del usuario y lo lee con `ReadString` en un buffer de 20 bytes (`nombre BYTE 20 DUP(0)`). Con `SIZEOF nombre` se le indica a `ReadString` el tamaño máximo del buffer. Después vuelve a mostrar el nombre y el número de caracteres escritos, que `ReadString` deja en `EAX` y se imprime con `WriteDec`.

**Qué se comprobó al ejecutarlo:**
- El nombre capturado se despliega igual a como se escribió.
- El conteo de caracteres corresponde a la longitud del nombre (por ejemplo, `Juan` → `4`).
- `SIZEOF nombre` vale 20, por lo que la lectura no se sale del buffer.

## 4. Manejo de pilas — `04_Manejo_Pilas.asm`

**Qué hace:** pasa dos parámetros por la pila (`PUSH 3` y `PUSH 25`) al procedimiento `SumarPila`. Dentro se arma el marco de pila con `EBP`, se leen los parámetros en `[ebp+8]` y `[ebp+12]`, se multiplican con `IMUL` (resultado en `EAX`), se preserva `EBX` con `PUSH`/`POP` y se limpia la pila con `RET 8`.

**Qué se comprobó al ejecutarlo (en el depurador):**
- Al regresar del `CALL`, `EAX = 75` (25 × 3).
- `EBX` conserva su valor original `999`, porque el procedimiento lo guarda y lo restaura.
- `ESP` queda igual que antes de los `PUSH`, gracias a `RET 8` (se sacan 2 parámetros de 4 bytes).

## 5. Macros — `05_Macros.asm`

**Qué hace:** define dos macros con parámetros: `MostrarMensaje texto` (imprime una cadena con salto de línea) y `Multiplicar op1, op2` (multiplica con `IMUL` y muestra el resultado con `WriteInt`). En `main` se usan para mostrar los mensajes de bienvenida y despedida y para multiplicar 5 × 6.

**Qué se comprobó al ejecutarlo:**
- Se muestran `Bienvenido al sistema` y `Hasta luego, vuelva pronto`.
- La macro `Multiplicar 5, 6` imprime `+30`.
- Cada llamada a una macro se expande en el código en el lugar donde se usa (a diferencia de un procedimiento, no hay `CALL`/`RET`).
