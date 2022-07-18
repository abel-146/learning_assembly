;fun5.asm
extern printf
section .data
	first	db	"A",0
	second	db	"B",0
	third	db	"C",0
	fourth	db	"D",0
	fifth	db	"E",0
	sixth	db	"F",0
	seventh	db	"G",0
	eighth	db	"H",0
	ninth	db	"I",0
	tenth	db	"J",0
	fmt1	db	"The string is %s%s%s%s%s%s%s%s%s%s",10,0
	fmt2	db	"PI = %f",10,0
	pi	dq	3.14

section .bss
section .text
	global main
main:
	mov	rbp,rsp		;debugging
	push	rbp		;prologue
	mov	rbp,rsp

	mov	rdi,fmt1	;moving fmt1 into rdi register
	mov	rsi,first	;moving first value into rsi 
	mov	rdx,second	;second B
	mov	rcx,third	;third C
	mov	r8,fourth	;D
	mov	r9,fifth	;E
	push	tenth		;J begins pushing in reverse because stack reads opposite direction; of registers
	push	ninth		;I
	push	eighth		;H
	push	seventh		;G
	push	sixth		;F
	xor	rax,rax		;zeroing rax for printf
	call	printf		;printing to console
	and	rsp,0xfffffffffffffff0		;aligning stack to 16th bit
	movsd	xmm0,[pi]		;moving pi into xmm0 register
	mov	rax,1			;specifying 1 float into rax register
	mov	rdi,fmt2		;moving format into rdi register
	call	printf			;printing to console
	leave
	ret
