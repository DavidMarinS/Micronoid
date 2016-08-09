;-------------------------Seccion de datos-------------------------------
;Se definen las constantes que se van a usar en el programa

section .data
	num1: equ 1
	num2: equ 3
	num3: equ 23

	cons_BordesVbloques: db '|+-------------+ +-------------+ +-------------+ |',0xa		;contiene el valor a imprimir
	cons_tamanoBloques: equ $-cons_BordesVbloques		;contiene la cantidad de caracteres a imprimir

	cons_IntermedioBloques: db '||             | |             | |             | |',0xa		;contiene el valor a imprimir
	cons_tamanoIntermedio: equ $-cons_IntermedioBloques		;contiene la cantidad de caracteres a imprimir

	cons_Vacio: db '|                                                |',0xa		;contiene el valor a imprimir
	cons_tamanovacio: equ $-cons_Vacio		;contiene la cantidad de caracteres a imprimir

	cons_Piso: dw '+************************|***********************|',0xa		;contiene el valor a imprimir
	cons_tamanoPiso: equ $-cons_Piso		;contiene la cantidad de caracteres a imprimir

;--------------------Segmento de codigo--------------------
;Contiene la secuencia de ejecucion del programa

section .text
	global _start		;Definicion del punto de partida
_start:
.Inicio:

			add r8,num1						
			mov rax,1
			mov rdi,1
			mov rsi,cons_BordesVbloques
			mov rdx,cons_tamanoBloques
			syscall
			
			mov rax,num2
			mov rbx,num2
			cmp rax,rbx
			je .Segundalinea
			jne .Segundalinea
.Segundalinea:

			mov rax,1
			mov rdi,1
			mov rsi,cons_IntermedioBloques
			mov rdx,cons_tamanoIntermedio
			syscall
			
			mov rax,num2
			mov rbx,num2
			cmp rax,rbx
			je .ultimalinea
			jne .ultimalinea

.ultimalinea:
			mov rax,1
			mov rdi,1
			mov rsi,cons_BordesVbloques
			mov rdx,cons_tamanoBloques
			syscall
			
			mov rax,num2
			cmp rax,r8
			je .InicioVacio
			jne .Inicio
			
			
			
.InicioVacio:
			add r8,num1
			mov rax,1
			mov rdi,1
			mov rsi,cons_Vacio
			mov rdx,cons_tamanovacio
			syscall

			mov rax,num3
			cmp rax,r8
			je .printpiso
			jne .InicioVacio

.printpiso:
			mov rax,1
			mov rdi,1
			mov rsi,cons_Piso
			mov rdx,cons_tamanoPiso
			syscall

			mov rax,60						;se carga la llamada 60d (sys_exit) en rax
			mov rdi,0							;en rdi se carga un 0
			syscall								;se llama al sistema.



