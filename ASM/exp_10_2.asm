; 编程,计算data段中第一组数据的3次方,结果保存在后面一组dword单元中
assume cs:codesg,ds:datasg

datasg segment
  dw 1,2,3,4,5,6,7,8
  dd 0,0,0,0,0,0,0,0
datasg ends

codesg segment
  start:
    mov ax,datasg
    mov ds,ax
    mov si,0
    mov di,16
    mov cx,8
    s:
      mov bx,ds:[si]
      call f1
      ; mov ds:[di+10h],ax
      ; mov ds:[di+12h],dx
      mov [di],ax
      mov [di].2,dx
      add si,2
      add di,4
      ; add di,4
      loop s
    mov ax,4c00h
    int 21h

   f1:
      mov ax,bx
      mul bx
      mul bx
      ret
codesg ends

end start

