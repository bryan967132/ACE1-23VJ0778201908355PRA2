.MODEL SMALL
.RADIX 16
.STACK
.DATA
	; BORRADO (CEROS)
	p_borrado               db				02a dup (0)
	; CADENAS DE PRUEBA
	prueba                  db				"LLEGA AQUI", "$"
	; LÍNEAS
	guion                   db				" - ", "$"
	line                    db				0a, "$"
	u_space                 db				" ", "$"
	cornUL                  db				0c9, "$"
	cornDL                  db				0c8, "$"
	middleL                 db				0cc, "$"
	cornUR                  db				0bb, "$"
	cornDR                  db				0bc, "$"
	middleR                 db				0b9, "$"
	lineL                   db				30 dup (0cd), "$"
	; BUFFER
	buffer_entrada          db				21, 00
                            db				21 dup (0)
	; REPORTE
	longitud_header_html    db				0a9
	longitud_close_html     db				0e
	longitud_init_tabla     db				38
	longitud_close_tabla    db				09
	html                    db				"<html><body>", 0a
	style                   db              "<style>table {border: 1px;border-color: rgb(0, 0, 0);}th {background-color: rgb(0, 200, 123);color: white;padding: 7px 10px;}td {padding: 7px 10px;}</style>"
	html_f                  db				"</body></html>"
	tabla                   db				"<table>", 0a, "<tr>", 0a, "<th>Codigo</th>", 0a, "<th>Descripcion</th>", 0a, "</tr>", 0a
	tabla_f                 db				"</table>", 0a
	fila                    db				"<tr>", 0a
	fila_f                  db				"</tr>", 0a
	columna                 db				"<td>"
	columna_f               db				"</td>", 0a
	; PROMPT
	prompt                  db				" Seleccione una Opcion", "$"
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
	tituloMenuHerramientas  db				0ba, "               Menu Herramientas                ", 0ba, "$"
	tituloCatalogoH         db				0ba, " 1. Generar Catalogo De Productos               ", 0ba, "$"
	tituloRepoAlfaH         db				0ba, " 2. Reporte Alfabetico De Productos             ", 0ba, "$"
	tituloRepoVenH          db				0ba, " 3. Reporte De Ventas                           ", 0ba, "$"
	tituloRepoAgotH         db				0ba, " 4. Reporte De Productos Agotados               ", 0ba, "$"
	tituloVolverH           db				0ba, " 5. Volver                                      ", 0ba, "$"
	; DATOS DE PRODUCTO
	tituloInsertar          db				" ", 0b dup (0c4), " Insertar Nuevo Producto ",     0c dup (0c4), "$"
	tituloInsertar_f        db				" ", 09 dup (0c4), " Fin Insertar Nuevo Producto ", 0a dup (0c4), "$"
	tituloVer               db				" ", 0e dup (0c4), " Lista De Productos ",          0e dup (0c4), "$"
	tituloVer_f             db				" ", 0c dup (0c4), " Fin Lista De Productos ",      0c dup (0c4), "$"
	tituloEliminar          db				" ", 0e dup (0c4), " Eliminar Productos ",          0e dup (0c4), "$"
	tituloEliminar_f        db				" ", 0c dup (0c4), " Fin Eliminar Productos ",      0c dup (0c4), "$"
	tituloInsCod            db				" Codigo: ", "$"
	tituloInsDes            db				" Descripcion: ", "$"
	tituloInsPre            db				" Precio: ", "$"
	tituloInsUni            db				" Unidades: ", "$"
	yaExisteCodigo          db				" Ya Existe El Producto", "$"
	noExisteCodigo          db				" No Existe El Producto", "$"
	; DATOS DE VENTA
	tituloVender            db				" ", 11 dup (0c4), " Nueva Venta ",     12 dup (0c4), "$"
	tituloVender_f          db				" ", 0f dup (0c4), " Fin Nueva Venta ", 10 dup (0c4), "$"
	tituloVenCan            db				" Cantidad de Productos (10 Maximo): ", "$"
	tituloVenCod            db				" Codigo: ", "$"
	tituloVenUni            db				" Unidades: ", "$"
	tituloVendido           db				" Producto Vendido", "$"
	c_FIN                   db				"fin"
	; VALIDACIÓN
	charInvalidos           db				" Caracteres Invalidos                               ", "$"
	; ARCHIVOS
	f_conf                  db				"PRAII.CON", 00
	f_productos             db				"PROD.BIN", 00
	f_ventas                db				"VENT.BIN", 00
	f_repcatalogo           db				"CATALG.HTM", 00
	f_repalfabetico         db				"ABC.HTM", 00
	f_repventas             db				"REP.TXT", 00
	f_repfalta              db				"FALTA.HTM", 00
	generado                db				" Reporte Generado                              ", "$"
	; HANDLES
	h_productos             dw				0000
	h_ventas                dw				0000
	h_reportes              dw				0000
	h_conf                  dw				0000
	; ESTRUCTURA PRODUCTO
	p_codigo                db				05 dup (0)
	p_descripcion           db				21 dup (0)
	p_precio                db				03 dup (0)
	p_unidades              db				03 dup (0)
	n_precio                dw				0000
	n_unidades              dw				0000
	c_numero                db				03 dup (30)
	p_codigo_temp           db				05 dup (0)
	p_codigo_temp2          db				05 dup (0)
	puntero_temp            dw				0000
	u_byte					db				01 dup (0)
	; ESTRUCTURA VENTA
	v_items                 db				02 dup (0)
	v_codigo                db				05 dup (0)
	v_unidades              db				03 dup (0)
	n_items                 dw				0000
	; LOGIN
	loginFalla              db				"Credenciales Incorrectas", "$"
	archivoConfError        db				"No Se Encontro Archivo De Configuracion", "$"
	estado                  db				00
	buffer_linea            db				0ff dup (0)
	longitud_linea_leida    db				00
	usuario_c               db				08 dup (0)
	clave_c                 db				09 dup (0)
	TOK_cred                db				"[credenciales]"
	TOK_usuario             db				"usuario"
	TOK_clave               db				"clave"
	usuario                 db				"dpichiya"
	clave                   db				"201908355"
