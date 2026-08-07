.nds
.relativeinclude on
.erroronwarning on

; This allows some customization of the dialogue textboxes,
; including the position and colors.
; The relevant values are labeled below.

; by EgalLau37


.open "ftc/arm9.bin", 0x2000000

.org 0x202dc38
.area 0xFC,0x69
stmfd r13!,{r4,r5,r6,r14}
sub r13,r13,0x8
mov r4,r0
mov r6,r1
ldr r3,=0x3000	;color B
str r3,[r13,0x0]
mov r0,0x94	;textbox y-position
mov r1,0x48	;textbox height
mov r2,0x10	;???
ldr r3,=0xc	;color A
bl 0x202ebf0
bl 0x202e644
mvn r0,0x0
mov r1,0x14
mov r2,0x7c
bl 0x202e758
mov r0,r6
mov r1,0x14	;text position x
mov r2,0x8c	;text position y
bl 0x202e79c
bl 0x202e628
ldr r3,=0x208ac20
ldr r3,[r3,0x0]
mov r1,0x0
strb r1,[r3,0x10]
strb r1,[r3,0x11]
add r2,r3,0x36000
ldrb r0,[r2,0xd7b]
orr r0,r0,0x2
strb r0,[r2,0xd7b]
mov r0,0x1
strb r0,[r2,0xd79]
str r4,[r2,0xd50]
strb r1,[r2,0xD58]
strb r1,[r2,0xD58+1]
strb r1,[r2,0xd5e]
strb r1,[r2,0xd61]
strb r1,[r2,0xd62]
str r1,[r2,0xd54]
strb r1,[r2,0xd65]
mov r0,0x94
add r13,r13,0x8
ldmfd r13!,{r4,r5,r6,r15}
.pool
.endarea
;arm_func_end 0x202dc38


