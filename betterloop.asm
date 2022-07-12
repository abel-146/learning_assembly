; betterloop.asm
extern printf
section .data
    msg dq  5
    fmt db  "the sum from 0 to %ld is %ld",10,0
section .bss
section .text
    global main
main:
    push    rbp    ;initialization for debugging
    mov     rbp,rsp ;
    mov     rcx, [msg]  ;assigning the msg 5 to rcx
    mov     rax, 0      ;assigning 0 to rax register
bloop:
    add     rax, rcx    ;adding the counter(0) and msg =rax
    loop    bloop       ;loop while decreasing rcx with 1
    ;this action continues untill rcx can no longer be decremented as a natural number
    mov     rdi, fmt    ;assigning the fmt to rdi
    mov     rsi, [msg]  ;assigning the msg to rsi to be displayed in format
    mov     rdx, rax    ;assigning the looped value now 15 to paramater for printf
    mov     rax, 0      ;clearing rax register 0
    call    printf  
    mov     rsp, rbp    ;epilogue sequence
    pop     rbp         ;
    ret
    
    