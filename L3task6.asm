.model small
.stack 100h
.data
	
	str1 db 'Enter a number (0-9) $'
	
.code
	main proc
	
	mov ax, @data
	mov ds, ax
	
	mov dx, offset str1
	mov ah, 09
	int 21h
	
	mov ah, 01h
	int 21h
	
	mov bl,al
	mov cl, 0
	
bb:	mov dl, cl
	mov ah, 02h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	
	mov dl, 13
	mov ah, 02h
	int 21h
	
	inc cl
	
	cmp cl, bl
	jle bb
	
	mov ah, 4ch
	int 21h
	
	
	main endp
	end main
	