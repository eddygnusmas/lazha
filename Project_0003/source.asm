TITLE summary of array 
;****************************************************************
;	Autor: 			llexisll
;	Date: 			02:27:2015
;	Description: 	Программа подсчитывает сумму элементов массива  
;****************************************************************
.486
.MODEL flat,stdcall
OPTION CASEMAP:NONE

include c:\masm32\include\kernel32.inc
include c:\masm32\include\user32.inc
include c:\masm32\include\masm32.inc
include c:\masm32\include\msvcrt.inc

includeLib c:\masm32\lib\kernel32.lib
includeLib c:\masm32\lib\user32.lib
includeLib c:\masm32\lib\masm32.lib
includeLib c:\masm32\lib\msvcrt.lib

.data

	array 	DWORD	1000h,2000h,3000h,4000h,5000h				
	theSum	DWORD	?
	fmt		BYTE	"%d"
.code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ArraySum PROC USES esi ecx, 
		 		ptrArray:PTR DWORD,
		 		szArray:DWORD
	mov 	eax,0
	mov		esi,ptrArray
	mov		ecx,szArray
	cmp		ecx,0
	je		L2

L1:
	add		eax,[esi]
	add		esi,4
	loop 	L1

L2:
	ret
ArraySum ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main	PROC

	INVOKE	ArraySum,	ADDR array,
						LENGTHOF array 

	
	mov		theSum,eax
	INVOKE	crt_printf,addr fmt, theSum
	INVOKE 	ExitProject,0
main	ENDP
END 	main
