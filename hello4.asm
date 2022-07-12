;hello4.asm

extern		printf					;declaring that printf is an external function
section .data
	msg	db	"Hello, World!",0		;stored message
	fmtstr	db	"This is our string %s",10,0	;printformat
section .bss
section .text
	global main
main:
	push	rbp		;pushing base pointer
	mov	rbp, rsp	;assigning stack point to base pointer
	mov	rdi, fmtstr	;first arg for printf
	mov	rsi, msg	;calling msg
	mov	rax, 0 		;no xxm register involved
	call	printf		;calling external function
	mov	rsp, rbp	;reversing
	pop	rbp
	mov	rax, 60		;clean exit
	mov	rdi, 0 		;success code
	syscall




