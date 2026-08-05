.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the Skull Archer soul code
; that includes the code from the JP version that plays
; Soma's voice clips which were replaced in the US version.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21dee5c
.area 0x66C,0x69
func_ov000_021dee5c:
SoulSkullArcher_Update:
stmfd r13!,{r4-r11,r14}
sub r13,r13,0x34
mov r5,r0
ldr r4,[r5,0x214]
bl 0x21e6ed8
mov r0,r5
bl 0x220fa58
cmp r0,0x0
beq _021dee9c
mov r0,0xef
bl 0x204f4a4
mov r0,r5
bl 0x21e6e24
add r13,r13,0x34
ldmfd r13!,{r4-r11,r15}
_021dee9c:
ldrb r2,[r5,0xd]
cmp r2,0x3
bhs _021deed4
ldr r1,[r4,0xd0]
ldr r0,=0x200008
tst r1,r0
beq _021deed4
mov r0,0xef
bl 0x204f4a4
mov r0,r5
bl 0x21e6e24
add r13,r13,0x34
ldmfd r13!,{r4-r11,r15}
_021deed4:
ldr r0,[r5,0x210]
tst r0,0x2
bne _021deef4
cmp r2,0x4
addlo r1,r4,0xd0
ldrlo r0,[r1,0x18]
orrlo r0,r0,0x3
strlo r0,[r1,0x18]
_021deef4:
ldr r0,[r4,0x2c]
str r0,[r5,0x2c]
ldr r0,[r4,0x30]
str r0,[r5,0x30]
ldrb r0,[r5,0xd]
cmp r0,0x5
addls r15,r15,r0,lsl 0x2
b _021df480
b _021def2c ; case 0
b _021defd0 ; case 1
b _021df050 ; case 2
b _021df414 ; case 3
b _021df430 ; case 4
b _021df438 ; case 5
_021def2c:
mov r0,0x1000
str r0,[r5,0x38]
mov r0,0x0
str r0,[r13,0x0]
str r0,[r13,0x4]
ldr r1,[r4,0xd0]
and r1,r1,0x4
str r1,[r13,0x8]
add r0,r4,0x2c
ldmfd r0,{r1,r2,r3}
mov r0,r5
bl 0x20198d4
mov r1,0x18
mov r0,r4
strb r1,[r5,0x81]
bl 0x220f4f8
mov r0,r4
mov r1,0x22
mov r2,0x2
bl 0x220f554
mov r0,r5
bl 0x200d0bc
mov r0,r5
mov r1,0x0
mov r2,0x2
bl 0x200d020
ldr r1,=0x21c52ec
str r1,[r5,0x4]
mov r0,r5
mov r1,0x0
mov r2,0x0
bl 0x21e6cbc
mov r0,r5
mov r1,0x14
bl 0x2014374
mov r0,0xef
add r1,r5,0x2c
ldmfd r1,{r1,r2,r3}
bl 0x2029b38
mov r0,0x1
strb r0,[r5,0xd]
_021defd0:
ldr r1,[r4,0x2c]
str r1,[r5,0x2c]
ldr r1,[r4,0x30]
str r1,[r5,0x30]
mov r0,r5
bl 0x220f8e0
cmp r0,0x0
beq _021df00c
mov r0,0xef
bl 0x204f4a4
mov r0,r5
bl 0x21e6e24
add r13,r13,0x34
ldmfd r13!,{r4-r11,r15}
_021df00c:
mov r0,r5
bl 0x200cdf4
cmp r0,0x0
beq _021df480
mov r0,r5
mov r1,0x1
mov r2,0x0
bl 0x200d020
mov r0,r4
mov r1,0x23
mov r2,0x0
bl 0x220f554
mov r0,0x20
strh r0,[r5,0x1a]
mov r0,0x2
strb r0,[r5,0xd]
b _021df480
_021df050:
mov r0,0x16
str r0,[r13,0x0]
mvn r0,0x21
str r0,[r13,0x4]
ldr r1,[r5,0x70]
add r0,r5,0x2c
and r1,r1,0x80
str r1,[r13,0x8]
ldmfd r0,{r1,r2,r3}
add r0,r13,0x24
bl 0x2019894
mov r0,0x5e00
str r0,[r13,0x2c]
ldrsh r0,[r5,0x1c]
cmp r0,0x12c
bge _021df124
cmp r0,0x0
bne _021df0ac
mov r0,r5
mov r1,0xa
mov r2,0x0
mov r3,0x0
bl 0x21e6b3c
_021df0ac:
ldrsh r0,[r5,0x1c]
add r0,r0,0x1
strh r0,[r5,0x1c]
ldrsh r0,[r5,0x1c]
cmp r0,0xf0
bne _021df0d0
ldr r1,=0x5101	;0x50eb - US
mov r0,r5
bl 0x220f1bc
_021df0d0:
ldrsh r0,[r5,0x1c]
cmp r0,0x12c
bne _021df124
mov r1,0x6
str r1,[r13,0x0]
add r0,r13,0x24
ldmfd r0,{r0,r1,r2}
mov r3,0x19
bl 0x201a598
cmp r0,0x0
beq _021df124
mov r1,0x8e
strh r1,[r0,0x74]
mov r2,0x400
str r2,[r0,0x44]
str r2,[r0,0x48]
mov r1,0x200
strh r1,[r0,0x18]
mov r1,0x18
strh r1,[r0,0x1c]
_021df124:
ldrsh r0,[r5,0x18]
tst r0,0x3
bne _021df1c8
mov r1,0x7
str r1,[r13,0x0]
add r0,r13,0x24
ldmfd r0,{r0,r1,r2}
mov r3,0x0
bl 0x201a598
movs r6,r0
beq _021df198
mov r0,0x56
strh r0,[r6,0x74]
mov r0,0x200
strh r0,[r6,0x18]
ldrsh r1,[r5,0x1c]
mov r1,r1,lsl 0x2
add r1,r1,0x200
str r1,[r6,0x44]
str r1,[r6,0x48]
ldr r1,[r6,0x70]
orr r1,r1,0x4
str r1,[r6,0x70]
mov r0,0x10000
bl 0x2012d38
strh r0,[r6,0x60]
mov r0,0x10
strh r0,[r6,0x1c]
_021df198:
ldrsh r0,[r5,0x1a]
add r1,r5,0x2c
cmp r0,0x10
subgt r0,r0,0x1
strgth r0,[r5,0x1a]
ldrsh r2,[r5,0x1c]
mov r0,0x140
sub r2,r2,0x96
mov r2,r2,lsl 0x4
str r2,[r13,0x0]
ldmfd r1,{r1,r2,r3}
bl 0x2029acc
_021df1c8:
ldrsh r0,[r5,0x18]
tst r0,0x1
bne _021df270
mov r0,0x10000
bl 0x2012d38
ldrsh r1,[r5,0x1a]
str r1,[r13,0x0]
ldr r2,=0x2217c64
ldrb r6,[r2,0x0]
ldrb r3,[r2,0x1]
ldr r1,=0x2217c68
strb r6,[r13,0x4]
strb r3,[r13,0x5]
ldrb r7,[r2,0x2]
ldrb r6,[r2,0x3]
mov r0,r0,lsl 0x10
mov r3,r0,asr 0x10
add r2,r13,0x24
strb r7,[r13,0x6]
strb r6,[r13,0x7]
ldrb r6,[r1,0x0]
ldrb r0,[r1,0x1]
strb r6,[r13,0x8]
strb r0,[r13,0x9]
ldrb r6,[r1,0x2]
ldrb r0,[r1,0x3]
strb r6,[r13,0xa]
strb r0,[r13,0xb]
ldmfd r2,{r0,r1,r2}
bl 0x201e490
movs r6,r0
beq _021df270
mov r0,0x800
mov r1,0x1000
bl 0x2012d18
str r0,[r6,0x50]
ldr r0,[r6,0x38]
mov r0,r0,lsl 0x1
str r0,[r6,0x38]
ldr r0,[r6,0x3c]
mov r0,r0,lsl 0x1
str r0,[r6,0x3c]
_021df270:
mov r0,r5
bl 0x220f8e0
cmp r0,0x0
beq _021df480
ldr r8,=0x2aaa
mov r10,0x1
mov r9,0x8
mov r11,0x31
mov r0,0xc5
str r0,[r13,0x10]
mov r0,0x1000
str r0,[r13,0x14]
mov r0,0x40
str r0,[r13,0x18]
mov r0,0x18
str r0,[r13,0x1c]
mov r6,0x17
mov r0,0x0
str r0,[r13,0xc]
str r8,[r13,0x20]
_021df2c0:
ldr r3,[r13,0xc]
str r6,[r13,0x0]
add r0,r13,0x24
ldmfd r0,{r0,r1,r2}
bl 0x201a598
movs r7,r0
beq _021df39c
ldr r1,[r7,0x70]
add r0,r7,0x70
orr r1,r1,0x24
str r1,[r7,0x70]
ldr r1,[r5,0x70]
tst r1,0x80
ldr r1,[r0,0x0]
orrne r1,r1,0x80
biceq r1,r1,0x80
str r1,[r0,0x0]
ldr r0,[r13,0x10]
strh r0,[r7,0x74]
strh r11,[r7,0x76]
ldr r0,[r13,0x14]
mov r1,r9
bl 0x2075b28
strh r0,[r7,0x18]
ldr r2,[r5,0x38]
mov r0,r2,asr 0x1
add r0,r2,r0,lsr 0x1e
mov r0,r0,asr 0x2
mul r1,r0,r10
add r0,r1,r2,lsl 0x1
rsb r0,r0,0x0
str r0,[r7,0x38]
ldr r0,=0x2aa
str r0,[r7,0x50]
ldrsh r0,[r5,0x1c]
mov r0,r0,lsl 0x3
mul r1,r10,r0
mov r0,r1,asr 0x1
add r0,r1,r0,lsr 0x1e
mov r0,r0,asr 0x2
add r0,r0,0x800
str r0,[r7,0x54]
ldr r0,[r13,0x18]
str r0,[r7,0x48]
ldr r0,[r7,0x50]
rsb r1,r0,0x0
mov r0,r1,asr 0x5
add r0,r1,r0,lsr 0x1a
mov r0,r0,asr 0x6
str r0,[r7,0x44]
ldr r0,[r13,0x1c]
strh r8,[r7,0x60]
strh r0,[r7,0x1c]
_021df39c:
ldr r0,[r13,0x20]
add r8,r8,r0
add r9,r9,0x8
add r10,r10,0x1
cmp r10,0x4
blt _021df2c0
ldrsh r0,[r5,0x1c]
cmp r0,0x96
blt _021df3e0
mov r0,r5
mov r1,0xa
mov r2,0x0
mov r3,0x0
bl 0x21e6b3c
mov r0,r5
ldr r1,=0x5100	;0x50ec
bl 0x220f1bc
_021df3e0:
mov r0,r5
mov r1,0x2
mov r2,0x2
bl 0x200d020
mov r0,r4
mov r1,0x24
mov r2,0x2
bl 0x220f554
mov r0,r5
bl 0x21df4c8
mov r0,0x3
strb r0,[r5,0xd]
b _021df480
_021df414:
add r0,r5,0x2c
ldmfd r0,{r1,r2,r3}
mov r0,0xf0
bl 0x2029b38
mov r0,0x4
strb r0,[r5,0xd]
b _021df480
_021df430:
mov r0,0x5
strb r0,[r5,0xd]
_021df438:
ldr r1,[r4,0xd0]
ldr r0,=0x200008
tst r1,r0
beq _021df45c
mov r0,r5
bl 0x21e6e24
add r13,r13,0x34
ldmfd r13!,{r4-r11,r15}
_021df45c:
mov r0,r5
bl 0x200cdf4
cmp r0,0x0
beq _021df480
mov r0,r5
bl 0x21e6e24
add r13,r13,0x34
ldmfd r13!,{r4-r11,r15}
_021df480:
ldrsh r1,[r5,0x18]
add r1,r1,0x1
strh r1,[r5,0x18]
mov r0,r5
bl 0x200ce00
mov r0,r5
bl 0x21e6c54
add r13,r13,0x34
ldmfd r13!,{r4-r11,r15}
.pool
.endarea
;arm_func_end 0x21dee5c

.close

