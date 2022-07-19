;b3.asm
extern printf
extern printb	;c function used earlier

section .data
	msg1	db 	"No bits are set: ",10,0
	msg2	db	10,"Set bit #4, that is the fifth bit:",10,0
	msg3 	db 	10,"Set bit #7, that is the 8th bit:",10,0
	msg4	db	10,"Set bit #8, that is the 9th bit:",10,0
	msg5	db	10,"Set bit #61, that is the 62nd bit:",10,0
	msg6	db	10,"clear bit 8, that is the 9th bit:",10,0
	msg7	db	10,"Test bit 61, and display rdi:",10,0
	bitflags	dq	0
section .bss
section .text
;bts means bit set and btr means bit remove
	global main
main:
	mov	rbp,rsp		;debugging
	push	rbp	
	mov	rbp,rsp		;prologue
;print title
	mov	rdi,msg1	;moving format msg1 into rdi register
	xor	rax,rax		;zeroing the rax register
	call	printf		;print to console
;print bitflags
	mov	rdi,[bitflags]	;moving the value of bitflags into rdi register
	call	printb		;calling external c function
;set bit 4-----> this is the fifth bit because the first bit is considered the 0 register
;print title
	mov	rdi,msg2		;moving msg2 format into the rdi register
	xor	rax,rax			;zeroing the rax register
	call	printf			;print to console
	bts	qword[bitflags],4	;setting bitflags bit4	
;print bitflags
	mov	rdi,[bitflags]		;moving the value of bitflags into the rdi register
	call	printb			;calling external c function
;set bit 7
	mov	rdi,msg3	;moving msg3 format into the rdi register
	xor	rax,rax		;zeroing the rax register
	call	printf		;print to console
	bts	qword[bitflags],7	;setting bitflags 7th bit
;print bitflags
	mov	rdi,[bitflags]		;moving bitflags value into rdi
	call	printb			;calling external c function

;set bit 8
	mov	rdi,msg4	;moving the msg4 format into the rdi format
	xor	rax,rax		;zeroing the rax register
	call	printf		;printing to console
	bts	qword[bitflags],8	;setting bitflags bit 8
;print bitflags
	mov	rdi,[bitflags]		;moving bitflags into rdi register
	call	printb			;calling xternal c function
;set bit 61
	mov	rdi,msg5	;moving msg5 format into rdi register
	xor	rax,rax		;zeroing rax register
	call	printf		;print to console
	bts	qword[bitflags],61	;setting bit 61 of bitflags
;print bitflags
	mov	rdi,[bitflags]	;moving bitflags into rdi register
	call	printb		;calling xternal c function
;clear bit 8
	mov	rdi,msg6	;moving msg6 format to rdi register
	xor	rax,rax		;zeroing rax register
	call	printf		;print to console
	btr	qword[bitflags],8	;removing bit 8 from bitflags
;print bitflags
	mov	rdi,[bitflags]		;moving bitflags into rdi register
	call	printb			;calling xternal c function
;test bit 61
	mov	rdi,msg7	;mvoing msg7 format into rdi register
	xor	rax,rax		;zeroing the rax register
	call	printf		;print to console
	xor	rdi,rdi		;zeroing the rdi register to mitigate conflict with dil
	mov	rax,61		;moving 61 into rax register
	xor	rdx,rdx		;zeroing rdx register
	bt	[bitflags],rax	;bt=bit test if rax equal to bitflags
	setc	dil		;setting low rdi bits /conditional set statement with c argument
;c in this context means if carry flag = 1
	call	printb		;calling xternal c fucntion
	leave
	ret
	




























