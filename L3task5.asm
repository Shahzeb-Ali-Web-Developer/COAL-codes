.model small
.stack 100h
.data

.code
	main proc
	
	mov ax, @data
	mov ds, ax
	
	mov bl, al
	
	mov ah, 01
	int 21h
	
	mov bl, al
	
	xor bl, 0100000b
	
	mov dl, 10
	mov ah, 02h
	int 21h
	
	mov dl, 13
	mov ah, 02h
	int 21h
	
	mov dl, bl
	mov ah, 02h
	int 21h
	
	
	mov ah, 4ch
	int 21h
	
	
	main endp
	end main