.CODE
.STARTUP
main:
; ******************************************************************************************************************
; ***************************************************** MACROS *****************************************************
; ******************************************************************************************************************
	; -------------------------------------- PRINT ---------------------------------------
	print macro text
		mov DX, offset u_space
		mov AH, 09
		int 21
		mov DX, offset text
		mov AH, 09
		int 21
	endm
	; ------------------------------------- PRINTLN --------------------------------------
	println macro text
		print text
		mov DX, offset line
		mov AH, 09
		int 21
	endm
	; ------------------------------------ PRINTLINEM ------------------------------------
	printLineM macro charL, charR
		print charL
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
	; ------------------------------- IMPRIMIR ENCABEZADO --------------------------------
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
	; ----------------------------- IMPRIMIR MENÚ PRINCIPAL ------------------------------
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
	; ----------------------------- IMPRIMIR MENÚ PRODUCTOS ------------------------------
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
	; ------------------------------- IMPRIMIR MENÚ VENTAS -------------------------------
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
	; ---------------------------- IMPRIMIR MENÚ HERRAMIENTAS ----------------------------
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
	; ---------------------------------- LEER CARACTER -----------------------------------
	leerCaracter macro
		mov AH, 08
		int 21
	endm
	; ----------------------------- LEER ENTRADA POR TECLADO -----------------------------
	leerEntrada macro buffer
		mov DX, offset buffer
		mov AH, 0a
		int 21
	endm
	; --------------------------------- LONGITUD CADENA ----------------------------------
	lenCadena macro buffer
		mov DI, offset buffer
		inc DI
		mov AL, [DI]
	endm
	; ------------------------------ COMPARACIÓN DE CADENAS ------------------------------
	strcmp macro cadena1, cadena2, tam
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
			mov AL, 0ff
			jmp terminate
		diferentes:
			mov AL, 00
		terminate:
	endm
	;------------------ PARSEO DE CONTENIDO DE ARCHIVO DE CONFIGURACIÓN-------------------
	parseConf macro
        local loginFallido, loginExitoso, evaluarLxL, evaluarLinea, retornoCarro, verificarEstado, verificarTagCredenciales, credsEncontrado, verificarTagUsuarioOClave, usuarioEncontrado, espacios1, espacios2, guardarUsuario, cicloGuardarUsuario, claveEncontrado, espacios3, espacios4, guardarClave, cicloGuardarClave, terminate
            ; ABRIR ARCHIVO DE CONFIGURACION
            abrirArchivo f_conf
            jc loginFallido
            mov [h_conf], AX
        evaluarLxL:
            mov DI, offset buffer_linea
            mov AL, 00                ; ASIGNACION DE ESTADO INICIAL AUTOMATA
            mov [longitud_linea_leida], AL
        evaluarLinea:
            mov BX, [h_conf]
            mov AH, 3f
            mov CX, 01                ; CX = CANTIDAD DE BYTES A LEER
            mov DX, DI
            int 21
            cmp CX, 00                ; CX = BYTES LEIDOS
            je verificarEstado        ; SALTA AL FINAL SI LEYÓ CERO BYTES
            ; VALIDACIÓN CARACTER LEIDO
            mov AL, [DI]              ; AL = CARACTER LEIDO
            cmp AL, 0d                ; COMPARA AL CON RETORNO DE CARRO
            je retornoCarro           ; SALTA SI AL = 0D
            cmp AL, 0a                ; COMPARA AL CON SALTO DE LINEA
            je verificarEstado        ; SALTA SI AL = 0A
            ; INCREMENTAR LA LONGITUD DE LA LÍNEA LEIDA
            mov AL, [longitud_linea_leida]
            inc AL
            mov [longitud_linea_leida], AL
            inc DI
            jmp evaluarLinea
        retornoCarro:
            inc DI
            jmp evaluarLinea
        verificarEstado:
            mov AL, 00                   ; AL = ESTADO 0
            cmp AL, [estado]             ; COMPARA AL CON ESTADO ACTUAL DEL AUTOMATA
            je verificarTagCredenciales  ; SALTA PARA VERIFICAR SI SE ENCONTRÓ [CREDENCIALES]
            mov AL, 01                   ; AL = ESTADO 1
            cmp AL, [estado]             ; COMPARA AL CON ESTADO ACTUAL DEL AUTOMATA
            je verificarTagUsuarioOClave ; SALTA PARA VERIFICAR SI SE ENCONTRÓ CLAVE O USUARIO
            mov AL, 02                   ; AL = ESTADO 2
            cmp AL, [estado]             ; COMPARA AL CON ESTADO ACTUAL DEL AUTOMATA
            je verificarTagUsuarioOClave ; SALTA PARA VERIFICAR SI SE ENCONTRÓ CLAVE O USUARIO
            jmp loginExitoso             ; SALTA PARA VALIDAR LAS CREDENCIALES CAPTURADAS
        verificarTagCredenciales:
            mov CH, 00
            mov CL, [TOK_cred]
            strcmp buffer_linea, TOK_cred, 0e  ; COMPARACION DE CADENAS: RESULTADO EN AL
            cmp AL, 0ff
            je credsEncontrado
            mov DI, offset buffer_linea
            jmp loginFallido
        credsEncontrado:
            ; INCREMENTAR EL NÚMERO DE ESTADO DEL AUTÓMATA
            mov AL, [estado]
            inc AL
            mov [estado], AL
            mov DI, offset buffer_linea
            jmp evaluarLinea
        verificarTagUsuarioOClave:
            ; VALIDACIÓN PARA PALABRA RESERVADA USUARIO
            mov CH, 00
            mov CL, [TOK_usuario]
            strcmp buffer_linea, TOK_usuario, 07  ; COMPARACION DE CADENAS: RESULTADO EN AL
            cmp AL, 0ff
            je usuarioEncontrado
            ; VALIDACIÓN PARA PALABRA RESERVADA CLAVE
            mov CH, 00
            mov CL, [TOK_clave]
            strcmp buffer_linea, TOK_clave, 05  ; COMPARACION DE CADENAS: RESULTADO EN AL
            cmp AL, 0ff
            je claveEncontrado
            mov DI, offset buffer_linea
            jmp loginFallido
        usuarioEncontrado:
        espacios1:
            mov AL, [SI]
            inc SI
            cmp AL, 20
            je espacios1
            cmp AL, 3d
            je espacios2
            mov DI, offset buffer_linea
            jmp loginFallido
        espacios2:
            mov AL, [SI]
            inc SI
            cmp AL, 20
            je espacios2
            cmp AL, 22
            je guardarUsuario
            mov DI, offset buffer_linea
            jmp loginFallido
        guardarUsuario:
            mov DI, offset usuario_c
        cicloGuardarUsuario:
            mov AL, [SI]
            mov [DI], AL
            inc SI
            inc DI
            cmp AL, 22
            jne cicloGuardarUsuario
            ; INCREMENTAR EL NÚMERO DE ESTADO DEL AUTÓMATA
            mov AL, [estado]
            inc AL
            mov [estado], AL
            mov DI, offset buffer_linea
            jmp evaluarLinea
        claveEncontrado:
        espacios3:
            mov AL, [SI]
            inc SI
            cmp AL, 20
            je espacios3
            cmp AL, 3d
            je espacios4
            mov DI, offset buffer_linea
            jmp loginFallido
        espacios4:
            mov AL, [SI]
            inc SI
            cmp AL, 20
            je espacios4
            cmp AL, 22
            je guardarClave
            mov DI, offset buffer_linea
            jmp loginFallido
        guardarClave:
            mov DI, offset clave_c
        cicloGuardarClave:
            mov AL, [SI]
            mov [DI], AL
            inc SI
            inc DI
            cmp AL, 22
            jne cicloGuardarClave
            ; INCREMENTAR EL NÚMERO DE ESTADO DEL AUTÓMATA
            mov AL, [estado]
            inc AL
            mov [estado], AL
            mov DI, offset buffer_linea
            jmp evaluarLinea
        loginFallido:
			mov AL, 00
            jmp terminate
        loginExitoso:
			mov AL, 0ff
        terminate:
    endm
	; -------------------------------------- MEMCPY --------------------------------------
	memcpy macro campo, buffer
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
	; ---------------------------- LIMPIAR ARCHIVO PRODUCTOS -----------------------------
	limpiarArchivoProductos macro
		local buscarDolar, borrarDolar, finalizarBorrar
			mov DX, 0000
			mov [puntero_temp], DX
			abrirArchivoM f_productos
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
	endm
	; ----------------------- ABRIR ARCHIVO Y CREARLO SI NO EXISTE -----------------------
	abrirArchivoM macro archivo
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
	; ---------------------------------- ABRIR ARCHIVO -----------------------------------
	abrirArchivo macro archivo
		mov AL, 02
		mov AH, 3d
		mov DX, offset archivo
		int 21
	endm
	; --------------------- ESCRIBIR AL FINAL DEL ARCHIVO PRODUCTOS ----------------------
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
	; ---------------------------------- CERRAR ARCHIVO ----------------------------------
	cerrarArchivo macro
		mov AH, 3e
		int 21
	endm
	; --------------------------------- CADENA A NÚMERO ----------------------------------
	stoi macro numero, cadena
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
	; --------------------------------- NÚMERO A CADENA ----------------------------------
	toString macro cadena, numero
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
			;
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
	; ---------------------------------- OBTENER CAMPO -----------------------------------
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
	; -------------------- IMPRIMIR PRODUCTO CON TODOS SUS ATRIBUTOS ---------------------
	imprimirProductoT macro codigo, descripcion, precio, unidades
		obtenerCampo codigo
		print codigo
		print guion
		obtenerCampo descripcion
		print descripcion
		print guion
		toString c_numero, precio
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
	; -------------------------------- IMPRIMIR PRODUCTO ---------------------------------
	imprimirProducto macro codigo, descripcion
		print u_space
		obtenerCampo codigo
		print codigo
		print guion
		obtenerCampo descripcion
		println descripcion
	endm
	; -------------------------------------- MEMSET --------------------------------------
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
	; ----------------------- VALIDACION DE EXISTENCIA DE PRODUCTO -----------------------
	existeProducto macro codigo
		local buscarProducto, respuestaV, respuestaF, terminate
			abrirArchivo f_productos
			jc respuestaF
			mov [h_productos], AX
		buscarProducto:
			mov BX, [h_productos]
			mov CX, 02a
			mov DX, offset p_codigo_temp2
			mov AH, 3f
			int 21
			;
			cmp AX, 00
			je respuestaF    ; SI AX = 0 SALTA
			; VALIDA SI EL PRODUCTO ES VÁLIDO
			mov AL, 0000
			cmp [codigo], AL
			je buscarProducto
			; VALIDA QUE EL CÓDIGO INGRESADO COINCIDA CON ALGUNO GUARDADO
			strcmp p_codigo_temp2, codigo, 05 ; VALIDA COINCIDENCIA DE CADENAS, GUARDA RESULTADO EN DL
			; AL = 0FF : VERDADERO ; DL = 00 : FALSO
			cmp AL, 0ff           ; COMPARA AL
			je respuestaV
			jmp buscarProducto
		respuestaV:
			mov AL, 0ff
			jmp terminate
		respuestaF:
			mov AL, 00
		terminate:
	endm
	; ------------------------------------ ES DIGITO -------------------------------------
	isDigit macro caracter
		local terminateV, terminateF, terminate
			cmp caracter, 30          ; COMPARA LA POSICION CON ASCII HEX DE 0 = 30
			jb terminateF             ; SALTA A FALSO SI EL CARACTER EVALUADO ESTÁ ANTES DE 0 EN ASCII
			cmp caracter, 39          ; COMPARA LA POSICION CON ASCII HEX DE 9 = 39
			ja terminateF             ; SALTA A FALSO SI EL CARACTER EVALUADO ESTÁ DESPUÉS DE 9 EN ASCII
		terminateV:
			mov DL, 0ff               ; ASIGNA DL = 0FF PARA VALIDACIÓN VERDADERA
			jmp terminate             ; SALTA A TERMINAR
		terminateF:
			mov DL, 00                ; ASIGNA DL = 00 PARA VALIDACIÓN FALSA
		terminate:
	endm
	; -------------------------------- ES LETRA MAYÚSCULA --------------------------------
	isAlphaU macro caracter
		local terminateV, terminateF, terminate
			cmp caracter, 41          ; COMPARA LA POSICION CON ASCII HEX DE A = 41
			jb terminateF             ; SALTA A FALSO SI EL CARACTER EVALUADO ESTÁ ANTES DE A EN ASCII
			cmp caracter, 05a         ; COMPARA LA POSICION CON ASCII HEX DE Z = 5A
			ja terminateF             ; SALTA A FALSO SI EL CARACTER EVALUADO ESTÁ DESPUÉS DE Z EN ASCII
		terminateV:
			mov DL, 0ff               ; ASIGNA DL = 0FF PARA VALIDACIÓN VERDADERA
			jmp terminate             ; SALTA A TERMINAR
		terminateF:
			mov DL, 00                ; ASIGNA DL = 00 PARA VALIDACIÓN FALSA
		terminate:
	endm
	; -------------------------------- ES LETRA MINÚSCULA --------------------------------
	isAlphaL macro caracter
		local terminateV, terminateF, terminate
			cmp caracter, 61          ; COMPARA LA POSICION CON ASCII HEX DE a = 61
			jb terminateF             ; SALTA A FALSO SI EL CARACTER EVALUADO ESTÁ ANTES DE A EN ASCII
			cmp caracter, 07a         ; COMPARA LA POSICION CON ASCII HEX DE z = 7A
			ja terminateF             ; SALTA A FALSO SI EL CARACTER EVALUADO ESTÁ DESPUÉS DE Z EN ASCII
		terminateV:
			mov DL, 0ff               ; ASIGNA DL = 0FF PARA VALIDACIÓN VERDADERA
			jmp terminate             ; SALTA A TERMINAR
		terminateF:
			mov DL, 00                ; ASIGNA DL = 00 PARA VALIDACIÓN FALSA
		terminate:
	endm
	; -------------------- VALIDACIÓN DE EXPRESIÓN REGULAR DE CODIGO ---------------------
	esCodigoValido macro campo
		local calcular, evaluar, continuar, terminateV, terminateF, terminate
			; CALCULO DE LONGITUD DE CARACTERES
			mov DI, offset campo
			mov CX, 00
		calcular:
			mov AL, [DI]
			inc DI
			inc CX
			cmp AL, 00
			jne calcular              ; FIN CALCULAR LONGITUD
			dec CX
			; POSICIONAR AL INICIO DEL CAMPO
			mov DI, offset campo
		evaluar:
			mov AL, [DI]              ; 
			isDigit AL          ; VALIDAR CARACTER COMO DÍGITO, RESULTADO EN DL
			cmp DL, 0ff               ; COMPARA DL CON 0FF
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES DIGÍTO
			isAlphaU AL               ; VALIDAR CARACTER COMO LETRA MAYÚSCULA, RESULTADO EN DL
			cmp DL, 0ff               ; COMPARA DL CON 0FF
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES LETRA MAYÚSCULA
			jmp terminateF            ; SALTA A FALSO SI EL CARACTER NO CUMPLE CON LAS VALIDACIONES ANTERIORES
		continuar:
			inc DI                    ; INCREMENTA POSICION
			loop evaluar              ; REPITE CICLO
		terminateV:
			mov AL, 0ff               ; ASIGNA AL = 0FF PARA VALIDACIÓN VERDADERA
			jmp terminate             ; SALTA A TERMINAR
		terminateF:
			mov AL, 00                ; ASIGNA AL = 00 PARA VALIDACIÓN FALSA
		terminate:
	endm
	; ------------------ VALIDACIÓN DE EXPRESIÓN REGULAR DE DESCRIPCIÓN ------------------
	esDescripcionValida macro campo
		local calcular, evaluar, continuar, terminateV, terminateF, terminate
			; CALCULO DE LONGITUD DE CARACTERES
			mov DI, offset campo
			mov CX, 00
		calcular:
			mov AL, [DI]
			inc DI
			inc CX
			cmp AL, 00
			jne calcular              ; FIN CALCULAR LONGITUD
			dec CX
			; POSICIONAR AL INICIO DEL CAMPO
			mov DI, offset campo
		evaluar:
			mov AL, [DI]              ; 
			isDigit AL                ; VALIDAR CARACTER COMO DÍGITO, RESULTADO EN DL
			cmp DL, 0ff               ; COMPARA DL CON 0FF
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES DIGÍTO
			isAlphaU AL               ; VALIDAR CARACTER COMO LETRA MAYÚSCULA, RESULTADO EN DL
			cmp DL, 0ff               ; COMPARA DL CON 0FF
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES LETRA MAYÚSCULA
			isAlphaL AL               ; VALIDAR CARACTER COMO LETRA MINÚSCULA, RESULTADO EN DL
			cmp DL, 0ff               ; COMPARA DL CON 0FF
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES LETRA MINÚSCULA
			cmp AL, 20                ; COMPARA AL (CARACTER) CON ESPACIO EN ASCII
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES ESPACIO
			cmp AL, 21                ; COMPARA AL (CARACTER) CON EXCLAMACIÓN CERRADA EN ASCII
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES EXCLAMACIÓN CERRADA
			cmp AL, 02c               ; COMPARA AL (CARACTER) CON COMA EN ASCII
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES COMA
			cmp AL, 02e               ; COMPARA AL (CARACTER) CON PUNTO EN ASCII
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES PUNTO
			jmp terminateF            ; SALTA A FALSO SI EL CARACTER NO CUMPLE CON LAS VALIDACIONES ANTERIORES
		continuar:
			inc DI                    ; INCREMENTA POSICION
			loop evaluar              ; REPITE CICLO
		terminateV:
			mov AL, 0ff               ; ASIGNA AL = 0FF PARA VALIDACIÓN VERDADERA
			jmp terminate             ; SALTA A TERMINAR
		terminateF:
			mov AL, 00                ; ASIGNA AL = 00 PARA VALIDACIÓN FALSA
		terminate:
	endm
	; -------------------- VALIDACIÓN DE EXPRESIÓN REGULAR DE NÚMERO ---------------------
	esNumeroValido macro campo
		local calcular, evaluar, continuar, terminateV, terminateF, terminate
			; CALCULO DE LONGITUD DE CARACTERES
			mov DI, offset campo
			mov CX, 00
		calcular:
			mov AL, [DI]
			inc DI
			inc CX
			cmp AL, 00
			jne calcular              ; FIN CALCULAR LONGITUD
			dec CX
			; POSICIONAR AL INICIO DEL CAMPO
			mov DI, offset campo
		evaluar:
			mov AL, [DI]              ; 
			isDigit AL          ; VALIDAR CARACTER COMO DÍGITO, RESULTADO EN DL
			cmp DL, 0ff               ; COMPARA DL CON 0FF
			je continuar              ; SALTA A CONTINUAR SI EL CARACTER ES DIGÍTO
			jmp terminateF            ; SALTA A FALSO SI EL CARACTER NO CUMPLE CON LAS VALIDACIONES ANTERIORES
		continuar:
			inc DI                    ; INCREMENTA POSICION
			loop evaluar              ; REPITE CICLO
		terminateV:
			mov AL, 0ff               ; ASIGNA AL = 0FF PARA VALIDACIÓN VERDADERA
			jmp terminate             ; SALTA A TERMINAR
		terminateF:
			mov AL, 00                ; ASIGNA AL = 00 PARA VALIDACIÓN FALSA
		terminate:
	endm
