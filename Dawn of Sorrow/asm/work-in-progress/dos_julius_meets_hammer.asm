.nds
.relativeinclude on
.erroronwarning on


.open "ftc/arm9.bin", 0x2000000
.org 0x209BA64	;Hammer GFX ID for object76
.dw 0x4CC
.dw 0x2
.close


.open "ftc/overlay9_0", 0x219E3E0

.org 0x222C8EC	;object 76
.dw Object40_create
.org 0x222CAC8
.dw Object40_update

.org 0x21D4BD0
ldr r14,=SomaFightDialogueTable
.org 0x21D4BD8
mov r3,r3
mov r3,r3
mov r3,r3
.org 0x21D4CDC
.pool;.dw SomaFightDialogueTable
.org 0x21D4BF4
ldr r1,[r14,r1,lsl 0x2]
.close



.open "/ftc/overlay9_1", 0x2230A00

.org 0x22378FC
.dw SomaFightVoiceClip_boss
.org 0x2238940
.dw SomaFightVoiceClip_boss

.org 0x2299464	;SomaFightVoiceClip_player
.dw 0x6067
.dw 0x6064
.dw 0x6065
.dw 0x6066
.dw 0x6067
.dw 0xFFFFFFFF
.dw 0xFFFFFFFF
.dw 0xFFFFFFFF

.close



Overlay41Start equ 0x2308920
.open "ftc/overlay9_41", Overlay41Start

.org Overlay41Start+0x1000

Object40_update:
stmfd	r13!,{r4,r5,r14}
sub	r13,r13,0x4
mov	r4,r0
add	r5,r4,0xD0
bl	0x21D9BDC
ldrb	r0,[r4,0xD]
cmp	r0,0xFF
beq	branch_FF
cmp	r0,0x0
blt	Object40_end
cmp r0,0x2
addls r15,r15,r0,lsl 0x2
b	Object40_end
b object40_s0
b object40_s1
b object40_s2

object40_s0:
mov	r0,r4
mvn	r1,0x0
mov	r2,0x60
mov	r3,0x0
bl	0x21D9114	;ActorCheckXPos
cmp	r0,0x1
ldreq	r0,[r5,0x40]
orreq	r0,r0,0x10	;01 - critical, 40 - look up
streq	r0,[r5,0x40]
beq	Object40_end
mov	r0,r4
ldr	r1,=0x4CF
bl	0x202DC38
mov	r0,0x0
strb	r0,[r4,0xF]
ldrb	r0,[r4,0xD]
add	r0,r0,0x1
strb	r0,[r4,0xD]
b	Object40_end

object40_s1:
ldrb	r0,[r4,0xF]
cmp	r0,0x0
beq	Object40_end
mov	r0,r4
mov	r1,0x3
mov	r2,0x0
bl	0x21D9330	;ActorSetState
mov	r0,r4
mov	r1,0x2
mov	r2,0x1000
bl	0x21D92E8
ldr	r0,[r5,0x14]
sub	r3,r13,0x8
add	r0,r0,0x2C
ldmia	r0,{r0-r2}
stmia	r3,{r0-r2}
ldmia	r3,{r2,r3}
mov r1,0x20
mov r2,0x20
mov r3,0x20

ldr	r0,=0x5124
bl	0x2029A54
mov	r0,0x0
mvn	r1,0xF
mov	r2,0x1E
bl	0x20080DC
ldrb	r0,[r4,0xD]
add	r0,r0,0x1
strb	r0,[r4,0xD]
b	Object40_end

object40_s2:
bl	0x200806C
cmp	r0,0x0
bne	Object40_end
mvn	r0,0xF
mov	r1,0x0
mov	r2,0x1E
bl	0x20080DC
mov	r0,r4
mov	r1,0x3
bl	0x21D9624
ldr	r1,=0x208AC20	;PointerToGameObject
mov	r0,r4
ldr	r2,[r1]
mov	r1,0x1
add	r3,r2,0x36000
ldrb	r12,[r3,0xA78]
mov	r2,0x4
orr	r12,r12,0x10
strb	r12,[r3,0xA78]
bl	0x21D9B5C
mov	r0,r4
bl	0x2012AE0	;DeleteAndUnloadEntity
add	r13,r13,0x4
ldmfd	r13!,{r4,r5,r15}

branch_FF:
ldrb	r0,[r4,0xE]
cmp	r0,0x0
beq	point5
cmp	r0,0x1
beq	point4
b	Object40_end
point5:
bl	0x202DC1C
mov	r0,r4
mov	r1,0x2
bl	0x21D9624
ldr	r0,=0x208AC20	;PointerToGameObject
ldr	r0,[r0]
add	r0,r0,0x36000
ldrb	r1,[r0,0xA78]
orr	r1,r1,0x10
strb	r1,[r0,0xA78]
ldrb	r0,[r4,0xE]
add	r0,r0,0x1
strb	r0,[r4,0xE]
b	Object40_end
point4:
ldrsb	r0,[r5,0x4B]
mov	r1,0x0
mov	r2,0x1E
bl	0x20080DC
mov	r0,r4
mov	r1,0x1
mov	r2,0x4
bl	0x21D9B5C
mov	r0,r4
bl	0x2012AE0	;DeleteAndUnloadEntity
add	r13,r13,0x4
ldmfd	r13!,{r4,r5,r15}

Object40_end:
mov	r0,r4
bl	0x21D9B6C
add	r13,r13,0x4
ldmfd	r13!,{r4,r5,r15}



Object40_create:
stmfd	r13!,{r4,r14}
sub	r13,r13,0x8
mov	r1,0x1B
mov	r2,0x1
mov	r3,0x3
mov	r4,r0
bl	0x21D9CEC
cmp	r0,0x0
bne	Object40_spawn
mov	r0,r4
bl	0x2012AE0	;DeleteAndUnloadEntity
add	r13,r13,0x8
ldmfd	r13!,{r4,r15}

Object40_spawn:
mov r0,0xC0
str r0,[r13]
mov r0,r4
mov r1,0x3
mov r2,0x0
mov r3,0xB8
bl	0x21D9668	;ActorSpawn
mov r0,r4
mov r1,0x3
mov r2,0x0
mov r3,0x2

bl 0x21D922C;	0x21D91B8	;	;
add	r13,r13,0x8
ldmfd	r13!,{r4,r15}

.pool

;create: 02309B14
;update: 02309920


;hammer shop
; 021B9EC4
; 021BA238

; yoko recruit
;021D519C
;021D4F8C

SomaFightDialogueTable:
.dw 0x4F0
.dw 0x4D2
.dw 0x4D3
.dw 0x4D5
.dw 0x4D4
.dw 0x3CD
.dw 0x3CD
.dw 0x3CD

SomaFightVoiceClip_boss:
.dw 0x50EF
.dw 0x5133
.dw 0x5120
.dw 0x50BF
.dw 0x50C5
.dw 0xFFFFFFFF
.dw 0xFFFFFFFF
.dw 0xFFFFFFFF


.close


