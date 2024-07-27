.model small
.stack 100h
.data
	
	str1 db '*$'
	str2 db 10, 13,'$'
.code
	main proc
	
	mov ax, @data
	mov ds, ax
	
	
	
	
	mov cl, 10
aa:	mov bl, 10 
	

	
	
	
bb:	
	mov dl, '*'
	mov ah, 02
	int 21h
	
	dec bl
	jnz bb
	
	mov dx, offset str2
	mov ah, 09
	int 21h
	
	
	dec cl
	jnz aa
	
	
	
	


	mov ah, 4ch
	int 21h
	
	
	main endp
	end main
	