.686P
INCLUDELIB LIBCMT

PUBLIC _main

_TEXT SEGMENT

mymemset PROC

push ebp
mov ebp,esp
mov EDI, [EBP+8] ;first parameter is at +8. Pointer to be set.
mov EAX, [EBP+12] ;value to be memsetted i.e. param 2.
mov ecx, [EBP+16] ;param3 i.e. size.
rep STOSB ;store.
mov esp,ebp
pop ebp
ret

mymemset ENDP

_main PROC
push ebp
mov ebp, esp
sub esp, 10	;some 10 bytes structure on stack.
PUSH 10 ;param3(size)
PUSH 0 ;param2(value)
lea EAX, DWORD PTR [EBP-10]
PUSH EAX ;param1(pointer)
call mymemset
add esp, 12 ;remove pushed params
mov esp, ebp
pop ebp
ret 0
_main ENDP

_TEXT ENDS
END