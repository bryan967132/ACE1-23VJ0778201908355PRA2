*Universidad de San Carlos de Guatemala*  
*Facultad de Ingenieria*  
*Escuela de Ciencias y Sistemas*  
*Arquitectura de Computadores y Ensambladores 1, 2023.*  
___
## **PROYECTO 1**
___
**201908355 - Danny Hugo Bryan Tejaxún Pichiyá**
___
# Manual De Usuario

## Ventanas Principales
### Encabezado
![Secuencia_inical](./Images/Encabezado.png "Encabezado")
### Menú Principal
Para navegar entre las diferentes opciones del menú es necesario presionar el número de la opción a la que se desea ingresar.  
![Secuencia_inical](./Images/MenuP.png "Encabezado")
### Menú Productos
Para navegar entre las diferentes opciones del menú es necesario presionar el número de la opción a la que se desea ingresar.  
![Secuencia_inical](./Images/MenuProd.png "Encabezado")
* #### Ingresar Producto
Los nuevos productos deberán ser ingresados con los siguientes campos:  
![Secuencia_inical](./Images/NuevoProd.png "Encabezado")
* #### Ver Productos
Los productos guardados se podrán visualizar en grupos de 5 productos para un mejor manejo. Para seguir avanzando se requiere presionar la tecla *enter* o para salir de la visualización presionar la tecla *q*.  
![Secuencia_inical](./Images/VerProductos.png "Encabezado")
* #### Eliminar Producto
### Menú Ventas
Para navegar entre las diferentes opciones del menú es necesario presionar el número de la opción a la que se desea ingresar.  
![Secuencia_inical](./Images/MenuVent.png "Encabezado")
### Menú Herramientas
Para navegar entre las diferentes opciones del menú es necesario presionar el número de la opción a la que se desea ingresar.  
![Secuencia_inical](./Images/MenuHerr.png "Encabezado")
___
# Manual Técnico
## Macros Principales
### Leer Caracter
Su función es detectar cuando se presiona una tecla y guarda el código ASCII de la tecla en AL.
```js
; --- LEER CARACTER
leerCaracter macro
	mov AH, 08
	int 21
endm
```
### Leer Entrada
Lee una entrada por teclado y lo almacena en el buffer que se le indique.
```js
; --- LEER ENTRADA POR TECLADO
leerEntrada macro buffer
	mov DX, offset buffer
	mov AH, 0a
	int 21
endm
```
### Longitud Cadena
Determina la longitud de una cadena de caracteres y almacena la longitud en AL.
```js
; --- LONGITUD CADENA
lenCadena macro buffer
	mov DI, offset buffer
	inc DI
	mov AL, [DI]
endm
```
### Guardar Campos De Producto
Guarda lo almacenado en el buffer de entrada en una etiqueta destinada para ese fin específico.
```js
; --- ACEPTAR CAMPO Y GUARDAR EN ESTRUCTURA
aceptarCampoYGuardar macro campo, buffer
	local aceptarCampo, copiarCampoAEstructura
	aceptarCampo:
		mov SI, offset campo
		mov DI, offset buffer
		inc DI
		mov CH, 00
		mov CL, [DI]
		inc DI                   ; CONTENIDO EN EL BUFFER
	copiarCampoAEstructura:
		mov AL, [DI]
		mov [SI], AL
		inc SI
		inc DI
		loop copiarCampoAEstructura
endm
```
### Abrir Archivo
Intenta abrir el archivo, en caso de que no exista lo crea y posteriormente lo abre, de lo contrario lo abre directamente.
```js
abrirArchivo macro archivo
	local crearArchivo, terminate
		; INTENTAR ABRIR EL ARCHIVO NORMALMENTE
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo
		int 21
		; SI NO EXISTE LO CREAMOS
		jc crearArchivo
		; SI EXISTE SALIMOS
		jmp terminate
	crearArchivo:
		mov CX, 0000
		mov DX, offset archivo
		mov AH, 3c
		int 21
		; ARCHIVO ABIERTO
	terminate:
endm
```
### Escribir Producto Al Final Del Archivo
Posiciona el puntero del archivo en el final y escribe el producto que fue ingresado previamente.
```js
escribirAlFinalArchivoProducto macro handle, campo, numeros
	mov [handle], AX            ; GUARDAR HANDLE
	mov BX, [handle]            ; OBTENER HANDLE
	; IR AL FINAL DEL ARCHIVO
	mov CX, 00
	mov DX, 00
	mov AL, 02
	mov AH, 42
	int 21
	; ESCRIBIR EN EL ARCHIVO
	mov CX, 26
	mov DX, offset campo
	mov AH, 40
	int 21
	; ESCRIBIR EN EL ARCHIVO LOS DATOS NUMÉRICOS
	mov CX, 04
	mov DX, offset numeros
	mov AH, 40
	int 21
endm
```
### Cerrar Archivo
Cierra el archivo abierto previamente.
```js
cerrarArchivo macro
	mov AH, 3e
	int 21
endm
```
### Parsear Cadena A Número
Convierte una cadena numérica a un número, usando la lógica del sistema de numeración posicional decimal (base 10).
```js
parseNum macro numero, cadena
	local convertir, terminate
		mov DI, offset cadena
		mov AX, 0000              ; INICIALIZAR LA SALIDA
		mov CX, 0005
	convertir:
		mov BL, [DI]
		cmp BL, 00
		je terminate
		sub BL, 30                ; BL VALOR NUMÉRICO DEL CARACTER
		mov DX, 000a              ; DX VALOR 10 (000A)
		mul DX                    ; AX * DX : SIEMPRE MUL MULTIPLICA EL OPERANDO POR AX
		mov BH, 00
		add AX, BX                ; AX += BX
		inc DI                    ; AVANZA PUNTERO EN LA CADENA
		loop convertir
	terminate:
		mov [numero], AX
endm
```
### Parsear Número A Cadena
Convierte un número a una cadena de caracteres. Utiliza el sistema de numeración posicional decimal para convertir dígito por dígito a una cadena.
```js
parseCad macro cadena, numero
	local ciclo, cicloConvertir, aumentos, aumentarSiguiente, terminate
		mov AX, [numero]
		mov CX, 0005              ; INICIALIZAR CONTADOR
		mov DI, offset cadena
	ciclo:
		mov BL, 30 
		mov [DI], BL
		inc DI
		loop ciclo
		; TENEMOS '0' EN TODA LA CADENA
		mov CX, AX                ; INICIALIZAR CONTADOR
		mov DI, offset cadena
		add DI, 0004
		;;
	cicloConvertir:
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentos
		loop cicloConvertir
		jmp terminate
	aumentos:
		push DI
	aumentarSiguiente:
		mov BL, 30                ; PONER EN '0' EL ACTUAL
		mov [DI], BL
		dec DI
		mov BL, [DI]
		inc BL
		mov [DI], BL
		cmp BL, 3a
		je aumentarSiguiente
		pop DI
		loop cicloConvertir
	terminate:
endm
```
### Obtener Campo Producto
Obtiene un campo leido de un archivo, en este caso se utilizó exclusivamente para los campos de los productos.
```js
obtenerCampo macro campo
	local ciclo, ponerDolar
		mov DI, offset campo
	ciclo:
		mov AL, [DI]
		cmp AL, 00
		je ponerDolar
		inc DI
		jmp ciclo
	ponerDolar:
		mov AL, 24 ;; DÓLAR
		mov [DI], AL
endm
```
### Imprimir Producto
Imprime los campos necesarios obtenidos de un producto. Se usaron macros previamente creados de forma conjunta.
```js
imprimirProducto macro codigo, descripcion
	obtenerCampo codigo
	print codigo
	print guion
	obtenerCampo descripcion
	println descripcion
endm
```
### Memset
Limpia la memoria de determinada etiqueta o campo con una longitud específica.
```js
memset macro campo, longitud
	local ciclo, terminate
		mov DI, offset campo
		mov CX, longitud
	ciclo:
		mov AL, 00
		mov [DI], AL
		inc DI
		loop ciclo
endm
```
### Comparación De Cadenas
Compara dos cadenas y almacena el resultado (falso = 00 ó verdadero = 0ff) en DL.
```js
igualesCad macro cadena1, cadena2, tam
	local ciclo
		mov SI, offset cadena1
		mov DI, offset cadena2
		mov CX, tam
	ciclo:
		mov AL, [SI]
		cmp [DI], AL
		jne no_son_iguales
		inc DI
		inc SI
		loop ciclo
		mov DL, 0ff
		ret
	no_son_iguales:
		mov DL, 00
		ret
endm
```