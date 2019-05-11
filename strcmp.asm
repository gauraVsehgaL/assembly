.686P
INCLUDELIB LIBCMT

PUBLIC _main

CONST	SEGMENT
$SG2657	DB	'hello', 00H
$SG2658	DB	'bye', 00H
CONST	ENDS

_TEXT SEGMENT

mystrcmp PROC

push ebp
mov ebp,esp
mov ECX, [EBP+8]		;first parameter is at +8. First string to be compared.
mov EDX, [EBP+12]		;second parameter is at +12. Second string to be compared.
loopentry: 
mov AL, BYTE PTR [ECX]
mov BL, BYTE PTR [EDX]
and al,al				;test if first string ends
and bl,bl				;test if second string ends

test al,al
jnz SOMEEXISTS			;first string not end 
test bl,bl				;second string ends 
jnz SOMEEXISTS			;second string not end
mov EAX, 0				;both equal since both ended. Zero will be returned as ans
jmp EXIT

SOMEEXISTS:
inc ECX
inc EDX
cmp AL,BL
JE loopentry
mov EAX, -1				;assuming first is smaller
JL EXIT					;ok indeed smaller
mov EAX, 1				;first is greater, so return negative

EXIT:
mov esp,ebp
pop ebp
ret

mystrcmp ENDP

_main PROC
push ebp
mov ebp, esp
PUSH OFFSET $SG2657
PUSH OFFSET $SG2658
call mystrcmp
add esp, 8 ;remove pushed params
mov esp, ebp
pop ebp
ret 0
_main ENDP

_TEXT ENDS
END