.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the entirety of the Great Axe
; Armor soul code and changes the ID of the voice clip
; played when casting this soul to the one used in the JP version.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x220a2c8
.area 0x378,0x69
func_ov000_0220a2c8:
SoulGreatAxeArmor_Update:
stmfd r13!,{r4,r5,r14}
mov r5,r0
ldr r4,[r5,0x214]
bl 0x220ea58
cmp r0,0x0
ldmnefd r13!,{r4,r5,r15}
sub r13,r13,0x14
ldrb r0,[r5,0xd]
cmp r0,0x3
addls r15,r15,r0,lsl 0x2
b _0220a60c
b _0220a30c ; case 0
b _0220a3d8 ; case 1
b _0220a490 ; case 2
b _0220a5c4 ; case 3
_0220a30c:
ldr r0,=0x21c52ec
mov r2,0x0
str r0,[r5,0x4]
strh r2,[r5,0x74]
ldr r1,[r5,0x70]
mvn r0,0x1f
orr r1,r1,0x4
str r1,[r5,0x70]
str r2,[r13,0x0]
str r0,[r13,0x4]
ldr r0,[r5,0x210]
and r0,r0,0x1
eor r0,r0,0x1
str r0,[r13,0x8]
add r1,r4,0x2c
ldmfd r1,{r1,r2,r3}
mov r0,r5
bl 0x20198d4
ldr r0,=0x5980
str r0,[r5,0x34]
ldr r2,[r5,0x210]
orr r3,r2,0x8
str r3,[r5,0x210]
mov r0,r5
mov r1,0x0
mov r2,0x0
bl 0x220e994
mov r0,r5
mov r1,0x3c
bl 0x2014374
mov r0,0x0
strb r0,[r5,0x81]
mov r1,0x30
strh r1,[r5,0x18]
ldr r0,=0xfffff556
str r0,[r5,0x14]
ldr r0,[r5,0x70]
tst r0,0x80
ldrne r0,[r5,0x14]
rsbne r0,r0,0x0
strne r0,[r5,0x14]
mov r0,r5
ldr r1,=0x5100	;0x50ec
bl 0x220f1bc
ldr r2,[r5,0x14]
mov r0,r2,asr 0x1
add r0,r2,r0,lsr 0x1e
mov r0,r0,asr 0x2
str r0,[r5,0x4c]
mov r1,0x1
strb r1,[r5,0xd]
_0220a3d8:
add r0,r5,0x4c
mov r1,0x20
bl 0x201c824
ldrsh r1,[r5,0x60]
ldr r0,[r5,0x4c]
sub r0,r1,r0
strh r0,[r5,0x60]
ldrb r0,[r5,0x81]
add r0,r0,0x1
strb r0,[r5,0x81]
cmp r0,0x1f
blo _0220a60c
ldr r1,=0x2217d88
ldr r3,=0x2217d84
ldrb r4,[r1,0x0]
ldrb r2,[r1,0x1]
sub r14,r13,0x4
strb r4,[r13,0x0]
strb r2,[r13,0x1]
ldrb r12,[r1,0x2]
ldrb r4,[r1,0x3]
strb r12,[r13,0x2]
strb r4,[r13,0x3]
ldrb r12,[r3,0x0]
ldrb r4,[r3,0x1]
strb r12,[r14,0x0]
strb r4,[r14,0x1]
ldrb r4,[r3,0x2]
ldrb r3,[r3,0x3]
strb r4,[r14,0x2]
strb r3,[r14,0x3]
ldmfd r14,{r3}
mov r0,r5
mov r1,0x8
mov r2,0x30
bl 0x201b4a4
ldr r1,[r5,0x14]
str r1,[r5,0x4c]
mov r0,0x2
strb r0,[r5,0xd]
add r1,r5,0x2c
mov r0,0x10c
ldmfd r1,{r1,r2,r3}
bl 0x2029b38
b _0220a60c
_0220a490:
add r0,r5,0x4c
mov r1,0x40
bl 0x201c824
ldrsh r1,[r5,0x60]
ldr r0,[r5,0x4c]
add r0,r1,r0
strh r0,[r5,0x60]
ldr r0,[r5,0x70]
tst r0,0x80
ldrsh r0,[r5,0x60]
addeq r0,r0,0x8000
moveq r0,r0,lsl 0x10
moveq r0,r0,asr 0x10
mov r1,r0,lsl 0x10
mov r2,r1,lsr 0x10
add r0,r5,0x38
mov r1,0x8000
bl 0x201c6b8
mov r0,r5
ldr r1,[r5,0x38]
ldr r2,[r5,0x3c]
mov r3,0x10
bl 0x201439c
ldr r1,=0x222e680
ldrh r12,[r1,0x0]
ldrh r4,[r1,0x2]
strh r12,[r13,0x0]
strh r4,[r13,0x2]
ldrh r12,[r1,0x4]
ldrh r4,[r1,0x6]
add r1,r5,0x2c
strh r12,[r13,0x4]
strh r4,[r13,0x6]
mov r3,0x0
str r3,[r13,0x8]
mov r2,0x1
str r2,[r13,0xc]
ldmfd r1,{r1,r2,r3}
mov r0,r5
bl 0x2013188
ldr r1,=0x222e678
mov r3,0x1
ldrh r12,[r1,0x0]
ldrh r4,[r1,0x2]
strh r12,[r13,0x0]
strh r4,[r13,0x2]
ldrh r4,[r1,0x4]
ldrh r1,[r1,0x6]
strh r4,[r13,0x4]
strh r1,[r13,0x6]
str r3,[r13,0x8]
str r3,[r13,0xc]
add r2,r5,0x2c
ldmfd r2,{r1,r2,r3}
mov r0,r5
bl 0x2013188
ldrh r2,[r5,0x60]
str r2,[r13,0x0]
add r1,r5,0x2c
ldmfd r1,{r1,r2,r3}
mov r0,r5
bl 0x2012f44
ldrsh r0,[r5,0x18]
sub r0,r0,0x1
strh r0,[r5,0x18]
cmp r0,0x0
bne _0220a60c
mov r0,r5
bl 0x2012ee8
mov r0,r5
mov r1,0x0
bl 0x2012ec4
mov r0,0x3
strb r0,[r5,0xd]
b _0220a60c
_0220a5c4:
add r0,r5,0x4c
mov r1,0x20
bl 0x201c824
ldrsh r1,[r5,0x60]
ldr r0,[r5,0x4c]
add r0,r1,r0
strh r0,[r5,0x60]
ldrb r0,[r5,0x81]
sub r0,r0,0x1
strb r0,[r5,0x81]
cmp r0,0x0
bne _0220a60c
mov r0,r5
bl 0x2012ae0
add r13,r13,0x14
ldmfd r13!,{r4,r5,r15}
_0220a60c:
mov r0,r5
bl 0x220e94c
add r13,r13,0x14
ldmfd r13!,{r4,r5,r15}
.pool
.endarea
;arm_func_end 0x220a2c8

.close

