.model small
.stack 100h
.386
.data
	var1 db 0
	str1 db 10, 13, "Enter a character: $"
	str2 db 10, 13, "The ASCII code of  $"
	str3 db "in binary is $"
	str4 db 10, 13, "The number of 1 bit is $"

.code
	main proc
	mov ax, @data
	mov ds, ax
	
	lea dx, str1
	mov ah, 09h
	int 21h
	
	
	
; Hexa Format storing into Register
		xor bx,bx
again:	mov ah, 01h
		int 21h
		xor ah,ah
		cmp al, 13h
		JE exit
		
		cmp al, '9'
		JA letter
		sub al, 48
		JMP aa
		
letter:	sub al, 55
aa:		roL bx, 4
		OR bx, ax		
		

		
		
; Binary Printing from Register

	lea dx, str2
	mov ah, 09h
	int 21h

; new line
mov dl, 10
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h


	
		mov cx, 16
		

nextbit:	roL bx, 1
			JC carryset
			mov dl, '0'
			mov ah, 02h
			int 21h
			jnz bb

carryset: inc var1
		  mov dl, '1'
		  mov ah, 02h
		  int 21h
		  
  
bb:		  dec cx
		  jnz nextbit
		  

		  
exit:lea dx, str4
	mov ah, 09h
	int 21h
	
	mov dl, var1
	add dl, '0'
	mov ah, 02h
	int 21h
	

		mov ah, 4ch
		int 21h
		

		  
main endp
end main