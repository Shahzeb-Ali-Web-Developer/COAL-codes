.model small
.stack 100h
.386
.data

	ask db '?$'
.code

	main proc
	
	mov ax, @data
	mov ds, ax
	
	
	lea dx, ask
	mov ah, 09h
	int 21h
	
	mov cx, 2
	
mov dl, 10
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h


	
again:	mov ah, 01h
	int 21h
	dec cx
	cmp cx, 1
	ja first
	mov bh, al
	
	cmp cx, 0
	je exit

first : mov bl, al
		jmp again

exit:
	cmp bh, bl
	ja swap
	jmp print

swap: xchg bh, bl

print: mov dl, bh
		mov ah, 02h
		int 21h
		
		mov dl, bl
		mov ah, 02h
		int 21h

mov ah, 4ch
int 21h

main endp
end main