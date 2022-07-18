;bits1.asm
extern printb
extern printf
section .data
	msgn1	db	"Number 1",10,0
	msgn2	db	"Number 2",10,0
	msg1	db	"XOR",10,0
	msg2	db	"OR",10,0
	msg3	db	"AND",10,0
	msg4	db	"NOT number 1",10,0
	msg5	db	"SHL 2 lower byter of number 1",10,0
	msg6	db	"SHR 2 lower byte of number 1",10,0
	msg7	db	"SAL 2 lower byter of number 1",10,0
	msg8	db	"SAR 2 lower byte of number 1",10,0
	msg9	db	"ROL 2 lower byte of number 1",10,0
	msg10	db	"ROL 2 lower byte of number 2",10,0
	msg11	db	"ROR 2 lower byte of number 1",10,0
	msg12	db	"ROR 2 lower byte of number 2",10,0
	number1	dq	-72
	number2	dq	1064
section .bss
section .text
	global main
main:
	mov	rbp,rsp		;for debugging
	push	rbp		;
	mov	rbp,rsp		;prologue

;printing number 1

	mov	rsi,msgn1	;moving message format into rsi register
	call	printmsg	;calling printmsg function
	mov	rdi,[number1]	;moving -72 into rdi
	call	printb		;calling external function

;print number 2
	mov	rsi,msgn2	;moving number 2 format into rsi register
	call	printmsg	;calling printmsg function
	mov	rdi,[number2]	;moving 1064 into rdi register
	call	printb		;calling external function

;print xor

	mov	rsi,msg1	;moving msg format into rsi register
	call	printmsg	;calling fucntion

;xor and print

	mov	rax,[number1]	;storing num1 into rax register
	xor	rax,[number2]	;performing exclusive or on num1 and num2
	mov	rdi,rax		;moving result into rdi register
	call	printb		;calling xternal function

;print or
	
	mov	rsi,msg2	;storing format into rsi register
	call	printmsg	;calling function

;or print

	mov	rax,[number1]	;storing num1 in the rax register
	or	rax,[number2]	;perfomring OR on num1 and num2
	mov	rdi,rax		;moving result into rdi register
	call	printb		;calling xternal function

;print AND

	mov	rsi,msg3	;storing msg into rsi format
	call	printmsg	;calling function

;AND and print

	mov	rax,[number1]	;storing num1 in rax register
	and	rax,[number2]	;performing and on value of num1 and num2
	mov	rdi,rax		;storing result in rdi register
	call	printb		;calling xternal fucntion

;print NOT

	mov	rsi,msg4	;storing msg format into rsi register
	call	printmsg	;calling function

;not and print

	mov	rax,[number1]	;storing value of num1 in rax register
	not	rax		;performing not on rax register
	mov	rdi,rax		;storing result into rdi register
	call	printb		;calling xternal fucntion

;print SHL

	mov	rsi,msg5	;storing msg format into rsi register
	call	printmsg	;calling fucntion

;shl and print

	mov	rax,[number1]	;storing value of num1 into rax register
	shl	al,2		;performing shift logical left on al register
	mov	rdi,rax		;storing result into rdi register
	call	printb		;calling xternal function
	
;print SHR

	mov	rsi,msg6	;storing msg format into rsi register
	call	printmsg	;calling function

;shr and print

	mov	rax,[number1]	;storing num1 value in rax register
	shr	al,2		;performing shift logical right on al register
	mov	rdi,rax		;storing value into rdi register
	call	printb		;calling xternal function

;print sal
	
	mov	rsi,msg7	;storing msg format into rsi register
	call	printmsg	;calling function

;sal and print

	mov	rax,[number1]	;storing num1 value in rax register
	sal	al,2		;performing shift arithmetic left twice on al
	mov	rdi,rax		;storing result into rdi register
	call	printb		;calling xternal function

;print sar
	
	mov	rsi,msg8	;moving msg format into rsi register
	call	printmsg	;calling function

;sar and print
	
	mov	rax,[number1]
	sar	al,2		;performing shift arithmetic right on al
	mov	rdi,rax		;moving result into rdi register
	call	printb		;calling xternal function

;print rol num1
	
	mov	rsi,msg9	;moving msg format into rsi register
	call	printmsg	;call function
	
;rol and print
	
	mov	rax,[number1]	;moving value of num1 into rax register
	rol	al,2		;performing left roll on al register
	mov	rdi,rax		;moving result into rdi register
	call	printb		;calling xternal function

;print rol num2

	mov	rsi,msg10	;moving format into rsi register
	call	printmsg	;calling function
	
;rol and print

	mov	rax,[number2]	;storing value of number 2 into rax register
	rol	al,2		;performing left rotate twice
	mov	rdi,rax		;moving result into rdi register
	call	printb		;calling xternal c function

;print ror num 1

	mov	rsi,msg11	;moving msg format into rsi register
	call	printmsg	;calling function

;ror and print
	
	mov	rax,[number1]	;moving num1 into rax register
	ror	al,2		;performing arithemtic operation on al register
	mov	rdi,rax		;moving result into rdi register
	call	printb		;calling external fucntion

;print ror num 2		
	
	mov	rsi,msg12	;moving format into rsi register
	call	printmsg	;calling function

;ror and print
	
	mov	rax,[number2]	;moving num2 into rax register
	ror	al,2		;performing right rotate on al register
	mov	rdi,rax		;moving the result into rdi
	call	printb		;calling xternal c funtion

leave 
ret
;-----------------------------------function
printmsg:
	section .data
	.fmtstr	db	"%s",0		;defining a local variable
	section .text
	mov	rdi,.fmtstr	;moving the local format variable into rdi
	xor	rax,rax		;zeroing the rax register
	call	printf		;printing to console
	ret


















