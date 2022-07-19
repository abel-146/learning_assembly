;con2.asm
extern printf
section .data
	msg1	db    	"Hello, World!",10,0			
   	msg2  	db   	"Your turn (only a-z): ",0
  	msg3  	db    	"You answered: ",0
  	inputlen equ 	10	;input buffer		
	NL	db	0xa	
section .bss
	
	input	resb	inputlen+1 	;space for 0 with +1	

section .text
	global main
main:
	push	rbp		;
	mov	rbp,rsp		;prologue
	mov	rdi,msg1	;moving msg1 format int rdi register
	call	prints		;calling function
	mov	rdi,msg2	;moving msg3 fomrat into rdi register
	call	prints		;calling function
	mov	rdi,input	;moving input into rdi format
	mov	rsi,inputlen	;moving inputlen into rsi register
	call	reads		;calling function
	mov	rdi,msg3	;moving msg3 format into rdi register
	call	prints		;calling function
	mov	rdi,input	;moving input into rdi register
	call	prints		;calling function
	mov	rdi,NL		;moving newline to rdi
	call	prints		;calling function
	leave
	ret
;-------------------------------
prints:
	push	rbp
	mov	rbp,rsp
	push	r12		;save value
;counting characters to print
	xor	rdx,rdx
	mov	r12,rdi
.lengthloop:
	cmp	byte[r12],0	;is the byte value of r12 = 0?
	je	.done		;if above is equal jump to .done
	mov	rsi,rdi		;moving rdi register into rsi register
	mov	rax,1		;set write for syscall
	mov	rdi,1		;setting stdout for syscall
	syscall			;execute above function
.done:
pop	r12		;restoring value
leave
ret
;-------------------------------
reads:
section .data
section .bss
	.inputchar	resb 	1
section .text
			
	push	rbp		;
	mov	rbp,rsp		;prologue
	push	r12		;pushing r12 to stack
	push	r13		;pushing r13 to stack
	push	r14		;pushing r14 to stack
	mov	r12,rdi		;moving value in rdi into r12 register
	mov	r13,rsi		;moving value from rsi into r13 register
	xor	r14,r14		;zeroing r14 to act as counter
.readc:
	xor	rax,rax		;setting read rax=0
	mov	rdi,1		;setting stdin
	lea	rsi,[.inputchar]	;loading the effective adress(start) of user input	
	mov	rdx,1		;specifying character count
	syscall			;execute read of stdin
	mov	al,[.inputchar]	;storing input into lower byte of rax register
	cmp	al,byte[NL]
	je	.done		;jump to .done if al is a newline character
	cmp	al,97		;97 in hex is a
	jl	.readc		;discard if below 97 hex = a
	cmp	al,122		;122 hex = z
	ja	.readc		;discar if above 122 hex = z
	inc	r14		;increment r14 by 1
	cmp	r14,r13
	ja	.readc		;if r14 is greater than r13 buffer has been reached
	mov	byte[r12],al	;saving the lower rax register into r12 byte register
	inc	r12		;increment adress location in r12
	jmp	.readc
.done:
	inc	r12
	mov	byte[r12],0	;adding a zero for termination
	pop	r14		;restoring og values 
	pop	r13		;^	
	pop	r12		;^
	leave
	ret
	
	



























