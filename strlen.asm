.686P
INCLUDELIB LIBCMT

PUBLIC _main

CONST	SEGMENT
$SG2657	DB	'hello', 00H
CONST	ENDS

_TEXT SEGMENT

mystrlen PROC

push ebp
mov ebp,esp
mov EDI, [EBP+8] ;first parameter is at +8
XOR AL,AL ; we want to find zero in string
MOV EBX, EDI ;save original pointer
mov ecx, -1 ;this is important.since while(ecx!=0){check(); ecx--} So ecx should not become zero.
repne SCASB ;search 0 in string.
sub EDI,EBX ;edi = edi - ebx
dec edi ;remove count of null character
mov EAX,EDI ;put ans in eax.
mov esp,ebp
pop ebp
ret

mystrlen ENDP

_main PROC
PUSH OFFSET $SG2657
call mystrlen
add esp, 4
ret 0
_main ENDP

_TEXT ENDS
END