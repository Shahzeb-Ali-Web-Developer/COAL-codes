.model small
.stack 100h
.data

str1 db "enter two digits:$"
str2 db "error! sum is greater than 9.$"
str3 db "sum is $"

.code 
	main proc
	
	mov ax , @data
	mov ds , ax
	mov dx , offset str1
	mov ah , 09h
	int 21h
	
	mov ah , 01h
	int 21h
	
	mov bl , al
	
	mov ah , 01h
	int 21h
	
	mov cl , al
	
	add bl , cl
	
	sub bl , 30h
	
	cmp bl , 9
	jg xx
	
	mov dx , offset str2
	mov ah , 09h
	int 21h
	jmp zz
	
xx: mov dx , offset str3
	mov ah , 09h
	int 21h
	
	mov dl , bl
	mov ah , 02h
	int 21h	
	
	
zz:	mov dx , offset str2
	mov ah , 09h
	int 21h

	mov ah , 4ch
	int 21h
	

main endp
end main