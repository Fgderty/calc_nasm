global math_add
global math_sub
global math_mul
global math_div

section .text

math_add:
	mov rax, rdi
	add rax, rsi
	ret

math_sub:
	mov rax, rdi
	sub rax, rsi
	ret

math_mul:
	mov rax, rdi
	imul rax, rsi
	ret

math_div:
	mov rax, rdi
	cqo
	idiv rsi
	ret
