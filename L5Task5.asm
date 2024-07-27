.model small
.stack 100h
.386
.data
var1 db 8 dup(0)
var2 db 8 dup(0)

str1 db 10, 13, "Enter a binary number up to 8 digits: $"
str2 db 10, 13, "Sum in Binary is: $"
str3 db 10, 13, "Wrong input$"
.code
	main proc
	mov ax, @data
	mov ds, ax
	
startover:	mov ch, 2
	mov cl, 8
	
again:
	mov bl, 0
	lea dx, str1
	mov ah, 09h
	int 21h
		
input:	mov ah, 01h
	int 21h
	cmp al, '1'
	ja wrong

	cmp al, 13
	je inputs_taken

	sub al, 30h
	shl bl, 1
	or bl, al
	
	dec cl
	jnz input
	jmp inputs_taken
	
wrong:
	mov cl, 8
	lea dx, str3
	mov ah, 09h
	int 21h
	jmp startover
 
 
 
 
inputs_taken: 

cmp ch, 1
Ja storing_1st
mov var2, bl

jmp adding

storing_1st: mov var1, bl
			 dec ch
			 jmp again



adding: 
mov bl, var1
add bl, var2


; Binary Printing from Register

; new line
mov dl, 10
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h


	
		mov cx, 8

nextbit:	roL bl, 1
			JC carryset
			mov dl, '0'
			mov ah, 02h
			int 21h
			jnz bb

carryset: mov dl, '1'
		  mov ah, 02h
		  int 21h
		  jmp bb
		  
  
bb:		  dec cx
		  jnz nextbit
		  
		mov ah, 4ch
		int 21h

		  


	
		  
main endp
end main