SYS_EXIT 	equ 1
SYS_READ 	equ 3
SYS_WRITE 	equ 4
STDIN 		equ 0
STDOUT 		equ 1

segment .data

	msg1 db "Enter a digit: "
	len1 equ $- msg1
	
	msg2 db "Please enter a second digit: "
	len2 equ $- msg2
	
	msg3 db "The sum is: "
	len3 equ $- msg3
	
segment .bss
	
	num1 resb 2
	num2 resb 2
	res resb 1
	

section .text
	global _start ; must be declared for linker

_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 0x80
	
	; taking first number as input
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 0x80
	
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 0x80
	
	; taking second number as input
	mov eax, SYS_READ
	mov ebx,STDOUT
	mov ecx, num2
	mov edx, 2
	int 0x80
	
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, len3
	int 0x80
	
	; moving the first number to eax register and second number to ebx
	; and subtracting ascii '0' to convert it into a decimal number
	
	mov eax, [num1]
	sub eax, '0'
	
	mov ebx, [num2]
	sub ebx, '0'
	
	; add eax and ebx
	add eax, ebx
	
	; add '0' to convert the sum from the decimal to ASCII
	add eax, '0'
		
	; storing the sum in memory location res
	mov [res], eax
	
	; print the sum in memory location res
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 0x80
	
exit:
	
	mov eax, SYS_EXIT
	int 0x80
	
	