;textbox update code?
.org 0x202a4c4
.area 0x39C,0x69
stmfd r13!,{r4-r7,r14}
sub r13,r13,0x38
ldr r7,=0x208ac20
ldr r7,[r7,0x0]
add r7,r7,0x36000
ldr r0,=0xd7a
ldrsb r3,[r7,r0]
add r0,r3,0x1
cmp r0,0x3
addls r15,r15,r0,lsl 0x2
b _0202a6f0
b _0202a4fc ; case 0
b _0202a528 ; case 1
b _0202a564 ; case 2
b _0202a5e8 ; case 3
_0202a4fc:
ldrb r1,[r7,0xd72]
add r1,r1,r3
strb r1,[r7,0xd72]
cmp r1,0x0
moveq r1,0x0
streqb r1,[r7,0xd7a]
b _0202a6f0
_0202a528:
ldr r0,=0xd48
ldrsh r0,[r7,r0]
ldrb r1,[r7,0xd4a]
ldrb r2,[r7,0xd4b]
bl 0x202a974
cmp r0,0x0
beq _0202a6f0
bl 0x202e644
mov r1,0x1
strb r1,[r7,0xd7a]
b _0202a6f0
_0202a564:
ldrb r1,[r7,0xd72]
add r1,r1,r3
strb r1,[r7,0xd72]
ldrb r0,[r7,0xd73]
cmp r1,r0
bne _0202a6f0
bl 0x202ba40
mov r0,0xd0
mov r1,0x0
bl 0x202ec8c
mov r0,0x0
strb r0,[r7,0xd7a]
mvn r3,0x0
strb r3,[r7,0xd79]
bl 0x202ef30
ldr r0,[r7,0xd50]
mov r1,0x4
strb r1,[r0,0xf]
add r13,r13,0x38
ldmfd r13!,{r4-r7,r15}
_0202a5e8:
bl 0x202ba40
bl 0x202e644
ldr r1,=0xdaf
ldrsb r1,[r7,r1]
ldr r0,=0x76c4
add r2,r2,r0
mov r0,0x0
add r4,r2,r1,lsl 0x4
bl 0x20155c8
mov r1,0x0
str r1,[r13,0x0]
str r1,[r13,0x4]
str r1,[r13,0x8]
str r1,[r13,0xc]
str r1,[r13,0x10]
add r0,r0,0x0
str r0,[r13,0x14]
str r1,[r13,0x18]
str r1,[r13,0x1c]
mov r0,r4
mov r2,0x0
mov r3,0x0
bl 0x202a860
ldr r0,=0xdaf
ldrsb r0,[r7,r0]
mov r0,r0,lsl 0x10
mov r0,r0,asr 0x10
mov r1,0x0
bl 0x2014b30
mov r0,0xd0
mov r1,0x0
bl 0x202ec8c
bl 0x202e5f4
sub r1,r7,0x3600
mov r2,0x1
strb r2,[r1,0x11]
ldrb r2,[r7,0xd7b]
bic r2,r2,0x2
strb r2,[r7,0xd7b]
mov r3,0x0
strb r3,[r7,0xd77]
strb r3,[r7,0xd7a]
strb r3,[r7,0xd79]
ldrb r2,[r7,0xd73]
strb r2,[r7,0xd72]
strb r3,[r7,0xd75]
add r13,r13,0x38
ldmfd r13!,{r4-r7,r15}
_0202a6f0:
/*
ldrb r0,[r7,0xD79]
tst r0,0x10
beq SkipPaletteCycle
ldr r1,=0xD68
add r1,r7,r1
ldrh r0,[r1]
add r0,r0,0x1
strh r0,[r1]
ldrh r0,[r1,0x2]
add r0,r0,0x1
strh r0,[r1,0x2]
SkipPaletteCycle:
*/
ldrb r1,[r7,0xd73]
ldrb r0,[r7,0xd72]
sub r0,r1,r0
mov r0,r0,lsl 0xe
bl 0x2075b28
mov r0,r0,lsl 0x10
mov r1,r0,lsr 0x10
mov r2,r1,asr 0x4
ldrb r3,[r7,0xd75]
ldr r1,=0x2086394
mov r2,r2,lsl 0x2
ldrsh r1,[r1,r2]
mov r2,r3,lsr 0x1
mul r3,r2,r1
mov r1,r3,asr 0xb
add r1,r3,r1,lsr 0x14
mov r4,r1,asr 0xc
cmp r4,0x0
ble _0202a828
ldrb r0,[r7,0xd74]
mov r1,r4
bl 0x202ec8c
ldr r1,=0x208ac20
ldr r6,[r1,0x0]
ldr r0,=0x36d68
ldr r1,=0x36d6a
ldrh r2,[r6,r0]
strh r2,[r13,0x26]
strh r2,[r13,0x20]
add r0,r6,0x36000
mov r3,0xfc
mov r5,0x7000
mov r14,0x4
ldrh r6,[r6,r1]
strh r6,[r13,0x24]
strh r6,[r13,0x22]
strh r3,[r13,0x2e]
ldrb r3,[r0,0xd74]
sub r12,r13,0x8
add r2,r13,0x20
mov r1,0x10
add r6,r3,r4
sub r3,r3,r4
add r4,r6,0x4
add r3,r3,0x4
strh r4,[r13,0x30]
strh r5,[r13,0x32]
strh r14,[r13,0x28]
strh r3,[r13,0x2a]
strh r5,[r13,0x2c]
str r2,[r13,0x0]
ldrb r0,[r0,0xd76]
str r0,[r13,0x4]
str r1,[r13,0x8]
ldrh r1,[r13,0x28]
ldrh r0,[r13,0x2a]
strh r1,[r12,0x0]
strh r0,[r12,0x2]
ldrh r0,[r13,0x2c]
strh r0,[r12,0x4]
ldrh r3,[r13,0x2e]
ldrh r2,[r13,0x30]
ldmia r12,{r0,r1}
strh r3,[r12,0x0]
strh r2,[r12,0x2]
ldrh r2,[r13,0x32]
strh r2,[r12,0x4]
ldmia r12,{r2,r3}
bl 0x2008274
add r13,r13,0x38
ldmfd r13!,{r4-r7,r15}
_0202a828:
mov r0,0xd0
mov r1,0x0
bl 0x202ec8c
add r13,r13,0x38
ldmfd r13!,{r4-r7,r15}
.pool
.endarea
;arm_func_end 0x202a4c4


.close
