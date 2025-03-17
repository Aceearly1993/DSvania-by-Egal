.nds
.relativeinclude on
.erroronwarning on

; adds the item icon to the Use Item screen
; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

.org 0x203AD10
mov r0,0x38	;x-offset description, default 0x10

.org 0x203AD50
bl AlsoDrawItemIcon

.close



.open "ftc/overlay9_119", 0x2308EC0

.org 0x2308EC0+0x1000
AlsoDrawItemIcon:
stmfd r13!,{r1-r4,r14}
ldr r0,=0x2110F00
ldr r0,[r0,0x158]
add r0,0x200
ldrsh r2,[r0,0xE6]
ldr r1,=0x213D034
mov r0,0x2
mov r2,r2,lsl 0x1
ldrsh r1,[r1,r2]
ldr r0,=0x20E2724
mov r2,0xC
mla r0,r1,r2,r0
add r1,r10,0x3F8
mov r2,0x0
bl 0x202C62C
add r0,r10,0x3F8
mov r1,0x2000
bl 0x202C37C	;scaling
add r0,r10,0x3F8
mov r1,0x10
mov r2,0x98
mov r3,0x0
bl 0x202C4C8

mov r0,0x1
ldmfd r13!,{r1-r4,r15}
.pool

.close


