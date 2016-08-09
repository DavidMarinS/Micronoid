;----------------------------Seccion de datos-------------------------
;Se definen las constantes que se van a usar en el programa

section .data
	cons_hola: db 'Hola mundo!',0xa		;contiene el valor a imprimir
	cons_tamano: equ $-cons_hola		;contiene la cantidad de caracteres a imprimir

;--------------------------Segmento de codigo--------------------------
;Contiene la secuencia de ejecucion del programa
;La secuencia inicia el la etiqueta "_start"

section .text
	global _start

_start:
	mov rax,1
	mov rdi,1
	mov rsi,cons_hola
	mov rdx,cons_tamano
	syscall

	mov rax,60				;se carga la llamada 60d (sys_exit) en rax
	mov rdi,0				;en rdi se carga un 0
	syscall					;se llama al sistema.
