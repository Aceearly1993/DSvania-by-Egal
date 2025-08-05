.nds
.relativeinclude on
.erroronwarning on

; Several rings have special effects and apply temporary stat
; boosts, such as the Sun ring and Judgement ring.
; This allows customization of which IDs correspond to which
; ring effects.
; To change which effect an accessory ID has, copy-paste the code
; before the semi-colon to the desired line, then replace the
; original with "ldmfd r13!,{r4,r15}".
; Without additional code, the special effects rings are confined
; to local IDs ranging from 0xB to 0x16 (inclusive) with one 
; additional ID that is not confined to that range.

; by EgalLau37

Overlay86Start equ 0x22EB1A0

MiserRingID_local	equ	0x23


.open "ftc/arm9.bin", 0x2000000

.org 0x2050b30
stmfd r13!,{r4,r14}
ldr r1,=0x21002c0
mov r0,r0,lsl 0x1
ldrsh r1,[r1,r0]
ldr r4,=0x20ffd5c
cmp r1,0x16
bgt _02050b74
subs r0,r1,0xb
addpl r15,r15,r0,lsl 0x2
b _02050b74				;not within range
b JusticeRingBoosts		;0x0b
ldmfd r13!,{r4,r15}		;0x0c
b FortuneRingBoosts		;0x0d
ldmfd r13!,{r4,r15}		;0x0e
ldmfd r13!,{r4,r15}		;0x0f
ldmfd r13!,{r4,r15}		;0x10
ldmfd r13!,{r4,r15}		;0x11
b DevilRingBoosts		;0x12
ldmfd r13!,{r4,r15}		;0x13
ldmfd r13!,{r4,r15}		;0x14
b MoonRingBoosts		;0x15
b SunRingBoosts			;0x16
_02050b74:
cmp r1,MiserRingID_local
beq MiserRingBoosts
ldmfd r13!,{r4,r15}

DevilRingBoosts:
ldr r1,=0x20ffc58
ldr r0,=0xd1b71759
ldr r1,[r1,0x994]
ldrsh r3,[r4,0x6]
umull r0,r2,r1,r0
mov r2,r2,lsr 0xd
add r0,r2,0x1
add r0,r3,r0
strh r0,[r4,0x6]
ldmfd r13!,{r4,r15}

JusticeRingBoosts:
ldr r1,=0x20ffc58
ldr r0,=0x57619f1
ldr r1,[r1,0x990]
ldrsh r3,[r4,0x4]
umull r0,r2,r1,r0
mov r2,r2,lsr 0x6
add r0,r2,0x1
add r0,r3,r0
strh r0,[r4,0x4]
ldmfd r13!,{r4,r15}

FortuneRingBoosts:
ldr r1,=0x20ffc58
ldr r0,=0x36b06e71
ldr r1,[r1,0x71c]
umull r0,r2,r1,r0
sub r0,r1,r2
add r2,r2,r0,lsr 0x1
mov r2,r2,lsr 0x11
cmp r2,99		;maximum bonus
movgt r2,99
ldrsh r0,[r4,0xc]
add r0,r0,r2
strh r0,[r4,0xc]
ldmfd r13!,{r4,r15}

MoonRingBoosts:
bl 0x2050ae4
cmp r0,0x0
ldmnefd r13!,{r4,r15}
ldrsh r3,[r4,0x4]
ldrsh r1,[r4,0x6]
ldrsh r2,[r4,0x8]
ldrsh r0,[r4,0xa]	;stat boosts
add r3,r3,0x3		;str
add r2,r2,0x3		;int
add r1,r1,0x6		;con
add r0,r0,0x6		;mnd
strh r3,[r4,0x4]
strh r2,[r4,0x8]
strh r1,[r4,0x6]
strh r0,[r4,0xa]
ldmfd r13!,{r4,r15}

SunRingBoosts:
bl 0x2050ae4
cmp r0,0x0
ldmeqfd r13!,{r4,r15}
ldrsh r3,[r4,0x4]
ldrsh r1,[r4,0x6]
ldrsh r2,[r4,0x8]
ldrsh r0,[r4,0xa]	;stat boosts
add r3,r3,0x6		;str
add r2,r2,0x6		;int
add r1,r1,0x3		;con
add r0,r0,0x3		;mnd
strh r3,[r4,0x4]
strh r2,[r4,0x8]
strh r1,[r4,0x6]
strh r0,[r4,0xa]
ldmfd r13!,{r4,r15}

MiserRingBoosts:
ldr r1,=0x20ffc58
ldr r0,=0x6fd91d85
ldr r1,[r1,0x6b8]
ldrsh r2,[r4,0x8]
umull r0,r3,r1,r0
mov r3,r3,lsr 0x11
cmp r3,0x33		;maximum stat boost
movgt r3,0x33
add r1,r3,0x1
ldrsh r0,[r4,0xa]
add r2,r2,r1
strh r2,[r4,0x8]
add r0,r0,r1
strh r0,[r4,0xa]
ldmfd r13!,{r4,r15}
.pool


.org 0x2050ae4	;hour check for sun/moon rings
stmfd r13!,{r14}
sub r13,r13,0xc
add r0,r13,0x0
bl 0x200e1b8
ldr r0,[r13]	;current hour of day
cmp r0,0x6	;less than are moon hours
bcc _02050b10
cmp r0,0x12	;less than are sun hours
addcc r13,r13,0xc
movcc r0,0x1
ldmccfd r13!,{r15}
_02050b10:
mov r0,0x0
add r13,r13,0xc
ldmfd r13!,{r15}

.close

