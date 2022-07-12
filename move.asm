;move.asm
section .data
	bNum	db	123
	wNum	dw	12345
	dNum	dd	1234567890
	qNum1	dq	1234567890123456789
	qNum2	dq	123456
	qNum3	dq	3.14
section .bss
section .text
	global main
main:
	push	rbp			;initialization/prologue
	mov	rbp,rsp			;
	mov	rax, -1			;setting rax to all 1's/fffff
	mov	al, byte [bNum]		;doesn't clear upper bits of rax
	xor	rax, rax		;set rax 0/clear
	mov	al, byte [bNum]		;setting rax to correct value
	mov	rax, -1			;rax to all 1's
	mov	eax, dword [dNum]	;does clear the upper bits of rax
	mov	rax, -1			;setting to 1's
	mov	rax, qword [qNum1]	;does clear upper bits of rax
	mov	qword [qNum2], rax	;one operand for register
	mov	rax, 123456		;source operand an immediate value
	movq	xmm0, [qNum3]		;assinging a floating point
	mov	rsp, rbp		;
	pop	rbp			;exit/epilogue
	ret
	









