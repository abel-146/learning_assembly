;memory.asm

section .data
	bNum	db	123
	wNum	db	12345
	warray	times	5 dw 0	;array of 5 words, containing 0
	dNum	dd	12345
	qNum1	dq	12345
	text1	db	"abc",0
	qNum2	dq	3.1415
	text2	db	"cde",0
section .bss
	bvar	resb	1
	dvar	resd	1
	wvar	resw	10
	qvar	resq	3
section .text
	global main
main:
    mov ebp, esp; for correct debugging
	push	rbp		;prologue
	mov	rbp,rsp		;
	lea	rax,[bNum]	;load adress of bNUm into rax
	mov	rax,bNum	;loading adress of bnum into rax register
	mov	rax,bNum	;loading val of bnum into rax
	mov	[bvar],rax	;loading value of rax=bNum into bvar
	lea	rax,[bvar]	;loading adress of bvar into rax
	lea	rax,[wNum]	;loading adress of wNum into rax
	mov	rax,[wNum]	;loading value of wNum into rax
	lea	rax,[text1]	;loading adress of text1 into rax
	mov	rax,text1	;loading value of text1 into rax
	mov	rax,[text1+1]	;loading the text1 2nd position value into rax
	lea	rax,[text1+1]	;loading second character position into rax
	mov	rax,[text1]	;loading in starting value of text1 into rax
	mov	rax,[text1+1]	;loading in text1 starting from 2nd position
	mov	rsp,rbp		;epilogue
	pop	rbp		;
	ret			; exit
