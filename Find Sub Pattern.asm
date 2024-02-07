[org 0x0100]
jmp start
a: dw 1110111100001010b
b: dw 111100b
index: dw 0
print_index:
push bp
mov bp, sp
push ax
push bx
push cx
push dx
push si
push di
mov bx,[bp+4]
mov dx,0000000000000000b
add bx, dx
mov cx, 0
l0: 
shl bx, 1
inc cx
jnc l0
rcr bx, 1
dec cx
mov di ,1111111111111111b
mov dx, cx
l2:
shl di,1
dec dx
cmp dx,0
jnz l2
mov si, -1
mov dx,0
l1:
mov ax,[bp+6]
and ax,di
cmp ax, bx
jnz end
mov si, dx
end:
shr bx, 1
shr di, 1
inc dx
dec cx
cmp cx,-1
jnz l1
mov[bp+8],si
pop di
pop si
pop dx
pop cx
pop bx
pop ax
pop bp
ret 4
start: 
sub sp,2
push word[a]
push word[b]
call print_index
pop ax
mov[index],ax
mov ax, 0x4c00
int 0x21

