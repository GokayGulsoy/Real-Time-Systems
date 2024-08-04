section .data	; Data segment
	userMsg db "Please enter a number: "  ; Ask user to enter a number
	lenUserMsg equ $-userMsg ; The length of the message
	dispMsg db "You have entered: "
	lenDispMsg equ $-dispMsg
	
section .bss ; uninitialized data
	num resb 5

section .text ; Code segment
	global _start


_start:
	; User prompt
	mov eax, 4 ; (sys_read) system call number 4
	mov ebx, 1 ; writing to stdout
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 80h ; call kernel
	
	; Read and store the user input	
	mov eax, 3 ; (sys_write) system call number 3
	mov ebx, 2 ; reading from standard input
	mov ecx, num ; string to read
	mov edx, 5   ; 5 bytes 
	int 80h		; call kernel

	; Output the the message
	mov eax, 4 ; (sys_write) system call number 4
	mov ebx, 1 ; writing to stdout
	mov ecx, dispMsg ; string to be displayed 
	mov edx, lenDispMsg
	int 80h ;call kernel	
	
	; Output the number entered
	mov eax, 4 ; (sys_write) system call number 4
	mov ebx, 1 ; writing to stdout
	mov	ecx, num ; string to be displayed
	mov edx, 5 ; length of string
	int 80h ; call kernel 
	
	; Exit code
	mov eax, 1
	mov ebx, 0
	int 80h
	
