section .text
	global _start ; must be declared for using gcc

_start:

	mov AX, '8'
	sub AX, '0' ; subtract ascii 0 to convert AX to decimal
	
	mov BL, '2'
	sub BL, '0'
	
	div BL
	add AL, '0'
	
	mov [quo], AL ; move quotient to quo
	
	mov ecx, msg1
	mov edx, lenQuo 
	mov ebx, 1 ; file descriptor (stdout)
	mov eax, 4 ; system call number (sys_write)
	int 0x80   ; call kernel

	; displaying quotient
	mov ecx, quo
	mov edx, 1
	mov ebx, 1 ; file descriptor (stdout)
	mov eax, 4 ; system call number (sys_write)
	int 0x80   ; call kernel	
	
	mov eax, 1 ; system call number (sys_exit)
	int 0x80

section .data
	msg1 db "The quotient is: "
	lenQuo equ $- msg1
	
section .bss
	quo resb 1


