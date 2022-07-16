;fcalc.asm
extern printf
section .data

	num1	dq	9.0
	num2	dq	73.0
	fmt	dq	"The numbers are %f and %f",10,0
	fmtf	db	"%s %f",10,0
	f_sum	db	"The sum of the floats %f and %f is %f",10,0
	f_dif	db	"The difference of float %f and %f is %f",10,0
	f_mul	db	"The product of float %f and %f is %f",10,0
	f_dv	db	"The quotient of %f and %f is %f",10,0
	f_sqrt	db	"The square root of %f is %f",10,0
section .bss
section .text
	global main
main:
;-------------------------------------Prologue
	push	rbp		
	mov	rbp,rsp
;printing the number
	movsd	xmm0,[num1]	;using different mov variant to push num into fpoint register
	movsd	xmm1,[num2]	;moving num2 into fpoint register
	mov	rdi,fmt		;moving fmt into rdi register
	mov	rax,2		;moving 2 into rax to specify two floats
	call	printf		;calling print to console
;--------------------------------------sum upcoming
	movsd	xmm2,[num1]	;moving num1 into float register
	addsd	xmm2,[num2]	;adding double precision into value of xmm2 register
	mov	rdi,f_sum	;moving fsum format into rdi register
	mov	rax,3		;specifying three floats
	call	printf		;calling print to console
;--------------------------------------diff upcoming
	movsd	xmm2,[num1]	;moving num1 inot the xmm2 register
	subsd	xmm2,[num2]	;subtraction num2 from num 1
	movsd	xmm0,[num1]	;moving num1 into the xmm0 register
	movsd	xmm1,[num2]	;moving num2 value into the xmm1 register 
	mov	rdi,f_dif	;moving format into rdi register
	mov	rax,3		;specifying three floats in rax register
	call	printf		;calling print to console
;-------------------------------------multiplication
	movsd	xmm2,[num1]	;moving sum1 into the xmm2 register
	mulsd	xmm2,[num2]	;multiplying num2 and the register
	movsd	xmm0,[num1]	;moving num1 into the xmm0 register as argument for printf/fmt
	movsd	xmm1,[num2]	;moving num2 into xmm1
	mov	rdi,f_mul	;moving the fmt into rdi register
	mov	rax,3		;specifying that there are 3 floats
	call 	printf		;calling print to console
;-------------------------------------division
	movsd	xmm2,[num1]	;moving num1 into xmm2 register
	divsd	xmm2,[num2]	;dividing value in the xmm2 register by num2
	movsd	xmm0,[num1]	;moving num1 intot the xmm0 register
	movsd	xmm1,[num2]	;moving num2 into xmm1 register
	mov	rdi,f_dv	;moving fmt into rdi register
	mov	rax,1		;specifying that there are 1 floats
	call 	printf		;calling ptint to console
;--------------------------------------sqrt
	sqrtsd	xmm2,[num1]	;square rooting value in num1 and storing it in register
	mov	rdi,f_sqrt	;moving fmt into rdi register
	mov	rax,2		;specifying 2 floats
	call 	printf		;calling print to console
;--------------------------------------epilogue
	mov	rsp,rbp
	pop	rbp
	ret













