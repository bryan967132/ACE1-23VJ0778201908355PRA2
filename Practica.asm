;; DIRECTIVAS
.MODEL SMALL
.RADIX 16
.STACK
;; PILA
.DATA
;; VARIABLES | MEMORIA RAM
;; tamaño byte (db)
universidad	db "Universidad de San Carlos de Guatemala", 0a, "$"
facultad  	db "Facultad de Ingenier", 0a1, "a", 0a, "$"
escuela 	db "Escuela de Vacaciones", 0a, "$"
curso  		db "Arquitectura de Computadoras y Ensambladores 1", 0a, 0a, "$"
nombre  	db "Nombre: Danny Hugo Bryan Tejax", 0a3, "n Pichiy", 0a0, 0a, "$"
carnet  	db "Carne: 201908355", 0a, "$"
.CODE
.STARTUP
;; CÓDIGO
inicio:
	;; print de string
	mov DX, offset universidad
	mov AH, 09
	int 21
	;; print de string
	mov DX, offset facultad
	mov AH, 09
	int 21
	;; print de string
	mov DX, offset escuela
	mov AH, 09
	int 21
	;; print de string
	mov DX, offset curso
	mov AH, 09
	int 21
	;; print de string
	mov DX, offset nombre
	mov AH, 09
	int 21
	;; print de string
	mov DX, offset carnet
	mov AH, 09
	int 21
fin:
.EXIT
END