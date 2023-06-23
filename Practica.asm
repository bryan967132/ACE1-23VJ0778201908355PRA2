.MODEL SMALL
.RADIX 16
.STACK
.DATA
	; LÍNEAS
	line                    db				0a, "$"
	cornUL                  db				0c9, "$"
	cornDL                  db				0c8, "$"
	middleL                 db				0cc, "$"
	cornUR                  db				0bb, "$"
	cornDR                  db				0bc, "$"
	middleR                 db				0b9, "$"
	lineL                   db				30 dup (0cd), "$"
	; PROMPT
	prompt                  db				"Seleccione una Opcion", "$"
	; FINALIZADO
	finalizado              db				0ad, "Finalizado!", "$"
	; DATOS DE ENCABEZADO
	universidad             db				0ba, " Universidad de San Carlos de Guatemala         ", 0ba, "$"
	facultad                db				0ba, " Facultad de Ingenieria                         ", 0ba, "$"
	escuela                 db				0ba, " Escuela de Vacaciones                          ", 0ba, "$"
	curso                   db				0ba, " Arquitectura de Computadoras y Ensambladores 1 ", 0ba, "$"
	nombre                  db				0ba, " Nombre: Danny Hugo Bryan Tejaxun Pichiya       ", 0ba, "$"
	carnet                  db				0ba, " Carne: 201908355                               ", 0ba, "$"
	; OPCIONES MENÚ PRINCIPAL
	tituloMenuP             db				0ba, "                 Menu Principal                 ", 0ba, "$"
	tituloProductos         db				0ba, " 1. Productos                                   ", 0ba, "$"
	tituloVentas            db				0ba, " 2. Ventas                                      ", 0ba, "$"
	tituloHerramientas      db				0ba, " 3. Herramientas                                ", 0ba, "$"
	tituloSalir             db				0ba, " 4. Salir                                       ", 0ba, "$"
	; OPCIONES MENÚ PRODUCTOS
	tituloMenuProductos     db				0ba, "                 Menu Productos                 ", 0ba, "$"
	tituloIngresoP          db				0ba, " 1. Ingresar Producto                           ", 0ba, "$"
	tituloVerP              db				0ba, " 2. Ver Productos                               ", 0ba, "$"
	tituloEliminarP         db				0ba, " 3. Eliminar Producto                           ", 0ba, "$"
	tituloVolverP           db				0ba, " 4. Volver                                      ", 0ba, "$"
	; OPCIONES MENÚ VENTAS
	tituloMenuVentas        db				0ba, "                  Menu Ventas                   ", 0ba, "$"
	tituloRealizarV         db				0ba, " 1. Realizar Venta                              ", 0ba, "$"
	tituloVolverV           db				0ba, " 2. Volver                                      ", 0ba, "$"
	; OPCIONES MENÚ HERRAMIENTAS
	tituloMenuHerramientasdb				0ba, "               Menu Herramientas                ", 0ba, "$"
	tituloCatalogoH         db				0ba, " 1. Generar Catalogo De Productos               ", 0ba, "$"
	tituloRepoAlfaH         db				0ba, " 2. Reporte Alfabetico De Productos             ", 0ba, "$"
	tituloRepoVenH          db				0ba, " 3. Reporte De Ventas                           ", 0ba, "$"
	tituloRepoAgotH         db				0ba, " 4. Reporte De Productos Agotados               ", 0ba, "$"
	tituloVolverH           db				0ba, " 5. Volver                                      ", 0ba, "$"
	; ARCHIVOS
	f_productos             db				"PROD.BIN", 00
	f_ventas                db				"VENT.BIN", 00
	f_repcatalogo           db				"CATALG.HTM", 00
	f_repalfabetico         db				"ABC.HTM", 00
	f_repventas             db				"REP.TXT", 00
	f_repfalta              db				"FALTA.HTM", 00
	; HANDLES
	h_productos             dw				0000
	h_ventas                dw				0000
	h_repcatalogo           dw				0000
	h_repalfabetico         dw				0000
	h_repventas             dw				0000
	h_repfalta              dw				0000
	; ESTRUCTURA PRODUCTO
	p_codigo                db				05 dup (0)
	p_nombre                db				05 dup (0)
	p_precio                db				05 dup (0)
	p_unidades              db				05 dup (0)
	n_price                 dw				0000
	n_units                 dw				0000
