;macro.asm
extern printf

%define double-it(r)	sal 	r ,1	;single line macro 

%macro	print	2	;multiline macro
	section .data
	%%arg	db	%1,0	;first arg
	%%fmtint	db	"%s %ld",10,0	;format
	
	section .text
	mov	rdi,%%fmtint	;fmt into rdi register
	mov	rsi,%%arg	;first arg into rsi register
	mov	rdx,[%2]	;second arg into rdx register
	xor	rax,rax		;0 floating point values
	call	printf		;print to console
%endmacro

;important to remember macros are assembler dependent not a part of the actual language

section .data
	num	dq	15
section .bss
section .text
	global main
main:
	push 	rbp				;
	mov	rbp,rsp				;prologue
	print	"The number is",num		;passing num value into format
	mov	rax,[num]			;moving num into rax register
	double-it(rax)				;performing macro which shifts the value passed to  ;it arithmetic left once which is the faster operation to do multiplication
	mov	[num],rax			;moving result into num
	print	"The number time 2 is",num	;passing result into format
leave 
ret