; ******************************************************************************************************************
; **************************************************** PROGRAMA ****************************************************
; ******************************************************************************************************************
	; ------------------------------------------------------------------------------------
	; -------------------------------------- LOGUEO --------------------------------------
	; ------------------------------------------------------------------------------------
	login:
		; PARSEO DEL ARCHIVO DE CONFIGURACION
		parseConf
		cmp AL, 00
		je confError
		; VALIDACION DE USUARIO
		strcmp usuario, usuario_c, 08
		cmp AL, 00
		je terminateError
		; VALIDACION DE CLAVE
		strcmp clave, clave_c, 09
		cmp AL, 00
		je terminateError
	; ------------------------------------------------------------------------------------
	; ------------------------------------ ENCABEZADO ------------------------------------
	; ------------------------------------------------------------------------------------
	encabezado:
		imprimirEncabezado
	; ------------------------------------------------------------------------------------
	; ---------------------------------- MENÚ PRINCIPAL ----------------------------------
	; ------------------------------------------------------------------------------------
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
	; ------------------------------------------------------------------------------------
	; ---------------------------------- MENÚ PRODUCTOS ----------------------------------
	; ------------------------------------------------------------------------------------
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
			; ------------------------- CODIGO PRODUCTO --------------------------
			codigoProd:
				print tituloInsCod
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je codigoProd            ; SALTA SI AL = 00H
				cmp AL, 05               ; COMPARA AL Y 05H
				jb validarCodigoP        ; SALTA SI AL < 05H
				print line
				jmp codigoProd
			validarCodigoP:
				memcpy p_codigo, buffer_entrada
				esCodigoValido p_codigo ; EVALUA CARACTERES VÁLIDOS PARA CÓDIGO: [0-9A-Z]
				cmp AL, 00
				je charInvalidos1
				existeProducto p_codigo
				cmp AL, 0ff
				je yaExiste1
				jmp aceptaCodProd
			charInvalidos1:
				println charInvalidos
				memset p_codigo, 05
				jmp codigoProd
			yaExiste1:
				println yaExisteCodigo
				memset p_codigo, 05
				jmp codigoProd
			aceptaCodProd:
			; ----------------------- DESCRIPCIÓN PRODUCTO -----------------------
			print line
			descripcionProd:
				print tituloInsDes
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je descripcionProd       ; SALTA SI AL = 00H
				cmp AL, 21               ; COMPARA AL Y 21H
				jb validarDescripcionP   ; SALTA SI AL < 21H
				print line
				jmp descripcionProd
			validarDescripcionP:
				memcpy p_descripcion, buffer_entrada
				esDescripcionValida p_descripcion ; EVALUA CARACTERES VÁLIDOS PARA DESCRIPCION: [0-9A-Za-z\s\,\.!]
				cmp AL, 00
				je charInvalidos2
				jmp aceptaDesProd
			charInvalidos2:
				println charInvalidos
				memset p_descripcion, 21
				jmp descripcionProd
			aceptaDesProd:
			; ------------------------- PRECIO PRODUCTO --------------------------
			print line
			precioProd:
				print tituloInsPre
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je precioProd            ; SALTA SI AL = 00H
				cmp AL, 03               ; COMPARA AL Y 03H
				jb validarPrecioP        ; SALTA SI AL < 03H
				print line
				jmp precioProd
			validarPrecioP:
				memcpy p_precio, buffer_entrada
				esNumeroValido p_precio  ; EVALUA CARACTERES VÁLIDOS PARA CÓDIGO: [0-9]
				cmp AL, 00
				je charInvalidos3
				jmp aceptaPreProd
			charInvalidos3:
				println charInvalidos
				memset p_precio, 03
				jmp precioProd
			aceptaPreProd:
				stoi n_precio, p_precio
				memset p_precio, 03
			; ------------------------ UNIDADES PRODUCTO -------------------------
			print line
			unidadesProd:
				print tituloInsUni
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je unidadesProd          ; SALTA SI AL = 00H
				cmp AL, 03               ; COMPARA AL Y 03H
				jb validarUniProd        ; SALTA SI AL < 03H
				print line
				jmp unidadesProd
			validarUniProd:
				memcpy p_unidades, buffer_entrada
				esNumeroValido p_unidades ; EVALUA CARACTERES VÁLIDOS PARA CÓDIGO: [0-9]
				cmp AL, 00
				je charInvalidos4
				jmp aceptaUniProd
			charInvalidos4:
				println charInvalidos
				memset p_unidades, 03
				jmp unidadesProd
			aceptaUniProd:
				stoi n_unidades, p_unidades
				memset p_unidades, 03
			; --------------------- MANEJO ARCHIVO PRODUCTO ----------------------
			abrirArchivoM f_productos     ; ABRIR ARCHIVO SI EXISTE, SI NO EXISTE LO CREA Y ABRE
			escribirAlFinalArchivoProducto h_productos, p_codigo, n_precio
			cerrarArchivo
			memset p_codigo, 05
			memset p_descripcion, 21
			; ----------------------- FIN INGRESO PRODUCTO -----------------------
			print line
			print line
			limpiarArchivoProductos
			println tituloInsertar_f
			print line
			jmp menuProductos
		; ****************************** VER PRODUCTO *******************************
		verProductos:
			println tituloVer
			abrirArchivo f_productos
			jc finVer
			mov [h_productos], AX
			; RECORRER EL ARCHIVO (LEER)
			mov SI, 00
			; --------------------- IMPRESIÓN DE PRODUCTOS -----------------------
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
				println tituloVer_f
				print line
				jmp menuProductos
		; **************************** ELIMINAR PRODUCTO ****************************
		eliminarProducto:
				println tituloEliminar
			; ------------------------- CODIGO PRODUCTO --------------------------
			codigoProdEl:
				print tituloInsCod
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je codigoProdEl          ; SALTA SI AL = 00H
				cmp AL, 05               ; COMPARA AL Y 05H
				jb validarCodigoPEl      ; SALTA SI AL < 05H
				print line
				jmp codigoProdEl
			validarCodigoPEl:
				memcpy p_codigo_temp, buffer_entrada
				esCodigoValido p_codigo_temp ; EVALUA CARACTERES VÁLIDOS PARA CÓDIGO: [0-9A-Z]
				cmp AL, 00
				je charInvalidos5
				existeProducto p_codigo_temp
				cmp AL, 00
				je noExiste1
				jmp aceptaCodProdEl
			charInvalidos5:
				println charInvalidos
				memset p_codigo_temp, 05
				jmp codigoProdEl
			noExiste1:
				print line
				println noExisteCodigo
				memset p_codigo_temp, 05
				jmp finalizarB
			aceptaCodProdEl:
				mov DX, 0000
				mov [puntero_temp], DX
				abrirArchivo f_productos
				jc finalizarB
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
				strcmp p_codigo_temp, p_codigo, 05 ; VALIDA COINCIDENCIA DE CADENAS, GUARDA RESULTADO EN DL
				; AL = 0FF : VERDADERO ; DL = 00 : FALSO
				cmp AL, 0ff           ; COMPARA DL
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
				cerrarArchivo
			finalizarB:
				memset p_codigo, 05
				memset p_codigo_temp, 05
				print line
				println tituloEliminar_f
			jmp menuProductos
	; ------------------------------------------------------------------------------------
	; ----------------------------------- MENÚ VENTAS ------------------------------------
	; ------------------------------------------------------------------------------------
	menuVentas:
		imprimirMenuVentas
		leerCaracter
		cmp AL, 31 ; OPCION 1: REALIZAR VENTA
		je realizarVenta
		cmp AL, 32 ; OPCION 2: VOLVER
		je menuPrincipal
		jmp menuVentas
		; *************************** VENTA DE PRODUCTOS ****************************
		realizarVenta:
			println tituloVender
			; ------------------------ CANTIDAD DE ITEMS -------------------------
			cantVent:
				print tituloVenCan
				leerEntrada buffer_entrada
				lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
				cmp AL, 00               ; COMPARA AL Y 00H
				je cantVent              ; SALTA SI AL = 00H
				cmp AL, 03               ; COMPARA AL Y 05H
				jb validarItems          ; SALTA SI AL < 05H
				print line
				jmp cantVent
			validarItems:
				memcpy v_items, buffer_entrada
				stoi n_items, v_items
				cmp n_items, 00
				je noItems
				cmp n_items, 0b
				jb iniciarVenta
				print line
				memset v_items, 03
				jmp cantVent
			noItems:
				print line
				memset v_items, 03
				jmp cantVent
			; --------------------- PRODUCTOS PARA LA VENTA ----------------------
			iniciarVenta:
				print line
			insertarProductoV:
				; ---------------------- CODIGO DE PRODUCTO ----------------------
				codVent:
					print tituloVenCod
					leerEntrada buffer_entrada
					lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
					cmp AL, 00               ; COMPARA AL Y 00H
					je codVent               ; SALTA SI AL = 00H
					cmp AL, 05               ; COMPARA AL Y 05H
					jb validarCodigo         ; SALTA SI AL < 05H
					print line
					jmp codVent
				validarCodigo:
					print line
					; VALIDACIÓN DE CÓDIGO CON 'FIN'
					memcpy v_codigo, buffer_entrada
					strcmp v_codigo, c_FIN, 03
					cmp AL, 0ff
					je finalizarVenta
					; VALIDACIÓN DE EXISTENCIA

				; --------------------- UNIDADES DE PRODUCTO ---------------------
				unitVent:
					print tituloVenUni
					leerEntrada buffer_entrada
					lenCadena buffer_entrada ; LONGITUD DE CADENA EN AL
					cmp AL, 00               ; COMPARA AL Y 00H
					je unitVent              ; SALTA SI AL = 00H
					cmp AL, 03               ; COMPARA AL Y 05H
					jb validarUnidades       ; SALTA SI AL < 05H
					print line
					jmp unitVent
				validarUnidades:
					print line
					; VALIDACIÓN DE UNIDADES
			; --------------------------------------------------------------------
					println tituloVendido
					memset v_codigo, 05
					memset v_unidades, 03
					dec [n_items]
					cmp [n_items], 00
					jne insertarProductoV
			finalizarVenta:

			println tituloVender_f
			jmp menuVentas
	; ------------------------------------------------------------------------------------
	; -------------------------------- MENÚ HERRAMIENTAS ---------------------------------
	; ------------------------------------------------------------------------------------
	menuHerramientas:
		imprimirMenuHerramientas
		leerCaracter
		cmp AL, 31 ; OPCION 1: GENERAR CATÁLOGO    HTM
		je catalogoExport
		cmp AL, 32 ; OPCION 2: REPORTE ALFABÉTICO  HTM
		cmp AL, 33 ; OPCION 3: REPORTE DE VENTAS   TXT
		cmp AL, 34 ; OPCION 4: REPORTE DE AGOTADOS HTM
		je agotadosExport
		cmp AL, 35 ; OPCION 5: VOLVER
		je menuPrincipal
		jmp menuHerramientas
	; --------------------------------- CATÁLOGO ---------------------------------
	catalogoExport:
		mov AH, 3c
		mov CX, 00
		mov DX, offset f_repcatalogo
		int 21
		mov [h_reportes], AX
		mov BX, AX
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_header_html]
		mov DX, offset html
		int 21
		mov BX, [h_reportes]
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_init_tabla]
		mov DX, offset tabla
		int 21
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		abrirArchivo f_productos
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov [h_productos], AX
	; LEER
	cicloMostrarRep1:
		; PUNTERO EN CIERTA POSICIÓN
		mov BX, [h_productos]
		mov CX, 26
		mov DX, offset p_codigo
		mov AH, 3f
		int 21
		; AVANZÓ EL PUNTERO
		mov BX, [h_productos]
		mov CX, 04
		mov DX, offset n_precio
		mov AH, 3f
		int 21
		; BYTES LEIDOS
		; SI SE LEYERON 0 BYTES SE ENCONTRÓ EOF
		cmp AX, 00
		je finCicloMostrarRep1
		; VERIFICAR VALIDEZ DEL PRODUCTO
		mov AL, 00
		cmp [p_codigo], AL
		je cicloMostrarRep1
		;
		call imprimir_estructura_html
		jmp cicloMostrarRep1
	finCicloMostrarRep1:
		mov BX, [h_reportes]
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_close_tabla]
		mov DX, offset tabla_f
		int 21
		;
		mov BX, [h_reportes]
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_close_html]
		mov DX, offset html_f
		int 21
		;
		cerrarArchivo
		println generado
		print line
		jmp menuHerramientas
	; ----------------------------- SIN EXISTENCIAS ------------------------------
	agotadosExport:
		mov AH, 3c
		mov CX, 00
		mov DX, offset f_repfalta
		int 21
		mov [h_reportes], AX
		mov BX, AX
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_header_html]
		mov DX, offset html
		int 21
		mov BX, [h_reportes]
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_init_tabla]
		mov DX, offset tabla
		int 21
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		abrirArchivo f_productos
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		mov [h_productos], AX
	; LEER
	cicloMostrarRep4:
		; PUNTERO EN CIERTA POSICIÓN
		mov BX, [h_productos]
		mov CX, 26
		mov DX, offset p_codigo
		mov AH, 3f
		int 21
		; AVANZÓ EL PUNTERO
		mov BX, [h_productos]
		mov CX, 02
		mov DX, offset n_precio
		mov AH, 3f
		int 21
		; AVANZÓ EL PUNTERO
		mov BX, [h_productos]
		mov CX, 02
		mov DX, offset n_unidades
		mov AH, 3f
		int 21
		; BYTES LEIDOS
		; SI SE LEYERON 0 BYTES SE ENCONTRÓ EOF
		cmp AX, 00
		je finCicloMostrarRep1
		; VERIFICAR VALIDEZ DEL PRODUCTO
		mov AL, 00
		cmp [p_codigo], AL
		je cicloMostrarRep4
		;
		cmp [n_unidades], 00
		jne cicloMostrarRep4
		call imprimir_estructura_html
		jmp cicloMostrarRep4
	finCicloMostrarRep4:
		mov BX, [h_reportes]
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_close_tabla]
		mov DX, offset tabla_f
		int 21
		;
		mov BX, [h_reportes]
		mov AH, 40
		mov CH, 00
		mov CL, [longitud_close_html]
		mov DX, offset html_f
		int 21
		;
		cerrarArchivo
		println generado
		print line
		jmp menuHerramientas
