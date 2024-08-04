section .text
	global _start ; must be declared for linker (ld)
	
_start: ; tell linker entry point
	mov edx, 1 ; message length
	mov ecx, choice ; message to write
	mov ebx, 1      ; file descriptor (stdout)
	mov eax, 4 		; system call number (sys_write)
	int 80h			; call kernel
	
	mov eax, 1 		; system call number (sys_write)
	int 80h 		; call kernel
	
section .data
	choice DB 'y'
	
	
