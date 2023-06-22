.MODEL SMALL
.RADIX 16
.STACK
.DATA
	universidad				db				"Universidad de San Carlos de Guatemala", "$"
	facultad  				db				"Facultad de Ingenier", 0a1, "a", "$"
	escuela 				db				"Escuela de Vacaciones", "$"
	curso  					db				"Arquitectura de Computadoras y Ensambladores 1", "$"
	nombre  				db				"Nombre: Danny Hugo Bryan Tejax", 0a3, "n Pichiy", 0a0, "$"
	carnet  				db				"Carne: 201908355", "$"
	line					db				0a, "$"
.CODE
.STARTUP
main:
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

	encabezado:
		println universidad
		println facultad
		println escuela
		println curso
		print line
		println nombre
		println carnet
end:
.EXIT
END