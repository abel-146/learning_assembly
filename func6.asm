;func6.asm
extern printf
section .data
	first	db	"a"
	second	db	"b"
	third	db	"c"
	fourth	db	"d"
	fifth	db	"e"
	sixth	db	"f"
	seventh	db	"g"
	eighth	db	"h"
	ninth	db	"i"
	tenth	db	"j"
	fmt	db	"The string is:",10,0
section .bss
	flist	resb	11	;"length of the string plus the 0"
section .text
	global main
main:
	push	rbp
	mov	rbp,rsp		;prologue
	mov	rdi,first	;a
	mov	rsi,second	;b
	mov	rdx,third	;c
	mov	rcx,fourth	;d
	mov	r8,fifth	;e
	mov	r9,sixth	;f
	push	tenth		;pushing to stack in reverse order
	push	ninth		;i
	push	eighth		;h
	push	seventh		;g
	push	sixth		;f
	call	lfunc		;calling lfunc
	mov	rdi,fmt		;moving fmt into rdi register
	mov	rsi,flist	;moving length of sting into rsi register
	xor	rax,rax		;zeroing the rax register
	call	printf		;print to console
	leave			;epilogue
	ret			
lfunc:
	push	rbp
	mov	rbp,rsp		;prologue
	xor	rax,rax		;zeroing rax register
	mov	al,byte[rsi]	;moving rsi into lower byte of rax
	mov	[rdi],al	;storing al in memory
	mov	al,byte[rdx]	;storing rax into al
	mov	[rdi+1],al	;putting al into rdi+1
	mov	al,byte[rcx]	;repeating the process for register storage
	mov	[rdi+2],al	;^
	mov	al,byte[r8]	;^
	mov	[rdi+3],al	;^
	mov	al,byte[r9]	;^
	mov	[rdi+4],al	;^
	xor	rbx,rbx		;zeroing rbx register for use to store stack memory
	mov	rax, qword[rbp+16]	;storing rbp+16 into rax
	mov	bl,[rax]		;stroing above value into lower byte of rbx
	mov	[rdi+5],bl		;stroing above value into rdi+5
	mov	rax,qword[rbp+24]	;repeating above sequence until fulls tring in rdi regsiter
	mov	bl,[rax]		;^
	mov	[rdi+6],bl		;^
	mov	rax,qword[rbp+32]	;^
	mov	bl,[rax]		;^
	mov	[rdi+7],bl		;^
	mov	rax,qword[rbp+40]	;^
	mov	bl,[rax]		;^
	mov	[rdi+8],bl		;^
	mov	rax,qword[rbp+48]	;^
	mov	bl,[rax]		;^
	mov	[rdi+9],bl		;^
	xor	bl,bl			;zeroing the lower byter of rbx 
	mov	[rdi+10],bl		;storing null value into rdi+10
	leave				;epilogue
	ret
	
