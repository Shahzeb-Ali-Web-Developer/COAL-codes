.model small
.stack 100h
.data
    str1 db 'Enter the 1st Number(0 to 9):$'
    str2 db 'Enter the 2nd Number(0 to 9):$'
    str3 db 'Sorry you have entered a wrong character$'
    str4 db 'Error: Out of range characters entered consecutively. Exiting...$'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 3
    jmp input1

input1:
    mov dx, offset str1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    cmp al, '0'
    jb input_error1
    cmp al, '9'
    ja input_error1
    mov cl, al

    jmp input2

input2:
    mov dx, offset str2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    cmp al, '0'
    jb input_error2
    cmp al, '9'
    ja input_error2
    mov dl, al

    cmp cl, dl
    ja input_error3

    mov bl, cl
print_numbers:
    mov ah, 02h
    mov dl, bl
    int 21h
    inc bl
    cmp bl, dl
    jle print_numbers

exit_or_restart:
    mov dx, offset str4
    mov ah, 09h
    int 21h
    jmp end_program

input_error1:
    mov dx, offset str3
    mov ah, 09h
    int 21h
    jmp input1

input_error2:
    mov dx, offset str3
    mov ah, 09h
    int 21h
    jmp input2

input_error3:
    mov dx, offset str3
    mov ah, 09h
    int 21h
    jmp input1

end_program:
    mov ah, 4ch
    int 21h

main endp
end main
