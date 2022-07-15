;arithmetic.asm

extern printf

section .data
	num1		dq	128	;an int to be later used
	num2		dq	19	;same
	neg_num		dq	-12	;diplaying negative num usage
	fmt		db	"The numbers are %ld and %ld",10,0
	fmtint		db	"%s %ld",10,0
	sumi		db	"The sum is",0
	difi		db	"The difference is",0
	inci		db	"Number 1 incremented:",0
	deci		db	"Number 1 decremented:",0
	sali		db	"Number 1 shift left 2 (x4):",0
	sari		db	"Number 1 shift right 2	(/4):",0
	sariex		db 	"Number 1 shift right 2 (/4) with "
		db	"sign extension:",0
	multi		db	"The product is ",0
	divi		db	"The quotient is ",0
	remi		db	"The modulo is ",0

section .bss
	resulti		resq	1
	modulo		resq	1

section .text

	global main
main:
	push	rbp
	mov	rbp,rsp
	;printing the number to the display
	mov	rdi, fmt	;moving the format into the rdi register
	mov	rsi,[num1]	;moving the value of num1 into rsi
	mov	rdx,[num2]	;moving the value of num2 into rdx
	mov	rax,0		;moving 0 into the rax value to zero it prior to extern call
	call 	printf		;calling print to console
;-----------------------------------------addition upcoming
	mov	rax,[num1]	;moving the value of num1 into the rax register
	add	rax,[num2]	;adding the value of num2 and rax=num1
	mov	[resulti],rax	;moving the sum into resulti
;displaying the result		
	mov	rdi,fmtint	;moving the format into the rdi register	
	mov	rsi,sumi	;moving sumi into rsi register
	mov	rdx,[resulti]	;moving resulti(sum of num1+num2) into rdx
	mov	rax,0		;moving 0 into rax to zero prior to calling printf 
	call 	printf		;printing to console
;-----------------------------------------subtraction upcoming
	mov	rax,[num1]	;moving value in num1 into rax register
	sub	rax,[num2]	;subtracting num2 fromt the value in rax(num1)
	mov	[resulti],rax	;moving the difference into resulti
;displaying the result
	mov	rdi,fmtint	;moving the fmt into rdi register
	mov	rsi,difi	;moving difi string into the rsi register
	mov	rdx,[resulti]	;moving the result of subtraction into rdx register
	mov	rax,0		;zeroing the rax register
	call printf		;calling the print to console
;-----------------------------------------incrementing upcoming
	mov	rax,[num1]	;moving the value of num1 into the rax register
	inc	rax		;incrementing the value of rax(num1) by 1
	mov	[resulti],rax	;moving the result of inc rax into resulti
;displaying the result
	mov	rdi,fmtint	;moving the fmt into the rdi regsiter
	mov	rsi,inci	;moving the inci fmt into the rsi register 
	mov	rdx,[resulti]	;moving the result into the rdx register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling to print to the console
;-----------------------------------------decrementing upcoming
	mov	rax,[num1]	;moving the value of num1 into the rax register
	dec	rax		;decrementing the value in the rax register
	mov	[resulti],rax	;moving the result of dec rax into resulti
;displaying the result		
	mov	rdi,fmtint	;moving the fmt into the rdi register
	mov	rsi,deci	;moving the deci format into the rsi register
	mov	rdx,[resulti]	;moving the result into the rdx register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling to print to the console
;-----------------------------------------shift arithmetic left
	mov	rax,[num1]	;moving the value of num1 into the rax register
	sal	rax,2		;mult rax by 4
;actual action that is occuring above is the binary values are all being shifted to the left by 2 
;i.e 0001 ----> 0100=(1-->4)
	mov	[resulti],rax	;moving the value of rax sal 2 into resulti
;displaying the result
	mov	rdi,fmtint	;moving the format into rdi register
	mov	rsi,sali	;moving the sali fmt into the rsi register
	mov	rdx,[resulti]	;moving the result of the multiplication into the rdx register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling to print to console
;-----------------------------------------shift arithmetic right
	mov	rax,[num1]	;moving the value of num 1 into the rax regiser
	sar	rax,2		;dividing rax by 4
;similarily to the sal command sar shifts the binary values though this time to the right
;i.e 1100----->0011(12-->3)  
	mov	[resulti],rax	;moving the value of rax sar 2 into resulti
;displaying the result
	mov	rdi,fmtint	;moving fmt into the rdi register
	mov	rsi,sari	;moving the sari fmt into the rsi register
	mov	rdx,[resulti]	;moving the result into the rdx register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling to print to the console
;-----------------------------------------shift arithmetic right with a sign extension
	mov	rax,[neg_num]	;moving the value at neg_num into the rax register
	sar	rax,2		;shifting the value in rax by 2 to the right=*4
	mov	[resulti],rax	;moving the value derived from sar rax,2 into resulti
;displaying the result
	mov	rdi,fmtint	;moving the fmt into the rdi register
	mov	rsi,sariex	;moving the sariex format into the rsi register
	mov	rdx,[resulti]	;moving the result into the rdx register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling to print to the console
;-----------------------------------------multiplication upcoming
	mov	rax,[num1]	;moving the value at num1 into the rax register
	imul	qword[num2]	;performs multiplication on the value in the rax register
	mov	[resulti],rax	;stores ;rax value into the resulti
;displaying the result
	mov	rdi,fmtint	;moves the fmt into the rdi resister
	mov	rsi,multi	;moves the multi fmt into the rsi register
	mov	rdx,[resulti]	;moves the result into the rdx register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling a print to console
;-----------------------------------------division incoming
	mov	rax,[num1]	;moving the value of num1 into the rax register
	mov	rdx,0		;setting the rdx register to 0 needs to occur before idiv else it will result in false result/overflow when adding the remainder(modulo) into rdx
	idiv	qword[num2]	;performing division of num1/num2
	mov	[resulti],rax	;moving the current value of rax into the resulti
	mov	[modulo],rdx	;moving the rdx(remainder) into modulo
;displaying the result
	mov	rdi,fmtint	;moves fmt into rdi register
	mov	rsi,divi	;moves the divi fmt into the rsi register
	mov	rdx,[resulti]	;moves the result into the rdx regsiter
	mov	rax,0		;zeroing the rax register
	call	printf		;calling a print to the console
	mov	rdi,fmtint	;moving the fmt into the rdi register
	mov	rsi,remi	;moving the rem fmt into the rsi register
	mov	rdx,[modulo]	;moving the remainder into the rd register
	mov	rax,0		;zeroing the rax register
	call	printf		;calling a print to console
;----------------------------------------epilogue follows
	mov	rsp,rbp
	pop	rbp
	ret

