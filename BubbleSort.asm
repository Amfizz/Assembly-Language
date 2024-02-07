[org 0x0100] 
jmp start
array1: dw 6, 7,3, 9, 100, 5, 1, 50
lenArray1: dw 8
min: dw 0
max: dw 0
median: dw 0
statOfArray:
push bp
mov bp, sp
push ax 
push bx 
push cx 
push dx
push si 
push di
call bubblesort
mov ax,[bp+4]
mov cx, 2
div cx
cmp dx,0
jnz odd
mov di, ax
dec di
shl ax, 1
mov si, ax
mov bx, [bp+6]
mov dx,[bx+si]
shl di, 1
mov ax,[bx+di]
add ax,dx
shr ax, 1
jmp end0
odd:
shl ax,1
mov si, ax
mov bx, [bp+6]
mov ax,[bx+si]
end0:
mov[bp+12],ax
mov ax,[bx]
mov [bp+8],ax
mov si,[bp+4]
dec si
shl si,1
mov ax,[bx+si]
mov[bp+10], ax
pop di
pop si
pop dx
pop cx
pop bx 
pop ax
pop bp
ret 4
bubblesort:
push bp 
mov bp, sp 
sub sp, 2
push ax 
push bx 
push cx 
push si 
mov bx, [bp+22] 
mov cx, [bp+20] 
dec cx 
shl cx, 1 
mainloop:
mov si, 0 
mov word [bp-2], 0 
innerloop: 
mov ax, [bx+si] 
cmp ax, [bx+si+2] 
jle noswap 
xchg ax, [bx+si+2] 
mov [bx+si], ax 
mov word[bp-2], 1 
noswap: add si, 2 
cmp si, cx 
jne innerloop
cmp word[bp-2], 1 
je mainloop
pop si 
pop cx 
pop bx
pop ax 
mov sp,bp
pop bp 
ret  
start:
sub sp,8
mov ax, array1
push ax 
mov ax, [lenArray1]
push ax 
call statOfArray 
pop ax
mov [min],ax
pop bx
mov [max],bx
mov ax, bx
pop cx
mov [median], cx 
mov ax, cx
mov ax, 0x4c00
int 0x21
