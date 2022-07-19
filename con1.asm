;con1.asm
section .data
	msg1	db   	"Hello, World!",10,0
	msg1len	equ		$-msg1			
   	msg2 	db    	"Your turn: ",0
	msg2len	equ		$-msg2
  	msg3  	db    	"You answered: ",0
	msg3len	equ		$-msg3		
   	inputlen equ 	10			;setting the length of input buffer	
section .bss
	input	resb	inputlen+1	;space for 0/exit
section .text
	global main
main:
	push	rbp		;
	mov	rbp,rsp		;prologue
	mov	rsi,msg1	;moving msg1 int rsi register
	mov	rdx,msg1len	;moving buffer into rdx for fucntion
	call	prints		;callign external function
;second string no new line
	mov	rsi,msg2	;setting msg2 to rsi register
	mov	rdx,msg2len	;setting the buffer for function call
	call	prints		;calling function
;input formatting
	mov	rsi,input	;moving input into rsi register/user input
	mov	rdx,inputlen	;moving buffer length into rdx register
	call	reads		;calling function
	mov	rsi,msg3	;moving msg3 format into rsi register
	mov	rdx,msg3len	;specifying buffer msg3
	call	prints		;calling function
	mov	rsi,input	;moving user inpit into rsi register
	mov	rdx,inputlen	;moving buffer size for input into rdx register
	call	prints		;calling function 
	leave
	ret
;---------------------------------
prints:
	push	rbp		;
	mov	rbp,rsp		;prologue
	mov	rax,1		;setting rax to write=1
	mov	rdi,1		;setting rdx to stdout=1
	syscall			;print to console
	leave
	ret
;---------------------------------
reads:
	push	rbp
	mov	rbp,rsp
	mov	rax,0		;0 is read in rax
	mov	rdi,1		;rdi set to 1 for stdin
	syscall			;execute above command
	leave
	ret

