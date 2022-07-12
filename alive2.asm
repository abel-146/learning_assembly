;alive2.asm
section .data
	msg	db	"Hello, World!",0
	msg2	db	"Aliive and Kicking!",0
	radius	dd	357
	pi	dq	3.14
	fmtstr	db	"%s",10,0
	fmtflt	db	"%lf",10,0
	fmtint	db	"%d",10,0
section .bss
section .text
extern	printf
	global main
main:
	push	rbp		;prologue
	mov	rbp,rsi		;
;msg1
	mov	rax, 0		;setting no xmm/reminder that xmm is used during calls for floats
	mov	rdi, fmtstr	;feeding fmt to printf
	mov	rsi, msg	;fedding msg
	call printf		;extern call
;msg2	
	mov	rax, 0		;setting xmm false
	mov	rdi, fmtstr	;feeding fmt to printf
	mov	rsi, msg2	;feeding msg2
	call printf		
;radius
	mov	rax, 0		;setting xmm false
	mov	rdi, fmtint	;feeding fmt
	mov	rsi, [radius]	;feeding radius
	call printf
;pi
	mov	rax, 1		;setting xmm to true
	mov	rdi, fmtflt	;feeding fmt
	movq	xmm0, [pi]	;feeding pi as a float
	call	printf
;graceful exit
	mov	rsi, rbp	;epilogue
	pop	rbp		;
ret


