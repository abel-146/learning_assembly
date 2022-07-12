;jumploop.asm 
extern printf
section .data
     number dq  5
     fmt    db  "the sum from 0 to %ld is %ld",10,0
section .bss
section .text
    global main
main:
    push    rbp         ;start
    mov     rbp, rsp    ;
    mov     rbx, 0      ;counter
    mov     rax, 0      ;sum/at the end
jloop:
    add     rax,rbx     ;0+0
    inc     rbx         ;rbx is now 1 then 2 the 3 and so on until reaching 5
    cmp     rbx, [number]   ;comparing rbx value to 
    jle     jloop        ;if rbx is <= value at number(5) then retrun to top(jloop)
    ;continue if greater than
    mov     rdi, fmt     ;assiging fmt to rdi register
    mov     rsi, [number]   ;assigning 5 to rsi
    mov     rdx, rax     ;moving number that exited loop into rdx
    mov     rax, 0       ;clarifying no xmm(floating point)
    call    printf       ;printing the formatted string to console
    mov     rsp, rbp     ;epilogue
    pop     rbp          ;
    ret