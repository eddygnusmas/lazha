TITLE Finite program

.686
.MODEL	flat,stdcall
OPTION	CASEMAP:NONE

INCLUDE	C:\masm32\include\kernel32.inc
INCLUDE	C:\masm32\include\masm32.inc
INCLUDE	C:\masm32\include\user32.inc
INCLUDE	C:\masm32\include\msvcrt.inc
INCLUDELIB	C:\masm32\lib\kernel32.lib
INCLUDELIB	C:\masm32\lib\masm32.lib
INCLUDELIB	C:\masm32\lib\user32.lib
INCLUDELIB	C:\masm32\lib\msvcrt.lib

.const
	endl				BYTE	0Dh,0Ah,0
	
.data
	InvalidInputMsg		BYTE	"Incorrect Output",0Dh,0Ah,0
	frmt				BYTE	'%c'
.data?
	var1				BYTE	?		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.code
main PROC
StateA:
	call	GetNext
	mov		al,var1
	cmp		al,30h		; al < '0' --> jmp StateB
	jb		StateB		
	cmp		al,39h		; al > '9' --> jmp StateB
	ja		StateB
	jmp		StateA		;; if digit - jump to StateC

StateB:				
	call	DisplayErrorMsg
	jmp		Quit
	
Quit:
	INVOKE	crt_printf,addr endl
	INVOKE	crt__getch
	INVOKE	crt_exit,0
main ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GetNext PROC
    INVOKE crt_scanf,ADDR frmt,ADDR var1
ret
GetNext ENDP

DisplayErrorMsg PROC
    INVOKE crt_printf,ADDR InvalidInputMsg
ret
DisplayErrorMsg	ENDP

end main	