;rect.asm
section	.data
section .bss
section .text


global r_area

r_area:
	section .text
	push	rbp
	mov	rbp,rsp		;prologue
	mov	rax,rsi		;moving a side of the rect into rax register	
	imul	rax,rdi		;multiplying sides by eachother
	leave			;epilogue
	ret
global r_circum

r_circum:
	section .text
	push	rbp
	mov	rbp,rsp		;prologue
	mov	rax,rsi		;moving a side into the rax register
	add	rax,rdi		;adding sides to eachother 
	add	rax,rax		;multiplying the sum of sides by two
	leave			;epilogue
	ret
