.nds
.relativeinclude on
.erroronwarning on

; This patch allow configuring how much gold is added per money
; pick-up type.
; This also optimizes the code to take up less space, and adding
; new money pickups is easier since the values are read from a
; table instead of being hardcoded values.
; The values are located near the bottom in the "MoneyIDToMoneyValue"
; table.
; The SFX ID to play when picking up money can also be configured
; here.

; by EgalLau37

Overlay86Start equ 0x22EB1A0

.open "ftc/arm9.bin", 0x2000000

;PickupMoney
;routine that handles picking up gold
.org 0x2062eb8
.area 0x158,0x69
stmfd r13!,{r3,r4,r14}
mov r4,r0
bl 0x2062c78
cmp r0,0x0
ldmnefd r13!,{r3,r4,r15}
sub r13,r13,0x4
add r0,r4,0x100
ldrh r0,[r0,0x3c]
cmp r0,0x0
beq _02062f00
ldr r12,=0x2100398
mov r3,r0,asr 0x5
ldr r2,[r12,r3,lsl 0x2]
and r0,r0,0x1f
mov r1,0x1
orr r0,r2,r1,lsl r0
str r0,[r12,r3,lsl 0x2]
_02062f00:
ldr r0,[r4,0xe0]
add r0,r0,0x3d
add r0,r0,0x400
mov r0,r0,lsl 0x10
mov r0,r0,lsr 0x10
bl 0x209d148
mov r1,0x0
str r1,[r13,0x0]
add r1,r4,0x30
ldr r0,=0x11a0000d	;SFX to play when picking up money
ldmia r1,{r1,r2,r3}
bl 0x20aa508
ldr r0,[r4,0xe0]
cmp r0,0x6
ldr r1,=MoneyIDToMoneyValue
ldr r1,[r1,r0,lsl 0x2]
ldr r0,=0x20ffc58
ldr r2,[r0,0x6B8]
add r1,r1,r2
ldr r2,=9999999
cmp r1,r2
strle r1,[r0,0x6B8]
strgt r2,[r0,0x6B8]
add r13,r13,0x4
ldmfd r13!,{r3,r4,r15}
.pool

MoneyIDToMoneyValue:
.dw 1
.dw 10
.dw 50
.dw 100
.dw 500
.dw 1000
.dw 2000
.dw 5000

.close


