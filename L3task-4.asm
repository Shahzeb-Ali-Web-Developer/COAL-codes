.model small
.stack 100h
.data
	row db 'Rows: $'
	col db 10, 13, 'Col: $'
	star db '*$'
	nline db 10, 13, '$'
	cols db 0
	

.code
	main proc
		mov ax,@data
		mov ds,ax
	sub cols, '0'
	lea dx, row
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	sub al, '0'
	mov bl, al	; rows count is in bl
	mov cols, bl	; also in cols var
	
	lea dx, col
	mov ah, 09h
	int 21h
	
	mov ah, 01h
	int 21h
	sub al, '0'
	mov bh, al	; cols count is in bh
	
	lea dx, nline
	mov ah, 09h
	int 21h
	
cprint:	lea dx, star
	mov ah, 09h
	int 21h
	dec bh
	jnz cprint
	mov bh, cols
	
	lea dx, nline
	mov ah, 09h
	int 21h
	dec bl
	jnz cprint
	


	
exit:

		mov ah,4ch
		int 21h
	
main endp	
end main