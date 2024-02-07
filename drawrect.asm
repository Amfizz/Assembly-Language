[org 0x0100] 
jmp code
w equ 50; width offset
x equ 100
y equ 100
c equ 60 ; color
x2 equ 150
y2 equ 50
x3 equ 200
y3 equ 100


code: mov ah, 0
mov al, 13h
int 10h
mov cx, x
mov dx, y
mov al, c 
u1:
inc dx
mov ah, 0ch ; put pixel
int 10h
inc cx
cmp cx, x+w
jbe u1
 
mov cx, x2
mov dx, y2
mov al, c 
u2:
inc dx
mov ah, 0ch ; put pixel
int 10h
inc cx
cmp cx, x2+w
jbe u2
mov cx, x3
mov dx, y3
mov al, c 
u3:
inc dx
mov ah, 0ch ; put pixel
int 10h
dec cx
cmp cx, x2
jae u3
mov cx, x2
mov dx, y2
mov al, c 
u4:
inc dx
mov ah, 0ch ; put pixel
int 10h
dec cx
cmp cx, x
jae u4
mov ah, 0 ; service 0 – get keystroke
int 0x16

mov ax, 0x4c00
int 0x21