;func2.asm
extern printf
section .text
	radius	dq	10.0
section .bss
section .text
	global main
main:
	push	rbp
	mov	rbp,rsp
	call	circle			;calling func
	leave
	ret
;----------------------------
area:

section .data
	.pi	dq	3.1415		;defining local variable

section .text
	push	rbp
	mov	rbp,rsp
	movsd	xmm0,[radius]		;moving radius into xmm0 register
	mulsd 	xmm0,[radius]		;multiplying radius by itself
	mulsd	xmm0,[.pi]		;multiplying the radius by pi
	leave
	ret

;----------------------------
circum:
section .data
	.pi	dq	3.14		;defining a local variable
section .text
	push	rbp
	mov	rbp,rsp			
	movsd	xmm0,[radius]		;moving radius into xmm0 register
	addsd	xmm0,[radius]		;adding the register xmm0 value by itself
	mulsd	xmm0,[.pi]		;multiplying radius+radius by value in pi local variable
	leave
	ret
;-----------------------------
circle:
section .data
	.fmt	db	"The area is %f",10,0
	.fmt1	db	"The circumfrence is %f",10,0
section .text	
	push	rbp
	mov	rbp,rsp
	call	area			;calling func
	mov	rdi,.fmt		;moving fmt into rdi register
	mov	rax,1			;clarifying only one float 
	call	printf			;print to console
	call	circum			;calling func
	mov	rsi,.fmt1		;moving fmt1 into the rsi register
	mov	rax,1			;clarifying one float argument
	call 	printf			;print to console
	leave
	ret		

