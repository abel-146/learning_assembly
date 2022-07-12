;jump.asm
extern printf
section .data
    number1     dq      42
    number2     dq      41
    fmt1        db      "NUMBER1 > = NUMBER2",10,0
    fmt2        db      "NUMBER1 < NUMBER2",10,0
section .bss
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    push    rbp                 ;initialization
    mov     rbp, rsp            ;
    mov     rax, [number1]      ;moving number 1 into rax
    mov     rbx, [number2]      ;moving number 2 to register
    cmp     rax, rbx            ;comparing registers
    jge     greater             ;if rax greater or equal jump to greater
    mov     rdi, fmt2           ;rax is smaller
    mov     rax, 0              ;no xxm
    call    printf              ;print fmt2 to console
    jmp     exit                ;graceful exit
greater:
    mov     rdi, fmt1           ;moving fmt1 into regsiter
    mov     rax,0               ;clarifying no xxm
    call    printf              ;call to print
exit:
    mov     rsp, rbp
    pop     rbp
    ret