[org 0x0100]
jmp start
structure:
push bp
mov bp, sp
sub sp, 10
push ax
push bx
push cx
push si
push di
mov word[bp-2], 1
mov word[bp-4], 2
mov word[bp-6], 3
mov word[bp-8], 4
mov word[bp-10], 5
mov ax, [bp+4]
mov bx, [bp+6]
mov cx, [bp+8]
mov di, [bp+10]
add ax, [bp-6]
mov [bp+12],ax
mov si, [bp-2]
add cx,si
add cx,[bp-4]
mov [bp+14],cx
add bx,[bp-10]
sub bx, ax
add bx, di
mov [bp+16],bx
pop di
pop si
pop cx
pop bx
pop ax
mov sp, bp
pop bp
ret 8
start:
sub sp,6
mov ax, 1
push ax
mov ax, 2
push ax
mov ax, 3
push ax
mov ax, 4
push ax
call structure
pop ax
pop bx
pop cx
mov ax, 0x4c00
int 0x21