;;; ENTRADA:
;;    BX -> handle
imprimir_estructura_html:
	mov BX, [h_reportes]
	mov AH, 40
	mov CH, 00
	mov CL, 05
	mov DX, offset fila
	int 21
	;;
	mov BX, [h_reportes]
	mov AH, 40
	mov CH, 00
	mov CL, 04
	mov DX, offset columna
	int 21
	;;
	mov DX, offset p_codigo
	mov SI, 0000
ciclo_escribir_codigo:
	mov DI, DX
	mov AL, [DI]
	cmp AL, 00
	je escribir_desc
	cmp SI, 0006
	je escribir_desc
	mov CX, 0001
	mov BX, [h_reportes]
	mov AH, 40
	int 21
	inc DX
	inc SI
	jmp ciclo_escribir_codigo
escribir_desc:
	;;
	mov BX, [h_reportes]
	mov AH, 40
	mov CH, 00
	mov CL, 06
	mov DX, offset columna_f
	int 21
	;;
	mov BX, [h_reportes]
	mov AH, 40
	mov CH, 00
	mov CL, 04
	mov DX, offset columna
	int 21
	;;
	mov DX, offset p_descripcion
	mov SI, 0000
ciclo_escribir_desc:
	mov DI, DX
	mov AL, [DI]
	cmp AL, 00
	je cerrar_tags
	cmp SI, 0026
	je cerrar_tags
	mov CX, 0001
	mov BX, [h_reportes]
	mov AH, 40
	int 21
	inc DX
	inc SI
	jmp ciclo_escribir_desc
	;;
cerrar_tags:
	mov BX, [h_reportes]
	mov AH, 40
	mov CH, 00
	mov CL, 06
	mov DX, offset columna_f
	int 21
	;;
	mov BX, [h_reportes]
	mov AH, 40
	mov CH, 00
	mov CL, 06
	mov DX, offset fila_f
	int 21
	;;
	ret
confError:
	println archivoConfError
	jmp terminate
terminateError:
	println loginFalla
terminate:
	println finalizado
.EXIT
END