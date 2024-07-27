.model small
.stack 100h
.data
    string1 db 50 dup ("$")
.code
main proc

	mov ax, @data
	mov ds, ax
		
	mov si,offset string1
	mov cx,0

aa:	mov ah,01
	int 21h
	cmp al,13
	je exit
	mov [si],al
	inc cx
	inc si
	jmp aa

exit:

	dec si

bb:	
	mov al,[si]
	mov dl,al
	mov ah,02
	int 21h
	dec si
	dec cx
	jnz bb 	
		
mov ah,4ch
int 21h

main endp
end main