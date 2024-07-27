.model small
.stack 100h
.386
.data

str1 db 10, 13, "Enter a binary number up to 16 digits: $"
str2 db 10, 13, "Its HEXA is $"
str3 db 10, 13, "Wrong input$"
.code
	main proc
	mov ax, @data
	mov ds, ax

    mov cx, 16
	
again:
	mov bx, 0
	lea dx, str1
	mov ah, 09h
	int 21h
		
input:	mov ah, 01h
	int 21h
	cmp al, '1'
	ja wrong

	cmp al, 13
	je input_taken

	sub al, 30h
	shl bx, 1
	or bl, al
	
	dec cx
	jnz input
	jmp input_taken
	
wrong:
	mov cx, 16
	lea dx, str3
	mov ah, 09h
	int 21h
	jmp again
 
 
 
input_taken: 
; printing in Hexa

lea dx, str2
mov ah, 09h
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