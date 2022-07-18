;func4.asm
global	pi
extern c_area
extern c_circum
extern r_area
extern r_circum
extern printf
section .data
	pi	dq	3.141592654
	radius	dq	10.0
	side1	dq	4
	side2	dq	5
	fmtf	db	"%s %f",10,0
	fmti	db	"%s %d",10,0
	ca	db	"The circle area is ",0
	cc	db	"The circle circumference is ",0
	ra	db	"The circle area is ",0
	rc	db	"The rectangle circumference is ",0
section .bss
section .text
	global main
main:
	enter	0,0
;----------------------circle area
	movsd	xmm0,qword[radius]	;moving the calue in radius into the xmm0 register for call
	call	c_area			;jump to circle.asm
	mov	rdi,fmtf		;movinf format into rdi format
	mov	rsi,ca			;mvoing ca formatting into the rsi register
	mov	rax,1			;specifying one float into rax
	call	printf			;printing to console
;----------------------circle circumference			
	movsd	xmm0,qword[radius]	;moving value in radius into xmm0 for call
	call	c_circum		;jump to circle.asm
	mov	rdi,fmtf		;moving base fmt into rdi 
	mov	rsi,cc			;moving cc format into rsi
	mov	rax,1			;specifying 1 float into printf
	call	printf
;---------------------rectangle area
	mov	rdi,[side1]		;moving side into rdi for call to rect 
	mov	rsi,[side2]		;moving side2 into rsi for call to rect
	call	r_area			;calling rect.asm
	mov	rdi,fmti		;moving base format into rdi register
	mov	rsi,ra			;moving ra fmt into rsi register
	xor	rax,rax			;zeroing rax register
	call	printf
;---------------------rectangle circumference
	mov	rdi,[side1]		;moving side1 into rdi register for call
	mov	rsi,[side2]		;moving side2 into rsi register for call
	call	r_circum		;calling rect.asm
	mov	rdi,fmti		;moving fmti into rdi register
	mov	rsi,rc			;moving rc format into rsi format
	xor	rax,rax			;zeroing rax register
	call	printf			;calling print to console
leave
ret
