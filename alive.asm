;alive.asm

section .data 
	msg1	db	"hello, world",10,0	; assigning msg1 var
	msg1len		equ	$-msg1-1	;length msg1 -1
	msg2	db	"Alive and Kicking!",10,0	; assigning msg2 var
	msg2len		equ	$-msg2-1	;length msg2-1
	radius	dq	357	;no string/not displayable
	pi	dq	3.14	;no string/not displayable
section .bss
section .text
	global main
main:
	push	rbp		;function prologue
	mov	rbp, rsp	;function prologue
	mov	rax, 1		;assigning write permissions
	mov	rdi, 1		;stdout set 
	mov	rsi, msg1	;callback to msg1
	mov	rdx, msg1len	;call back to len(msg1)
	syscall	
	mov	rax, 1		;write permissions
	mov	rdi, 1		;stdout
	mov	rsi, msg2	;callback msg2
	mov	rdx, msg2len	;len(msg2)
	syscall
	mov	rsp, rbp	;function epilogue
	pop	rbp		;function epilogue
	mov	rax, 60		;clean exit
	mov	rdi, 0		;success
	syscall			;exit
 		
