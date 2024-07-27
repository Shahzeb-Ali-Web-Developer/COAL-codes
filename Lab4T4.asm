.model small
.stack 100h
.data
    str1 db "Enter a String:$" 
	

.code
main proc

      
            mov ax,@data
            mov ds,ax

      
            mov dx,offset str1
            mov ah,09h
            int 21h

      
            mov bl,0

      
      aa:   mov ah,01h
            int 21h
          
      
            cmp al,13
            je  exit
    
      
            cmp al,'A'
            je  equal
            cmp al,'E'
            je  equal
            cmp al,'I'
            je  equal
            cmp al,'O'
            je  equal
            cmp al,'U'
            je  equal
            jmp aa

      
      equal:inc bl
            jmp aa
    
      
      exit: 

      
            mov dl,10
            mov ah,02h
            int 21h
            mov dl,13
            mov ah,02h
            int 21h

           add bl,48
            mov dl,bl
            mov ah,02
            int 21h


            mov ah,4ch
            int 21h
        
main endp
end main