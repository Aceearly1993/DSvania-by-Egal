.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the Zephyr soul code that includes
; the code from the JP version that plays Soma's voice clip 
; which was removed from the US version.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x220d0ac
.area 0x318,0x69
func_ov000_0220d0ac:
SoulZephyr_Cast:
stmfd r13!,{r4-r7,r14}
sub r13,r13,0x1c
mov r5,r0
ldr r4,[r5,0x214]
ldr r6,=0x208ac20
ldr r6,[r6]
bl 0x220eb14
cmp r0,0x0
bne _0220d0dc
mov r0,0x0
mov r1,r0
bl 0x2006f38
cmp r0,0x0
beq _0220d12c
_0220d0dc:
add r0,r6,0x36800
ldrsh r0,[r0,0xc4]
cmp r0,0x0
beq _0220d118
mov r0,0x0
bl 0x200f330
ldr r0,=0x3002
bl 0x204f43c
add r0,r6,0x36800
mov r1,0x0
strh r1,[r0,0xc4]
_0220d118:
mov r0,r5
bl 0x2012ae0
add r13,r13,0x1c
ldmfd r13!,{r4-r7,r15}
_0220d12c:
add r0,r6,0x36800
mov r1,0x1
strh r1,[r0,0xc4]
ldrb r0,[r5,0xd]
cmp r0,0x3
addls r15,r15,r0,lsl 0x2
b _0220d394
b _0220d160 ; case 0
b _0220d1d0 ; case 1
b _0220d268 ; case 2
b _0220d348 ; case 3
_0220d160:
ldr r1,=0x21c52ec
str r1,[r5,0x4]
mov r0,0x0
str r0,[r13,0x0]
str r0,[r13,0x4]
ldr r0,[r5,0x210]
add r1,r4,0x2c
and r0,r0,0x1
str r0,[r13,0x8]
mov r0,r5
ldmfd r1,{r1,r2,r3}
bl 0x20198d4
ldr r1,=0x5980
str r1,[r5,0x34]
mov r0,r5
bl 0x200d0bc
mov r0,r5
mov r1,0x1
mov r2,0x2
bl 0x200d020
ldr r1,[r5,0x70]
orr r1,r1,0x8
str r1,[r5,0x70]
ldr r1,=0x50ff
mov r0,r5
bl 0x220f1bc	;0x220f3dc - JP
mov r0,0x80
strh r0,[r5,0x1a]
mov r0,0x1
strb r0,[r5,0xd]
b _0220d394
_0220d1d0:
mov r0,0x0
str r0,[r13,0x0]
mvn r0,0x3f
str r0,[r13,0x4]
ldr r1,[r4,0xd0]
and r1,r1,0x4
str r1,[r13,0x8]
add r0,r4,0x2c
ldmfd r0,{r1,r2,r3}
add r0,r13,0xc
bl 0x2019894
mov r0,0x100
str r0,[r13,0x0]
str r0,[r13,0x4]
add r1,r13,0xc
mov r0,r5
ldmfd r1,{r1,r2,r3}
bl 0x20199f0
mov r0,r5
bl 0x21c339c
mov r0,r5
bl 0x220d4c8
cmp r0,0x0
beq _0220d250
mov r0,0x2
strb r0,[r5,0xd]
add r1,r5,0x2c
mov r0,0xda
ldmfd r1,{r1,r2,r3}
bl 0x2029b38
ldr r0,=0x3002
bl 0x204f470
_0220d250:
ldr r0,[r5,0x14]
str r0,[r5,0x50]
ldr r0,[r5,0x14]
rsb r0,r0,0x2000
str r0,[r5,0x54]
b _0220d394
_0220d268:
mov r0,0x0
str r0,[r13,0x0]
mvn r0,0x3f
str r0,[r13,0x4]
ldr r1,[r4,0xd0]
and r1,r1,0x4
str r1,[r13,0x8]
add r0,r4,0x2c
ldmfd r0,{r1,r2,r3}
add r0,r13,0xc
bl 0x2019894
mov r0,0x100
str r0,[r13,0x0]
str r0,[r13,0x4]
add r1,r13,0xc
mov r0,r5
ldmfd r1,{r1,r2,r3}
bl 0x20199f0
mov r0,r5
bl 0x21c339c
mov r0,r5
bl 0x200ce00
ldrsh r0,[r5,0x18]
sub r0,r0,0x1
strh r0,[r5,0x18]
ldrsh r3,[r5,0x18]
ldr r1,=0x88888889
ldr r2,=0x3c
smull r0,r4,r1,r3
add r4,r3,r4
mov r4,r4,asr 0x5
mov r0,r3,lsr 0x1f
add r4,r0,r4
smull r0,r1,r2,r4
subs r4,r3,r0
bne _0220d304
ldr r0,=0x173
bl 0x2029bf0
b _0220d314
_0220d304:
cmp r4,0x1e
bne _0220d314
mov r0,0x174
bl 0x2029bf0
_0220d314:
ldrsh r0,[r5,0x18]
cmp r0,0x0
bne _0220d394
add r1,r5,0x2c
mov r0,0x180
ldmfd r1,{r1,r2,r3}
bl 0x2029b38
ldr r1,[r5,0x70]
orr r1,r1,0x8
str r1,[r5,0x70]
mov r0,0x3
strb r0,[r5,0xd]
b _0220d394
_0220d348:
mov r0,r5
bl 0x220d3c4
cmp r0,0x0
ldreq r0,[r5,0x50]
streq r0,[r5,0x14]
beq _0220d394
add r1,r6,0x36800
mov r0,0x0
strh r0,[r1,0xc4]
bl 0x200f330
ldr r0,=0x3002
bl 0x204f43c
mov r0,r5
bl 0x2012ae0
add r13,r13,0x1c
ldmfd r13!,{r4-r7,r15}
_0220d394:
ldr r0,[r5,0x14]
bl 0x200f330
add r13,r13,0x1c
ldmfd r13!,{r4-r7,r15}
.pool
.endarea
;arm_func_end 0x220d0ac


.close
