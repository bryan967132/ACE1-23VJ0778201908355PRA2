.MODEL SMALL
.RADIX 16
.STACK
.DATA
	; DATOS DE ENCABEZADO
	universidad				db				0ba, " Universidad de San Carlos de Guatemala         ", 0ba, "$"
	facultad  				db				0ba, " Facultad de Ingenieria                         ", 0ba, "$"
	escuela 				db				0ba, " Escuela de Vacaciones                          ", 0ba, "$"
	curso  					db				0ba, " Arquitectura de Computadoras y Ensambladores 1 ", 0ba, "$"
	nombre  				db				0ba, " Nombre: Danny Hugo Bryan Tejaxun Pichiya       ", 0ba, "$"
	carnet  				db				0ba, " Carne: 201908355                               ", 0ba, "$"
	; LÍNEAS
	line					db				0a, "$"
	cornUL					db				0c9, "$"
	cornDL					db				0c8, "$"
	middleL					db				0cc, "$"
	cornUR					db				0bb, "$"
	cornDR					db				0bc, "$"
	middleR					db				0b9, "$"
	lineL					db				30 dup (0cd), "$"
	; OPCIONES MENÚ PRINCIPAL
	tituloMenuP				db				0ba, " Menu Principal                                 ", 0ba,"$"
	tituloProductos			db				0ba, " 1. Productos                                   ", 0ba,"$"
	tituloVentas			db				0ba, " 2. Ventas                                      ", 0ba,"$"
	tituloHerramientas		db				0ba, " 3. Herramientas                                ", 0ba,"$"
	tituloSalir				db				0ba, " 4. Salir                                       ", 0ba,"$"
	;
.CODE
.STARTUP
main:
	; MACROS
	println macro text
		mov DX, offset text
		mov AH, 09
		int 21
		mov DX, offset line
		mov AH, 09
		int 21
	endm

	print macro text
		mov DX, offset text
		mov AH, 09
		int 21
	endm

	printLineM macro charL, charR
		mov DX, offset charL
		mov AH, 09
		int 21
		mov DX, offset lineL
		mov AH, 09
		int 21
		mov DX, offset charR
		mov AH, 09
		int 21
		mov DX, offset line
		mov AH, 09
		int 21
	endm

	imprimirEncabezado macro
		printLineM cornUL, cornUR
		println universidad
		println facultad
		println escuela
		println curso
		printLineM middleL, middleR
		println nombre
		println carnet
		printLineM cornDL, cornDR
	endm

	imprimirMenuPrincipal macro
		printLineM cornUL, cornUR
		println tituloMenuP
		println tituloProductos
		println tituloVentas
		println tituloHerramientas
		println tituloSalir
		printLineM cornDL, cornDR
	endm

	; PROGRAMA
	encabezado:
		imprimirEncabezado
	menuPrincipal:
		imprimirMenuPrincipal
		
.EXIT
END