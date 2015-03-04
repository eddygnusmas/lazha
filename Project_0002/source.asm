TITLE ProgramName
;*
;* Author:      
;* DateTime:    
;* Description: 
;*

include C:\masm32\include\Irvine32.inc

.data
MSG		BYTE	"HELLO",13,10,0
.code
main 	PROC
mov		EDX,	OFFSET	MSG
call	WriteString
exit
main	ENDP
END 	main
