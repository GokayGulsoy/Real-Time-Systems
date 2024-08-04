section .text 
	global _start ; must be declared for using gcc

_start:			  ; tell linker entry point
	
	mov AL, '3' ; multiplicand is held in AL register
	sub AL, '0' ; convert to decimal by subtracting ASCII 0
	
	mov BL, '2' ; multiplier is held in BL register (not mandatory)
	sub BL, '0'	; convert to decimal by subtracting ASCII 0
	
	mul bl
	add AL, '0'
	
	mov [res], AL
	mov ecx, msg
	mov edx, len
	mov ebx, 1 ; file descriptor (stdout)
	mov eax, 4 ; system call number (sys_write)
	int 0x80   ; call kernel
	
	mov ecx, res ; res is stored in ecx register
	mov edx, 1
	mov ebx, 1 ; file descriptor (stdout
	mov eax, 4 ; system call number (sys_write)
	int 0x80 ; call kernel
	
	mov eax, 1 ; system call number (sys_exit)
	int 0x80   ; call kernel
	

section .data
	msg db "The result is: "
	len equ $- msg
	
section .bss
	res resb 1


