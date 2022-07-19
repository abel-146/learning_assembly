;bits2.asm
extern printf
section .data
	
	msgn1	db	"Number 1 is = %d",0
	msgn2	db	"Number 2 is = %d",0
	msg1	db	"SHL 2 = OK to multiply by 4",0
	msg2	db	"SHR 2 = wrong divide by 4",0
	msg3	db	"SAL 2 correctly multiply by 4",0
	msg4	db	"SAR 2 = correctly divide by 4",0
	msg5	db	"SHR 2 = OK divide by 4",0
	num1	dq	8
	num2	dq	-8
	res	dq	0

section .bss
section .text
	global main
main:
	push	rbp
	mov	rbp,rsp
;SHL
;positive num
	mov	rsi,msg1	;moving format into rsi register
	call	printmsg	;calling function
	mov	rsi,[num1]	;moving num1 value into rsi register
	call	printnbr	;calling function
	mov	rax,[num1]	;moving num1 value into rax register
	shl	rax,2		;shl(multiply by 4)twice on rax register
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling function
;negative num
	mov 	rsi,msg1	;moving format into ris format
	call	printmsg	;calling function
	mov	rsi,[num2]	;moving num2 value into rsi register
	call	printnbr	;calling function
	mov	rax,[num2]	;moving num2 value into rax register
	shl	rax,2		;shl(x4) twice on rax value
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling function
;SAL
;positive num
	mov	rsi,msg3	;moving format into rsi register
	call	printmsg	;calling funtion
	mov	rsi,[num1]	;moving value in num1 into rsi register
	call	printnbr	;calling function
	mov 	rax,[num1]	;moving num1 value into rax register
	sal	rax,2		;shift arithmetic left(x4) on rax
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling function
;negative number
	mov	rsi,msg3	;moving format into rsi register
	call	printmsg	;calling function
	mov	rsi,[num2]	;moving value in num2 into rsi register
	call	printnbr	;calling function
	mov	rax,[num2]	;moving num2 value into rax register
	sal	rax,2		;shift arithmetic left(x4) on rax register
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling function
;SHR
;positive num
	mov	rsi,msg5	;moving format into rsi register
	call	printmsg	;calling function
	mov	rsi,[num1]	;moving num1 value into rsi register
	call	printnbr	;calling function
	mov	rax,[num1]	;moving num1 value into rax register
	shr	rax,2		;shift logical right(/4) on rax register
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling function
;negative num/incorrect method for division with signed ints	
	mov 	rsi,msg2	;moving format into rsi register
	call	printmsg	;calling function 
	mov	rsi,[num2]	;moving num2 value into rsi register
	call	printnbr	;calling fucntion
	mov	rax,[num2]	;moving value in num2 into rax register
	shr	rax,2		;shift logical right(/4) on rax registter
	mov	rsi,rax
	call	printres
;SAR
;positive num
	mov	rsi,msg4	;moving format into rsi register
	call	printmsg	;calling function
	mov	rsi,[num1]	;moving num1 value into rsi register
	call	printnbr	;calling function	
	mov	rax,[num1]	;moving value in num1 into rax register
	sar	rax,2		;sar(/4) twice on rax register
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling function
;negative num
	mov	rsi,msg4	;movign format into rsi register
	call	printmsg	;calling function
	mov	rsi,[num2]	;moving value in num2 into rsi register
	call	printnbr	;calling fucntion 
	mov 	rax,[num2]	;moving num2 value into rax register
	sar	rax,2		;sar(/4) twice on rax register
	mov	rsi,rax		;moving result into rsi register
	call	printres	;calling fucntion
leave 
ret
	
printmsg:
	section .data
	.fmtstr	db	10,"%s",10,0 	;defining local variable
	section .text
	mov	rdi,.fmtstr	;pushing format into rdi register
	xor	rax,rax		;zeroing rax register
	call	printf		;printing to console
	ret
printnbr:
	section .data
	.fmtstr	db	"The resulting number is %lld",10,0	;local variable
	section .text
	mov	rdi,.fmtstr	;pushing foramt into rdi register
	xor	rax,rax		;zeroing rax register
	call	printf		;printing to console	
	ret
printres:
	section .data
	.fmt	db	"The resulting number is %lld",10,0
	section .text
	mov	rdi,.fmt	;moving fmt into rdi register
	xor	rax,rax		;zeroing rax
	call	printf		;printing to console 
	ret





