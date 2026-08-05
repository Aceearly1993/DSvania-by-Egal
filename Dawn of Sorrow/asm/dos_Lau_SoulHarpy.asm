.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the entirety of the Harpy
; soul code and changes the ID of the voice clip
; played when casting this soul to the one used in the JP version.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21e34b4
.area 0x60C,0x69
func_ov000_021e34b4:
SoulHarpy_Update:
stmfd r13!,{r4-r11,r14}
sub r13,r13,0x1c
mov r4,r0
ldr r1,=0x208ac20
ldr r2,[r1,0x0]
ldr r1,=0x9bc4
ldr r6,[r4,0x214]
add r5,r2,r1
bl 0x21e6ed8
mov r0,r4
bl 0x220fa58
cmp r0,0x0
beq _021e34fc
mov r0,r4
bl 0x21e6e24
add r13,r13,0x1c
ldmfd r13!,{r4-r11,r15}
_021e34fc:
mov r0,r4
mov r1,0x0
bl 0x21e6bec
cmp r0,0x0
addne r13,r13,0x1c
ldmnefd r13!,{r4-r11,r15}
ldrb r0,[r4,0xd]
cmp r0,0x0
beq _021e3638
cmp r0,0x1
bls _021e3638
mov r0,r4
bl 0x220f8e0
cmp r0,0x0
movne r0,0x7
strneb r0,[r4,0xd]
ldr r0,[r4,0x234]
cmp r0,0x0
bne _021e3638
mvn r3,0x47
ldr r0,[r4,0x210]
tst r0,0x2
beq _021e3568
ldrb r0,[r6,0x260]
cmp r0,0x75
mvneq r3,0x5f
_021e3568:
ldrsh r2,[r4,0x62]
rsb r2,r2,0x0
str r2,[r13,0x0]
str r3,[r13,0x4]
ldr r2,[r6,0xd0]
and r2,r2,0x4
str r2,[r13,0x8]
add r1,r6,0x2c
ldmia r1,{r1,r2,r3}
add r0,r13,0x10
bl 0x2019894
ldrh r1,[r4,0x18]
ldr r0,=0x2086394
ldr r2,[r13,0x14]
mov r1,r1,asr 0x4
mov r1,r1,lsl 0x2
ldrsh r0,[r0,r1]
add r0,r2,r0,lsl 0x4
str r0,[r13,0x14]
ldrsh r0,[r4,0x18]
add r0,r0,0x100
strh r0,[r4,0x18]
ldr r0,[r4,0x210]
tst r0,0x2
bne _021e3604
ldrb r0,[r5,0x0]
cmp r0,0x0
beq _021e3604
ldr r0,=0x208ac20
ldrsh r1,[r5,0x4]
ldr r0,[r0,0x0]
add r0,r0,0x36000
ldr r2,[r0,0x890]
add r1,r2,r1,lsl 0xc
str r1,[r13,0x10]
ldrsh r1,[r5,0x6]
ldr r0,[r0,0x894]
add r0,r0,r1,lsl 0xc
str r0,[r13,0x14]
_021e3604:
mov r0,0x80
str r0,[r13,0x0]
str r0,[r13,0x4]
add r1,r13,0x10
ldmia r1,{r1,r2,r3}
mov r0,r4
bl 0x20199f0
add r0,r4,0x38
mov r1,0x4000
bl 0x2019a64
add r0,r4,0x2c
add r1,r4,0x38
bl 0x201c848
_021e3638:
ldr r0,=0x5980
str r0,[r4,0x34]
ldrb r0,[r4,0xd]
cmp r0,0x7
addls r15,r15,r0,lsl 0x2
b _021e3a88
b _021e3670 ; case 0
b _021e36e0 ; case 1
b _021e3728 ; case 2
b _021e37c8 ; case 3
b _021e3850 ; case 4
b _021e39f8 ; case 5
b _021e3a34 ; case 6
b _021e3a54 ; case 7
_021e3670:
ldr r1,=0x21c52ec
mov r0,0x0
str r1,[r4,0x4]
str r0,[r13,0x0]
mvn r0,0x2f
str r0,[r13,0x4]
ldr r1,[r6,0xd0]
and r1,r1,0x4
str r1,[r13,0x8]
add r1,r6,0x2c
ldmia r1,{r1,r2,r3}
mov r0,r4
bl 0x20198d4
ldr r0,[r6,0xd0]
tst r0,0x4
movne r0,0x8000
rsbne r0,r0,0x0
strneh r0,[r4,0x18]
mov r0,r4
bl 0x200d0bc
mov r0,r4
mov r1,0x0
mov r2,0x0
bl 0x200d020
mov r0,0x20
strh r0,[r4,0x62]
mov r0,r4
ldr r1,=0x50f9
bl 0x220f1bc
mov r0,0x1
strb r0,[r4,0xd]
_021e36e0:
ldr r1,[r4,0x14]
mov r0,0x1e
mul r2,r1,r0
mov r0,r2,asr 0xb
add r0,r2,r0,lsr 0x14
mov r0,r0,asr 0xc
add r0,r0,0x1
strb r0,[r4,0x81]
ldr r0,[r4,0x14]
add r0,r0,0x100
str r0,[r4,0x14]
cmp r0,0x1000
movge r0,0x1f
strgeb r0,[r4,0x81]
movge r0,0x2
strgeb r0,[r4,0xd]
b _021e3a88
_021e3728:
ldr r0,[r6,0xd0]
tst r0,0x4
beq _021e3740
ldr r0,[r4,0x70]
tst r0,0x80
bne _021e3754
_021e3740:
cmp r1,0x0
bne _021e375c
ldr r0,[r4,0x70]
tst r0,0x80
bne _021e375c
_021e3754:
mvn r0,0x1f
strh r0,[r4,0x62]
_021e375c:
ldr r0,[r6,0xd0]
and r0,r0,0x4
eors r0,r0,0x4
ldr r0,[r4,0x70]
orrne r0,r0,0x80
biceq r0,r0,0x80
str r0,[r4,0x70]
ldrsh r0,[r4,0x62]
cmp r0,0x20
addlt r0,r0,0x1
strlth r0,[r4,0x62]
ldrsh r0,[r4,0x1a]
add r0,r0,0x1
strh r0,[r4,0x1a]
ldr r0,[r6,0xd0]
tst r0,0x10000000
beq _021e3a88
mov r1,0x1
str r1,[r4,0x234]
mov r0,r4
mov r2,0x2
bl 0x200d020
mov r0,0x3
strb r0,[r4,0xd]
b _021e3a88
_021e37c8:
mov r0,r4
bl 0x200cdf4
cmp r0,0x0
beq _021e3a88
ldr r0,[r4,0x210]
tst r0,0x2
beq _021e3824
ldrb r0,[r6,0x260]
cmp r0,0x75
bne _021e3824
ldr r0,=0x208ac20
ldr r1,[r4,0x2c]
ldr r0,[r0,0x0]
add r0,r0,0x36000
ldr r0,[r0,0xb70]
ldr r0,[r0,0x2c]
cmp r0,r1
ldr r0,[r4,0x70]
orrgt r0,r0,0x80
bicle r0,r0,0x80
str r0,[r4,0x70]
_021e3824:
ldr r3,[r4,0x220]
mov r3,r3,lsl 0x4
add r3,r3,0x8
strh r3,[r4,0x1c]
mov r0,r4
mov r1,0x2
mov r2,0x0
bl 0x200d020
mov r0,0x4
strb r0,[r4,0xd]
b _021e3a88
_021e3850:
ldrsh r0,[r4,0x1c]
sub r0,r0,0x1
strh r0,[r4,0x1c]
tst r0,0xf
bne _021e39d0
ldr r0,[r4,0x220]
mov r9,0x0
add r8,r0,0x1
cmp r8,0x0
ble _021e39c0
mov r0,0xc
mov r5,r9
mov r7,0x20
mvn r6,0x1f
mov r11,0x1000
str r0,[r13,0xc]
_021e3894:
ldr r1,=0x21e3ac0
mov r0,r4
bl 0x220fc0c
movs r10,r0
beq _021e39b4
add r3,r10,0xd0
str r4,[r3,0x4]
ldrh r2,[r4,0x12]
strh r2,[r3,0xa]
ldr r2,=0x21c52ec
str r2,[r10,0x4]
mov r0,r4
mov r1,r10
bl 0x201b340
str r7,[r13,0x0]
str r6,[r13,0x4]
ldr r1,[r4,0x70]
and r1,r1,0x80
str r1,[r13,0x8]
add r1,r4,0x2c
ldmia r1,{r1,r2,r3}
mov r0,r10
bl 0x20198d4
ldr r1,[r10,0x70]
orr r1,r1,0x4
bic r1,r1,0x80
str r1,[r10,0x70]
mov r0,r11
mov r1,r8
bl 0x2075b28
mul r0,r9,r0
rsb r0,r0,0x6000
strh r0,[r10,0x60]
ldr r0,[r4,0x70]
tst r0,0x80
ldrnesh r0,[r10,0x60]
rsbne r0,r0,0x8000
strneh r0,[r10,0x60]
ldrh r2,[r10,0x60]
mov r2,r2,asr 0x4
mov r2,r2,lsl 0x1
add r2,r2,0x1
mov r3,r2,lsl 0x1
ldr r2,=0x2086394
ldrsh r3,[r2,r3]
mov r3,r3,lsl 0x3
str r3,[r10,0x38]
ldrh r3,[r10,0x60]
mov r3,r3,asr 0x4
mov r12,r3,lsl 0x2
ldr r3,=0x2086394
ldrsh r3,[r3,r12]
mov r3,r3,lsl 0x3
str r3,[r10,0x3c]
ldr r12,[r10,0x2c]
ldr r3,[r10,0x38]
add r3,r12,r3,lsl 0x2
str r3,[r10,0x2c]
ldr r12,[r10,0x30]
ldr r3,[r10,0x3c]
add r3,r12,r3,lsl 0x2
str r3,[r10,0x30]
strh r5,[r10,0x74]
mov r0,r10
mov r1,r5
mov r2,r5
bl 0x21e6cbc
ldr r1,[r13,0xc]
mov r0,r10
bl 0x2014374
_021e39b4:
add r9,r9,0x1
cmp r9,r8
blt _021e3894
_021e39c0:
add r1,r4,0x2c
ldmia r1,{r1,r2,r3}
ldr r0,=0x13b
bl 0x2029b38
_021e39d0:
ldrsh r0,[r4,0x1c]
cmp r0,0x0
bne _021e3a88
mov r0,r4
mov r1,0x3
mov r2,0x2
bl 0x200d020
mov r0,0x5
strb r0,[r4,0xd]
b _021e3a88
_021e39f8:
mov r0,r4
bl 0x200cdf4
cmp r0,0x0
beq _021e3a88
mov r0,r4
mov r1,0x0
mov r2,0x0
bl 0x200d020
mov r0,0x0
str r0,[r4,0x234]
mov r0,0x20
strh r0,[r4,0x1c]
mov r0,0x6
strb r0,[r4,0xd]
b _021e3a88
_021e3a34:
ldrsh r0,[r4,0x1c]
sub r0,r0,0x1
strh r0,[r4,0x1c]
cmp r0,0x0
moveq r0,0x2
streqb r0,[r4,0xd]
b _021e3a88
_021e3a54:
ldrb r0,[r4,0x81]
sub r0,r0,0x1
strb r0,[r4,0x81]
cmp r0,0x0
addne r13,r13,0x1c
ldmnefd r13!,{r4-r11,r15}
mov r0,r4
bl 0x21e6e24
add r13,r13,0x1c
ldmfd r13!,{r4-r11,r15}
_021e3a88:
mov r0,r4
bl 0x200ce00
mov r0,r4
bl 0x21e6c54
add r13,r13,0x1c
ldmfd r13!,{r4-r11,r15}
.pool
.endarea
;arm_func_end 0x21e34b4

.close

