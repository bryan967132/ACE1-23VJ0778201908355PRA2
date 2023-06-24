.MODEL SMALL
.RADIX 16
.STACK
.DATA
	; CADENAS DE PRUEBA
	prueba                  db				"LLEGA AQUI", "$"
	; LÍNEAS
	guion                   db				" - ", "$"
	line                    db				0a, "$"
	cornUL                  db				0c9, "$"
	cornDL                  db				0c8, "$"
	middleL                 db				0cc, "$"
	cornUR                  db				0bb, "$"
	cornDR                  db				0bc, "$"
	middleR                 db				0b9, "$"
	lineL                   db				30 dup (0cd), "$"
	; REPORTE
	html                    db				"<html><body>", "$"
	html_f                  db				"</body></html>", "$"
	tabla                   db				"<table>", "$"
	tabla_f                 db				"</table>", "$"
	fila                    db				"<tr>", "$"
	fila_f                  db				"</tr>", "$"
	columna                 db				"<td>", "$"
	columna_f               db				"</td>", "$"
	; PROMPT
	prompt                  db				" Seleccione una Opcion", "$"
	; FINALIZADO
	finalizado              db				0ad, "Finalizado!", "$"
	; BUFFER
	buffer_entrada          db				21, 00
                            db				21 dup (0)
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
	tituloMenuHerramientas  db				0ba, "               Menu Herramientas                ", 0ba, "$"
	tituloCatalogoH         db				0ba, " 1. Generar Catalogo De Productos               ", 0ba, "$"
	tituloRepoAlfaH         db				0ba, " 2. Reporte Alfabetico De Productos             ", 0ba, "$"
	tituloRepoVenH          db				0ba, " 3. Reporte De Ventas                           ", 0ba, "$"
	tituloRepoAgotH         db				0ba, " 4. Reporte De Productos Agotados               ", 0ba, "$"
	tituloVolverH           db				0ba, " 5. Volver                                      ", 0ba, "$"
	; DATOS DE PRODUCTO
	tituloInsertar          db				" Insertar Producto", "$"
	tituloInsCod            db				" Codigo: ", "$"
	tituloInsDes            db				" Descripcion: ", "$"
	tituloInsPre            db				" Precio: ", "$"
	tituloInsUni            db				" Unidades: ", "$"
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
	p_descripcion           db				21 dup (0)
	p_precio                db				03 dup (0)
	p_unidades              db				03 dup (0)
	n_precio                dw				0000
	n_unidades              dw				0000
	c_numero                db				03 dup (30)
	p_codigo_temp           db				05 dup (0)
	puntero_temp            dw				0000
	p_borrado               db				02a dup (0)
	u_byte					db				01 dup (0)
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

	; --- LEER CARACTER
	leerCaracter macro
		mov AH, 08
		int 21
	endm

	; --- LEER ENTRADA POR TECLADO
	leerEntrada macro buffer
		mov DX, offset buffer
		mov AH, 0a
		int 21
	endm

	; --- LONGITUD CADENA
	lenCadena macro buffer
		mov DI, offset buffer
		inc DI
		mov AL, [DI]
	endm

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

	

	limpiarArchivoProductos macro
		local buscarDolar, borrarDolar, finalizarBorrar
			mov DX, 0000
			mov [puntero_temp], DX
			abrirArchivo f_productos
			mov [h_productos], AX
		buscarDolar:
			mov BX, [h_productos]
			mov CX, 01
			mov DX, offset p_codigo
			mov AH, 3f
			int 21
			cmp AX, 00
			je finalizarBorrar
			mov DX, [puntero_temp]
			add DX, 01
			mov [puntero_temp], DX
			;
			mov AL, 0000
			cmp [p_codigo], AL
			je buscarDolar
			; VALIDA QUE EL CÓDIGO INGRESADO COINCIDA CON ALGUNO GUARDADO
			cmp byte ptr p_codigo, 24
			je borrarDolar
			
			jmp buscarDolar
		borrarDolar:
			; POSICIONAR PUNTERO
			mov DX, [puntero_temp]
			sub DX, 01
			mov CX, 00
			mov BX, [h_productos]
			mov AL, 00
			mov AH, 42
			int 21
			; PUNTERO POSICIONADO
			mov CX, 01
			mov DX, offset u_byte
			mov AH, 40
			int 21
			jmp buscarDolar
		finalizarBorrar:
			mov BX, [h_productos]
			mov AH, 3e
			int 21
		jmp menuProductos
	endm

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

	escribirAlFinalArchivoProducto macro handle, campo, precio
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
		mov DX, offset precio
		mov AH, 40
		int 21
	endm

	cerrarArchivo macro
		mov AH, 3e
		int 21
	endm

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

	imprimirProductoT macro codigo, descripcion, precio, unidades
		obtenerCampo codigo
		print codigo
		print guion
		obtenerCampo descripcion
		print descripcion
		print guion
		parseCad c_numero, precio
		mov BX, 0001
		mov CX, 0005
		mov DX, offset c_numero
		inc DX
		inc DX
		inc DX
		mov AH, 40
		int 21
		;println p_precio
		;print guion
		;obtenerCampo p_unidades
		;println p_unidades
		print line
	endm
	imprimirProducto macro codigo, descripcion
		obtenerCampo codigo
		print codigo
		print guion
		obtenerCampo descripcion
		println descripcion
	endm

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

	igualesCad macro cadena1, cadena2, tam
		local ciclo, diferentes, terminate
			mov SI, offset cadena1
			mov DI, offset cadena2
			mov CX, tam
		ciclo:
			mov AL, [SI]
			cmp [DI], AL
			jne diferentes
			inc DI
			inc SI
			loop ciclo
			mov DL, 0ff
			jmp terminate
		diferentes:
			mov DL, 00
		terminate:
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
		je ingresoProducto
		cmp AL, 32 ; OPCION 2: VER PRODUCTOS
		je verProductos
		cmp AL, 33 ; OPCION 3: ELIMINAR PRODUCTO
		je eliminarProducto
		cmp AL, 34 ; OPCION 4: VOLVER
		je menuPrincipal
		jmp menuProductos
		; ****************************INGRESO DE PRODUCTO****************************
		ingresoProducto:
			println tituloInsertar
			; --------------------------CODIGO PRODUCTO---------------------------
			codigoProd:
				print tituloInsCod
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je codigoProd            ; SALTA SI AL = 00H
				cmp AL, 05               ; COMPARA AL Y 05H
				jb aceptaCodProd         ; SALTA SI AL < 05H
				print line
				jmp codigoProd
			aceptaCodProd:
				aceptarCampoYGuardar p_codigo, buffer_entrada
			; ------------------------DESCRIPCIÓN PRODUCTO------------------------
			print line
			descripcionProd:
				print tituloInsDes
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je descripcionProd       ; SALTA SI AL = 00H
				cmp AL, 21               ; COMPARA AL Y 21H
				jb aceptaDesProd         ; SALTA SI AL < 21H
				print line
				jmp descripcionProd
			aceptaDesProd:
				aceptarCampoYGuardar p_descripcion, buffer_entrada
			; --------------------------PRECIO PRODUCTO---------------------------
			print line
			precioProd:
				print tituloInsPre
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je precioProd            ; SALTA SI AL = 00H
				cmp AL, 03               ; COMPARA AL Y 03H
				jb aceptaPreProd         ; SALTA SI AL < 03H
				print line
				jmp precioProd
			aceptaPreProd:
				aceptarCampoYGuardar p_precio, buffer_entrada
				parseNum n_precio, p_precio
				memset p_precio, 03
				; parseNum n_precio, p_precio
			; -------------------------UNIDADES PRODUCTO--------------------------
			print line
			unidadesProd:
				print tituloInsUni
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je unidadesProd          ; SALTA SI AL = 00H
				cmp AL, 03               ; COMPARA AL Y 03H
				jb aceptaUniProd         ; SALTA SI AL < 03H
				print line
				jmp unidadesProd
			aceptaUniProd:
				aceptarCampoYGuardar p_unidades, buffer_entrada
				parseNum n_unidades, p_unidades
				memset p_unidades, 03
				; parseNum n_unidades, p_unidades
			; ----------------------MANEJO ARCHIVO PRODUCTO-----------------------
			abrirArchivo f_productos     ; ABRIR ARCHIVO SI EXISTE, SI NO EXISTE LO CREA Y ABRE
			escribirAlFinalArchivoProducto h_productos, p_codigo, n_precio
			cerrarArchivo
			memset p_codigo, 05
			memset p_descripcion, 21
			; ------------------------FIN INGRESO PRODUCTO------------------------
			print line
			print line
			limpiarArchivoProductos
			jmp menuProductos
		; *******************************VER PRODUCTO********************************
		verProductos:
			abrirArchivo f_productos
			mov [h_productos], AX
			; RECORRER EL ARCHIVO (LEER)
			mov SI, 00
			cicloVer:
				mov BX, [h_productos]
				mov CX, 02a
				mov DX, offset p_codigo
				mov AH, 3f
				int 21
				;
				cmp AX, 00                 ; COMPARA CANTIDAD DE BYTES LEIDOS
				je finVer                  ; SALTA SI LA CANTIDAD DE BYTES LEIDOS = 0
				;
				cmp byte ptr p_codigo, 00
				je cicloVer
				; ESCRIBIR PRODUCTO EN ESTRUCTURAS E IMPRIMIRLO
				inc SI
				imprimirProducto p_codigo, p_descripcion
				cmp SI, 05
				je validarSeguir
				memset p_codigo, 05
				memset p_descripcion, 21
				jmp cicloVer
			validarSeguir:
				leerCaracter
				cmp AL, 0d
				je seguirViendo
				cmp AL, 71
				je finVer
				jmp validarSeguir
			seguirViendo:
				print line
				mov SI, 00
				jmp cicloVer
			finVer:
				jmp menuProductos
			
		; *****************************ELIMINAR PRODUCTO*****************************
		eliminarProducto:
				mov DX, 0000
				mov [puntero_temp], DX
			codigoProdEl:
				print tituloInsCod
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je codigoProdEl          ; SALTA SI AL = 00H
				cmp AL, 05               ; COMPARA AL Y 05H
				jb aceptaCodProdEl       ; SALTA SI AL < 05H
				print line
				jmp codigoProdEl
			aceptaCodProdEl:
				aceptarCampoYGuardar p_codigo_temp, buffer_entrada
				abrirArchivo f_productos
				mov [h_productos], AX
			buscarProductoEl:
				mov BX, [h_productos]
				mov CX, 26
				mov DX, offset p_codigo
				mov AH, 3f
				int 21
				;
				mov BX, [h_productos]
				mov CX, 04
				mov DX, offset n_precio
				mov AH, 3f
				int 21
				;
				cmp AX, 00
				je finalizarBorrar    ; SI AX = 0 SALTA
				mov DX, [puntero_temp]
				add DX, 02a
				mov [puntero_temp], DX
				; VALIDA SI EL PRODUCTO ES VÁLIDO
				mov AL, 0000
				cmp [p_codigo], AL
				je buscarProductoEl
				; VALIDA QUE EL CÓDIGO INGRESADO COINCIDA CON ALGUNO GUARDADO
				igualesCad p_codigo_temp, p_codigo, 05 ; VALIDA COINCIDENCIA DE CADENAS, GUARDA RESULTADO EN DL
				; DL = 0FF : VERDADERO ; DL = 00 : FALSO
				cmp DL, 0ff           ; COMPARA DL
				je borrarEncontradoP
				jmp buscarProductoEl
			borrarEncontradoP:
				; POSICIONAR PUNTERO
				mov DX, [puntero_temp]
				sub DX, 02a
				mov CX, 00
				mov BX, [h_productos]
				mov AL, 00
				mov AH, 42
				int 21
				; PUNTERO POSICIONADO
				mov CX, 02a
				mov DX, offset p_borrado
				mov AH, 40
				int 21
			finalizarBorrar:
				mov BX, [h_productos]
				mov AH, 3e
				int 21
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
		cmp AL, 31 ; OPCION 1: GENERAR CATÁLOGO    HTM
		cmp AL, 32 ; OPCION 2: REPORTE ALFABÉTICO  HTM
		cmp AL, 33 ; OPCION 3: REPORTE DE VENTAS   TXT
		cmp AL, 34 ; OPCION 4: REPORTE DE AGOTADOS HTM
		cmp AL, 35 ; OPCION 5: VOLVER
		je menuPrincipal
		jmp menuHerramientas
terminate:
	println finalizado
.EXIT
END