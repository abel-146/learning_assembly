;revstring.asm
extern printf
section .data
	strng	db	"ABCDE",0
	strnln	equ	$-strng-1	;using the -1 to exclude 0
	fmt1	db	"The original string: %s",10,0
	fmt2	db	"The reversed string: %s",10,0
section .bss
section .text
	global main
main:
	push	rbp			;prologue
	mov	rbp,rsp			;
;printing the original string
	mov	rdi,fmt1		;moving the fmt1 into the rdi register
	mov	rsi,strng		;moving the string into the rsi register
	xor	rax,rax			;clearing the rax register
	call	printf			;printing to console
;pushing the individual character of the string to the stack
	xor	rax,rax			;zeroing the rax register
	mov	rbx,strng		;moving the string into rbx register
	mov	rcx,strnln		;moving the length of the string into the rcx register
	xor	r12,r12			;zeroing the r12 register
pushLoop:
	mov	al,byte[rbx+r12]	;moving the char into al register(r12 will be incremented through the loop)
	push	rax			;pushing rax to the stack
	inc	r12			;incrementing r12
	loop	pushLoop		;initiate the loop
;pop each individual string from the stack
;this will eventually result in a reversed string
	mov	rbx,strng		;moving the string into the rbx register
	mov	rcx,strnln		;moving the length of the string into rcx
	xor	r12,r12			;zeroing r12
popLoop:
	pop	rax			;popping a char from the stack
	mov	byte[rbx+r12],al	;moving the lower byte of rax(char) into string
	inc	r12			;increment r12
	loop	popLoop			;initiating loop
		
	mov	byte[rbx+r12],0		;terminating string with 0(success)
;print the reverse string
	mov	rdi,fmt2		;moving the fmt2 into the rdi register
	mov	rsi,strng		;moving the string into the the rsi register
	xor	rax,rax			;zeroing rax
	call printf			;calling ptint to console
;prologue	
	mov	rsp,rbp
	pop	rbp
	ret
