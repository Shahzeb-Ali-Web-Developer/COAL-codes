.model small
.stack 100h
.386
.data
.code
	main proc
	mov ax, @data
	mov ds, ax
	
; Hexa Format storing into Register
		xor bx,bx
		mov cx, 4
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
		
		dec cx
		JNZ again
		
		

		
		
; Binary Printing from Register

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

carryset: mov dl, '1'
		  mov ah, 02h
		  int 21h
		  
  
bb:		  dec cx
		  jnz nextbit
		  

		  
		
; printing in Hexa

; new line
mov dl, 10
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h

	mov cx, 4
	
nexthexa:	ROL bx, 4
	
	mov dl, bl
	and dl, 0Fh
	
	cmp dl, 9
	JA alphabet
	jmp integer
	
integer : add dl, 30h
		  mov ah, 02h
		  int 21h
		  dec cx
		  jnz nexthexa
		  jmp exit
		  
alphabet:  add dl, 37h
		   mov ah, 02h
		   int 21h
		   dec cx
		   jnz nexthexa
		   jmp exit
		   
		  
exit:	mov ah, 4ch
		int 21h
		

		  
main endp
end main