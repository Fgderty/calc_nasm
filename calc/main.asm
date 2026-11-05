[bits 64]

extern math_add
extern math_sub
extern math_mul
extern math_div

extern read_input
extern string_to_int
extern int_to_string
extern input_buffer

section .bss
	num1 resq 1
	num2 resq 1
	output_buffer resb 0x20

section .rodata
	msg_prompt1 	db "Enter first number: ", 0x00
	msg_prompt2 	db "Enter second number: ", 0x00

	msg_add 		db "Addition (a + b): ", 0x00
	msg_sub         db "Subtraction (a - b): ", 0x00
	msg_mul         db "Multiplication (a * b): ", 0x00
	msg_div         db "Division (a / b): ", 0x00

	msg_result 		db "Result:    ", 0x00
	msg_newline		db 0x0A, 0x00

section .text
global _start

_start:
	;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
    syscall

	;write(fd, buffer, count)
	mov rax, 0x01
	mov rdi, 0x01
	lea rsi, [msg_prompt1]
	mov rdx, 0x14
	syscall

	call read_input
	lea rsi, [input_buffer]
	call string_to_int
	mov [num1], rax

	;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_prompt2]
    mov rdx, 0x15
    syscall

    call read_input
    lea rsi, [input_buffer]
    call string_to_int
    mov [num2], rax

	;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_result]
    mov rdx, 0x0B
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
    syscall


	;ADD()
	mov rdi, [num1]
	mov rsi, [num2]
	call math_add

	lea rdi, [output_buffer]
	call int_to_string

	mov r12, rcx

	;write(fd, buffer, count)
	mov rax, 0x01
	mov rdi, 0x01
	lea rsi, [msg_add]
	mov rdx, 0x12
	syscall

	;write(fd, buffer, count)
	mov rax, 0x01
	mov rdi, 0x01
	lea rsi, [output_buffer]
	mov rdx, r12
	syscall

	;write(fd, buffer, count)
	mov rax, 0x01
	mov rdi, 0x01
	lea rsi, [msg_newline]
	mov rdx, 0x01
	syscall

	;SUB()
	mov rdi, [num1]
    mov rsi, [num2]
    call math_sub

    lea rdi, [output_buffer]
    call int_to_string

    mov r12, rcx

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_sub]
    mov rdx, 0x15
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [output_buffer]
    mov rdx, r12
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
	syscall

	;MUL()
	mov rdi, [num1]
    mov rsi, [num2]
    call math_mul

    lea rdi, [output_buffer]
    call int_to_string

	mov r12, rcx

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_mul]
    mov rdx, 0x18
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [output_buffer]
    mov rdx, r12
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
	syscall

	;DIV()
	mov rdi, [num1]
    mov rsi, [num2]
    call math_div

    lea rdi, [output_buffer]
    call int_to_string

	mov r12, rcx

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_div]
    mov rdx, 0x12
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [output_buffer]
    mov rdx, r12
    syscall

    ;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
	syscall

	;write(fd, buffer, count)
    mov rax, 0x01
    mov rdi, 0x01
    lea rsi, [msg_newline]
    mov rdx, 0x01
    syscall

	;exit(0)
	mov rax, 0x3C
	xor edi, edi
	syscall
