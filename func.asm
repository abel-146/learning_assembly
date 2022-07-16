;func.asm
extern printf
section .data
	radius	dq	10.0
	pi	dq	3.14
	fmt	db	"The are of the circle is %.2f",10,0
section .bss
section .text
	global main
main:
;------------------------------prologue
	push	rbp
	mov	rbp,rsp
;------------------------------------------------function
	call	area		;calling the area function defined later
	mov	rdi,fmt		;moving fmt into rdi register
;-------------------------------print format
	movsd	xmm1,[radius]	;moving radius into the xmm1 register
	mov	rax,1		;specifying there is 1 float in the resulting smt
	call	printf		;calling a print to the console
;-------------------------------epilogue
	leave
	ret
;------------------------------------------------func
area:
	push	rbp
	mov	rbp,rsp		
;---------------------------------prologue
	movsd	xmm0,[radius]	;moving radius into the xmm0 register
	mulsd	xmm0,[radius]	;multiplying radius by itself
	mulsd	xmm0,[pi]	;multiplying xmm0(radius*radius) by pi
;---------------------------------epilogue
	leave
	ret			
