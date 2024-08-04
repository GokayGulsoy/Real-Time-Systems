; Assembly Hello world program

section .text
   global _start ; must be declared for linker (ld)
  
_start:
   mov edx,len ; message length
   mov ecx,msg ; message to write
   mov ebx,1   ; file descriptor (stdout)
   mov eax,4   ; system call number (sys_write)
   int 0x80    ; call kernel
   
   
   mov eax,1  ; system call number (sys_exit)
   int 0x80    ; call kernel
   
section .data
    msg db 'Hello world!', 0xa ; string to be printed
    len equ $ - msg            ; length of the string
   
   
; nasm -f elf hello.asm                 (for assembling the program)
; ld -m elf_i386 -s -o hello hello.o    (to link the object file and create an executable named hello)
; ./hello                               (for executing the executable)
   
