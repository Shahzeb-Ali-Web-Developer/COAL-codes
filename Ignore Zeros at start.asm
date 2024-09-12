.model small
.stack 100h
.386
.data
    msg1 db 'Enter Binary: $'
.code 
	main proc
	
	mov ax, @data
	mov ds, ax
	
	mov cx, 8
	
	mov bl, 0
	
	lea dx, msg1
	mov ah, 09h
	int 21h
	
again:	mov ah, 01h
	int 21h
	
	sub al, '0'
	shl bl, 1
	or bl, al
	dec cx
	jnz again

	cmp al, 13
	je exit
	
	

; Binary Printing from Register

exit: ; new line
mov dl, 10
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h

mov cx, 8

findfirst:
	dec cx
	shl bl, 1
	jnc findfirst
	mov dl, '1'
	mov ah, 02h
	int 21h
	

	

nextbit:	shl bl, 1
			JC carryset
			mov dl, '0'
			mov ah, 02h
			int 21h
			jnz bb

carryset: mov dl, '1'
		  mov ah, 02h
		  int 21h
		  
  
bb:		  dec cx
		  jnz nextbit
		  





mov ah, 4ch
int 21h

main endp
end main