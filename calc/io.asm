[bits 64]

global read_input
global string_to_int
global int_to_string
global input_buffer

section .bss
	input_buffer resb 0x40

section .text

read_input:
	;read(fd, buffer, count)
	mov rax, 0x00
	mov rdi, 0x00
	lea rsi, [input_buffer]
	mov rdx, 0x40
	syscall
	ret

string_to_int:
	xor rax, rax
	xor rcx, rcx
.loop:
	movzx rdx, byte [rsi + rcx]
	cmp rdx, 0x0A
	je .done
	cmp rdx, '0'
	jl .done
	cmp rdx, '9'
	jg .done

	sub rdx, '0'
	imul rax, 0x0A
	add rax, rdx
	inc rcx
	jmp .loop
.done:
	ret

int_to_string:
	mov r8, rdi
	mov r9, 0x0A
	xor rcx, rcx

	test rax, rax
	jns .positive

	mov byte [r8], '-'
	inc r8
	inc rcx
	neg rax

.positive:
	xor r11, r11

	test rax, rax
	jnz .extract_loop
	mov byte [r8], 0x30
	mov byte [r8 + 1], 0x00
	inc rcx
	ret

.extract_loop:
	xor rdx, rdx
	div r9
	add rdx, 0x30
	push rdx
	inc rcx
	inc r11
	test rax, rax
	jnz .extract_loop

	mov r10, rcx

.write_loop:
	pop rdx
	mov byte [r8], dl
	inc r8
	dec r11
	jnz .write_loop

	mov byte [r8], 0x00
	mov rcx, r10
	ret