.CODE
.STARTUP
main:
	; MACROS

	; --- PRINTLN
	println macro text
		mov DX, offset text
		mov AH, 09
		int 21
		mov DX, offset line
		mov AH, 09
		int 21
	endm

	; --- PRINT
	print macro text
		mov DX, offset text
		mov AH, 09
		int 21
	endm

	; --- PRINTLINEM
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

	; --- IMPRIMIR ENCABEZADO
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

	; --- IMPRIMIR MENÚ PRINCIPAL
	imprimirMenuPrincipal macro
		printLineM cornUL, cornUR
		println tituloMenuP
		printLineM middleL, middleR
		println tituloProductos
		println tituloVentas
		println tituloHerramientas
		println tituloSalir
		printLineM cornDL, cornDR
		println prompt
		print line
	endm

	; --- IMPRIMIR MENÚ PRODUCTOS
	imprimirMenuProductos macro
		printLineM cornUL, cornUR
		println tituloMenuProductos
		printLineM middleL, middleR
		println tituloIngresoP
		println tituloVerP
		println tituloEliminarP
		println tituloVolverP
		printLineM cornDL, cornDR
		println prompt
		print line
	endm

	; --- IMPRIMIR MENÚ VENTAS
	imprimirMenuVentas macro
		printLineM cornUL, cornUR
		println tituloMenuVentas
		printLineM middleL, middleR
		println tituloRealizarV
		println tituloVolverV
		printLineM cornDL, cornDR
		println prompt
		print line
	endm

	; --- IMPRIMIR MENÚ HERRAMIENTAS
	imprimirMenuHerramientas macro
		printLineM cornUL, cornUR
		println tituloMenuHerramientas
		printLineM middleL, middleR
		println tituloCatalogoH
		println tituloRepoAlfaH
		println tituloRepoVenH
		println tituloRepoAgotH
		println tituloVolverH
		printLineM cornDL, cornDR
		println prompt
		print line
	endm

	leerCaracter macro
		mov AH, 08
		int 21
	endm

	; PROGRAMA
	encabezado:
		imprimirEncabezado

	; --- MENÚ PRINCIPAL
	menuPrincipal:
		imprimirMenuPrincipal
		leerCaracter
		cmp AL, 31 ; OPCION 1: PRODUCTOS
		je menuProductos
		cmp AL, 32 ; OPCION 2: VENTAS
		je menuVentas
		cmp AL, 33 ; OPCION 3: HERRAMIENTAS
		je menuHerramientas
		cmp AL, 34 ; OPCION 4: SALIR
		je terminate
		jmp menuPrincipal

	; --- MENÚ PRODUCTOS
	menuProductos:
		imprimirMenuProductos
		leerCaracter
		cmp AL, 31 ; OPCION 1: INGRESAR PRODUCTO
		cmp AL, 32 ; OPCION 2: VER PRODUCTOS
		cmp AL, 33 ; OPCION 3: ELIMINAR PRODUCTO
		cmp AL, 34 ; OPCION 4: VOLVER
		je menuPrincipal
		jmp menuProductos

	; --- MENÚ VENTAS
	menuVentas:
		imprimirMenuVentas
		leerCaracter
		cmp AL, 31 ; OPCION 1: REALIZAR VENTA
		cmp AL, 32 ; OPCION 2: VOLVER
		je menuPrincipal
		jmp menuVentas

	; --- MENÚ HERRAMIENTAS
	menuHerramientas:
		imprimirMenuHerramientas
		leerCaracter
		cmp AL, 31 ; OPCION 1: INGRESAR PRODUCTO
		cmp AL, 32 ; OPCION 2: VER PRODUCTOS
		cmp AL, 33 ; OPCION 3: ELIMINAR PRmenuHerramientasODUCTO
		cmp AL, 34 ; OPCION 4: VOLVER
		cmp AL, 35 ; OPCION 5: VOLVER
		je menuPrincipal
		jmp menuHerramientas
terminate:
	println finalizado
.EXIT
END