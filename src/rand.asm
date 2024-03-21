section .data

    intro: db "Jogo de adivinhação", 0x0a
    len_intro: equ $ - intro

    rnum: db "Informe um número de 0 a 10: ", 0x0a
    lrnum: equ $ - rnum

    resp: db "O número escolhido é: "
    lresp: equ $ - resp

section .bss

    param: resb 10

section .text

    global _start

_start:

    ; Apresenta o título do jogo
    call _header_game

    call _print_request
    call _input

    ; Apresenta mensagem de resp
    mov rax, 1
    mov rdi, 1
    mov rsi, resp
    mov rdx, lresp
    syscall

    call _response

_end:

    mov rax, 60
    mov rdi, 0
    syscall

_header_game:

    mov rax, 1
    mov rdi, 1
    mov rsi, intro
    mov rdx, len_intro
    syscall
    ret

_print_request:
    mov rax, 1  
    mov rdi, 1
    mov rsi, rnum
    mov rdx, lrnum
    syscall
    ret

_input:
    mov rax, 0
    mov rdi, 0
    mov rsi, param
    mov rdx, 1
    syscall
    ret

_response:
    mov rax, 1
    mov rdi, 1
    mov rsi, param
    mov rdx, 1
    syscall
    ret