.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the entirety of the Devil
; soul code and changes the ID of the voice clip
; played when casting this soul to the one used in the JP version.
; The value for the outline color is also marked below.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21e0044
.area 0x354,0x69
func_ov000_021e0044:
SoulDevil_Update:
stmfd r13!,{r4-r8,r14}
sub r13,r13,0x10
mov r5,r0
add r4,r5,0xd0
ldr r8,[r5,0x214]
ldr r6,=0x208ac20
ldr r6,[r6,0x0]
bl 0x21e6ed8
mov r0,r5
bl 0x21e6ee4
cmp r0,0x0
beq _021e0080
mov r0,r5
bl 0x21e6e24
add r13,r13,0x10
ldmfd r13!,{r4-r8,r15}
_021e0080:
mov r0,0x0
str r0,[r13,0x0]
str r0,[r13,0x4]
ldr r0,[r5,0x210]
and r0,r0,0x1
str r0,[r13,0x8]
add r1,r8,0x2c
ldmia r1,{r1,r2,r3}
mov r0,r5
bl 0x20198d4
ldr r0,=0x5980
str r0,[r5,0x34]
ldrb r0,[r5,0xd]
cmp r0,0x3
addls r15,r15,r0,lsl 0x2
b _021e02b8
b _021e00d0 ; case 0
b _021e019c ; case 1
b _021e01e8 ; case 2
b _021e02b8 ; case 3
_021e00d0:
ldr r1,=0x21e0398
str r1,[r5,0x4]
ldr r1,[r5,0x70]
orr r1,r1,0x8
str r1,[r5,0x70]
mov r0,r5
ldrsh r1,[r5,0x74]
mov r2,0x0
add r3,r4,0x44
bl 0x2019590
mov r7,r4
add r8,r4,0x44
mov r12,0x4
_021e0104:
ldmia r8!,{r0,r1,r2,r3}
stmia r7!,{r0,r1,r2,r3}
subs r12,r12,0x1
bne _021e0104
mov r0,0x0
ldr r1,[r8,0x0]
str r1,[r7,0x0]
ldrsh r2,[r4,0x74]
ldrsh r1,[r4,0x6e]
sub r1,r2,r1
str r1,[r4,0xf4]
_021e0130:
ldr r2,[r4,0xf4]
rsb r1,r0,0x10
mul r3,r2,r1
mov r1,r3,asr 0x3
add r1,r3,r1,lsr 0x1c
mov r2,r1,asr 0x4
add r1,r4,r0,lsl 0x2
mov r2,r2,lsl 0xc
str r2,[r1,0x88]
add r0,r0,0x1
cmp r0,0x10
ble _021e0130
mov r0,r5
ldr r1,=0x50F8	;0x50ea
bl 0x220f1bc
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
ldr r0,=0x13f
bl 0x2029b38
mov r0,0x1e
strb r0,[r5,0x81]
mov r0,0x5
strb r0,[r5,0x80]
mov r0,0x8000
str r0,[r5,0x40]
mov r0,0x1
strb r0,[r5,0xd]
_021e019c:
ldr r0,[r5,0x50]
add r0,r0,0x66
str r0,[r5,0x50]
str r0,[r5,0x54]
bl 0x2074F20
ldr r1,=0x45400000
bl 0x2073D0C
cmp r0,0x0
beq _021e02b8
ldrb r0,[r5,0x81]
sub r0,r0,0x1
strb r0,[r5,0x81]
cmp r0,0x0
moveq r0,0x2
streqb r0,[r5,0xd]
b _021e02b8
_021e01e8:
ldr r0,[r5,0x210]
tst r0,0x2
bne _021e02b8
ldr r0,=0x36b9c
add r7,r6,r0
ldrsh r1,[r7,0x4]
mov r1,r1,lsl 0x1
add r1,r1,0x32
strh r1,[r7,0x4]
mov r0,r7
bl 0x21fff5c
ldr r1,=0x36b9c
strh r0,[r6,r1]
mov r2,0x0
strh r2,[r7,0x2]
strh r2,[r7,0x6]
mov r0,r8
ldrsh r1,[r7,0x2]
mov r3,0x0
bl 0x20143b8
bl 0x21fc59c
mov r0,r8
ldr r1,=0x1f	;outline color
bl 0x21f70d0
ldrsh r0,[r5,0x1a]
tst r0,0x1f
bne _021e02ac
add r0,r6,0x36c00
ldrsh r0,[r0,0x30]
cmp r0,0xa
ble _021e02ac
add r0,r6,0x36000
ldr r0,[r0,0x61c]
tst r0,0x41
bne _021e02ac
mov r0,0xa
bl 0x2200b8c
add r0,r6,0x36000
ldr r0,[r0,0xbc4]
tst r0,0x80
beq _021e02ac
mov r0,0xa
bl 0x21fd748
_021e02ac:
ldrsh r0,[r5,0x1a]
add r0,r0,0x1
strh r0,[r5,0x1a]
_021e02b8:
mov r3,0x0
mov r6,0x0
ldr r0,=0x2086394
_021e02c4:
ldrsh r2,[r5,0x18]
ldr r7,[r5,0x40]
ldr r1,[r4,0xf4]
add r2,r2,r6
mov r2,r2,lsl 0x10
mov r2,r2,lsr 0x10
mov r2,r2,asr 0x4
mov r8,r2,lsl 0x2
mov r2,r7,asr 0xb
add r7,r7,r2,lsr 0x14
mul r2,r1,r3
mov r1,r2,asr 0x3
ldrsh r12,[r0,r8]
mov r7,r7,asr 0xc
add r8,r4,r3,lsl 0x1
mul r12,r7,r12
mov r7,r12,asr 0xb
ldrsh r14,[r4,0x74]
add r1,r2,r1,lsr 0x1c
add r2,r12,r7,lsr 0x14
sub r1,r14,r1,asr 0x4
add r1,r1,r2,asr 0xc
strh r1,[r8,0xd0]
add r6,r6,0x1000
add r3,r3,0x1
cmp r3,0x10
ble _021e02c4
ldr r0,[r5,0x40]
sub r0,r0,0x100
str r0,[r5,0x40]
cmp r0,0x0
movlt r0,0x0
strlt r0,[r5,0x40]
ldr r0,=0xffff
ldrsh r1,[r5,0x18]
add r1,r1,0x800
and r0,r1,r0
strh r0,[r5,0x18]
add r13,r13,0x10
ldmfd r13!,{r4-r8,r15}
.pool
.endarea
;arm_func_end 0x21e0044


.close


