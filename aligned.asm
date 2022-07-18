;aligned.asm
extern printf
section .data
	fmt	db	"2 times pi equals %.14f",10,0
	pi	dq	3.141519
section .bss
section .text
	global main
func3:
	push	rbp
	movsd	xmm0,[pi]	;moving float into xmm0 register
	addsd	xmm0,[pi]	;adding float to itself stored in xmm0
	mov	rdi,fmt		;moving fmt into rdi register
	mov	rax,1		;specifying one float as argument
	call	printf		;print to console
	pop	rbp		
	ret			;return to caller
func2:
	push	rbp
	call	func3		;pushing into above function
	pop	rbp
	ret			;return to caller
func1:
	push	rbp
	call	func2		;calling above function
	pop	rbp
	ret			;return to caller
		global main
main:	
	push	rbp
	call	func1		;calling above function
	pop	rbp
	ret

