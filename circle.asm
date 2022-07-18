;circle.asm
extern pi
section .data
section	.bss
section .text

global c_area
c_area:
	section .text
	push	rbp
	mov	rbp,rsp		;prologue
	movsd	xmm1,qword[pi]	;moving value pi into xmm1 register
	mulsd	xmm0,xmm0	;multiplying the xmm0 regsiter by itself 
	mulsd	xmm0,xmm1	;multiplying pi by radius*2 from above
	leave			;epilogue
	ret
global c_circum
c_circum:
	section .text
	push	rbp
	mov	rbp,rsp		;epilogue
	movsd	xmm1,qword[pi]	;moving pi into xmm1 register
	addsd	xmm0,xmm0	;adding radius by itself
	mulsd	xmm0,xmm1	;multiplying pi by radius+radius from above
	leave			;epilogue
	ret
