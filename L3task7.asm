.model small
.stack 100h
.data
	
	str1 db 'Enter a number (0-9) $'
	
.code
	main proc
	
	mov ax, @data
	mov ds, ax
	
	mov dl, '?'
	mov ah, 02
	int 21h
	
	mov ah, 01h
	int 21h
	mov cl, al
	
	mov ah, 01h
	int 21h
	mov bl, al
	
	mov dl, 10
	mov ah, 02h
	int 21h
	
	mov dl, 13
	mov ah, 02h
	int 21h
	
	cmp bl, cl
	jg xx
	
	mov dl, bl
	mov ah, 02h
	int 21h
	
	mov dl, cl
	mov ah, 02h
	int 21h
	
	jmp zz
	
xx: mov dl, cl
	mov ah, 02h
	int 21h
	
	mov dl, bl
	mov ah, 02h
	int 21h
	
	
	
	
zz:	mov ah, 4ch
	int 21h
	
	
	main endp
	end main
	