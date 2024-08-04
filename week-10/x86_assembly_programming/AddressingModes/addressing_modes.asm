section .text 
	global _start	; must be declared for linker (ld)

_start: ; tell linker entry point
	
	; writing the name "Adam Newman"
	mov edx, 13 ; message length
	mov ecx, name ; message to write
	mov ebx,1 	  ; file descriptor (stdout)
	mov eax, 4 	  ; system call number (sys_write)
	int 80h ; call kernel

	mov [name], dword "Kyle"
	
	; writing the name "Kyle Newman"	
	mov edx, 12 ; message length
	mov ecx, name ; message to write
	mov ebx, 1	  ; file descriptor (stdout)	
	mov eax, 4	  ; system call number (sys_write)
	int 80h		  ; call kernel

	mov eax,1 	  ; system call number (sys_exit) 
	int 80h   	  ; call kernel


section .data
	name db "Adam Newman "	

