.model small
.stack 100h
.data

	str1 db'Enter the 1st Number(0 to 9):$'
	str2 db'Enter the 2nd Number(0 to 9):$'
	str3 db'Sorry you have entered a wtong character$'
.code
	main proc
	mov ax,@data
	mov ds,ax
	
xx:	mov dx, offset str1
	mov ah, 09
	int 21h
	
	mov ah, 01
	int 21h
	mov cl, al
	

	mov dl, '9'
	cmp cl, dl
	ja aa
	
	mov dl, 10
	mov ah, 02h
	int 21h
	
	mov dl, 13
	mov ah, 02h
	int 21h
	
	mov dx, offset str2
	mov ah, 09
	int 21h
	
	mov ah, 01
	int 21h
	mov bl, al
	
	mov dl, '9'
	cmp bl, dl
	ja bb
	
	jmp cc
	
aa: mov dx, offset str3
	mov ah, 09
	int 21h
	
	jmp xx

bb: mov dx, offset str3
	mov ah, 09
	int 21h
	
	jmp xx
cc: 
	mov dl, 10
	mov ah, 02h
	int 21h
	
	mov dl, 13
	mov ah, 02h
	int 21h

	mov dl, cl
	mov ah, 02h
	int 21h
	
	inc cl
	cmp cl, bl
	jle cc
	
	mov ah, 4ch
	int 21h
	
	
	main endp
	end main