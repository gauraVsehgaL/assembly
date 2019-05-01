.686P
INCLUDELIB LIBCMT

PUBLIC _main

CONST	SEGMENT
$SG2657	DB	'hello', 00H
CONST	ENDS

EXTRN	_strlen:PROC

_TEXT SEGMENT

mystrchr PROC

push ebp
mov ebp,esp
mov EDI, [EBP+8] ;first parameter is at +8
MOV EBX, EDI ;save original pointer
push DWORD PTR [EBP + 8]
call _strlen
mov ecx, eax ;check only length characters.
add ecx, 1 ;you might be asked to check for null as well which isn't included in length.
add esp, 4 ;remove pushed parameter from stack since cdecl
mov EAX, [EBP + 0Ch]; we want to find second param in first
repne SCASB ;search  in string.
dec edi ;bring it back to found character since it gets incremented
mov eax, edi	;edi might very well be zero which means not found.
mov esp,ebp
pop ebp
ret

mystrchr ENDP

_main PROC
PUSH 104 ;search for 'h'
PUSH OFFSET $SG2657
call mystrchr
add esp, 8
ret 0
_main ENDP

_TEXT ENDS
END
