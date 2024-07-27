.model small
.stack 100h
.data

str1 db "enter two digits:$"
str2 db "enter operation : $"
str3 db "sum is $"
str4 db "diff is $"
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
	
	mov dx , offset str2
	mov ah , 09h
	int 21h
	
	mov ah , 01h
	int 21h
	
	mov bh , al
	

	
	cmp bh , '+'
	je xx
	
	sub bl , cl
	sub bl , 30h
	mov dx , offset str4
	mov ah , 09h
	int 21h
	
	mov dl , bl
	mov ah , 02h
	int 21h	
	jmp yy
	
xx: add bl , cl
	sub bl , 30h
	mov dx , offset str3
	mov ah , 09h
	int 21h
	
	mov dl , bl
	mov ah , 02h
	int 21h	
	
	
yy:	mov ah , 4ch
	int 21h

main endp
end main