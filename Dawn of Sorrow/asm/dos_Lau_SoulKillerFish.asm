.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the Killer Fish soul code
; that includes the code from the JP version that plays
; Soma's voice clip which was removed from the US version.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x2203720
.area 0x378,0x69
func_ov000_02203720:
SoulKillerFish_Cast:
stmfd r13!,{r4,r14}
sub r13,r13,0x20
mov r4,r0
ldrb r1,[r4,0xd]
ldr r3,[r4,0x214]
cmp r1,0x4
addls r15,r15,r1,lsl 0x2
b _02203a6c
b _02203754 ; case 0
b _02203834 ; case 1
b _02203880 ; case 2
b _022039bc ; case 3
b _0220395c ; case 4
_02203754:
ldr r2,=0x21c5250
ldr r1,=0x5c80
str r2,[r4,0x4]
str r1,[r4,0x34]
ldr r2,[r4,0x70]
mov r1,0x0
orr r2,r2,0x4
str r2,[r4,0x70]
str r1,[r13,0x0]
mvn r1,0x21
str r1,[r13,0x4]
ldr r2,[r4,0x210]
add r1,r3,0x2c
and r2,r2,0x1
eor r2,r2,0x1
str r2,[r13,0x8]
ldmfd r1,{r1,r2,r3}
bl 0x20198d4
mov r0,0x0
strb r0,[r4,0x81]
ldr r1,[r4,0x210]
orr r1,r1,0x8
str r1,[r4,0x210]
mov r0,r4
bl 0x200d0bc
mov r0,r4
mov r1,0x0
mov r2,0x0
bl 0x200d020
mov r0,r4
mov r1,0x0
mov r2,0x0
bl 0x220e994
mov r0,r4
mov r1,0x1e
bl 0x2014374
mov r0,0x0
strh r0,[r4,0x60]
mov r0,0x3000
str r0,[r4,0x40]
mov r0,0x600
str r0,[r4,0x4c]
ldr r0,[r4,0x70]
tst r0,0x80
orreq r0,r0,0x100
streq r0,[r4,0x70]
ldreqsh r0,[r4,0x60]
rsbeq r0,r0,0x8000
streqh r0,[r4,0x60]
ldr r1,[r4,0x70]
orr r1,r1,0x80
str r1,[r4,0x70]
mov r0,0x78
strh r0,[r4,0x18]
mov r0,0x1
strb r0,[r4,0xd]
_02203834:
ldrb r0,[r4,0x81]
add r0,r0,0x1
strb r0,[r4,0x81]
cmp r0,0x1f
blo _02203a6c
ldr r0,[r4,0x2c]
ldr r1,[r4,0x30]
bl 0x2006170
cmp r0,0x0
movne r0,0x2
strneb r0,[r4,0xd]
bne _02203a6c
ldr r1,[r4,0x70]
eor r1,r1,0x100
str r1,[r4,0x70]
mov r0,0x3
strb r0,[r4,0xd]
mov r0,r4
ldr r1,=0x50f3
bl 0x220f1bc	;0x220f3dc - JP
b _02203a6c
_02203880:
add r0,r13,0x10
mov r1,r4
bl 0x220f5f0
ldr r0,[r13,0x18]
cmp r0,0x0
beq _022038cc
ldrsh r1,[r4,0x60]
add r0,r13,0x10
sub r12,r13,0x4
str r1,[r13,0x8]
ldr r1,[r4,0x4c]
add r3,r4,0x2c
str r1,[r13,0xc]
ldmfd r0,{r0,r1,r2}
stmfd r12,{r0,r1,r2}
ldmfd r3,{r0,r1,r2}
ldmfd r12,{r3}
bl 0x201c414
strh r0,[r4,0x60]
_022038cc:
add r0,r4,0x4c
mov r1,0x40
bl 0x201c824
ldrh r2,[r4,0x60]
ldr r1,[r4,0x40]
add r0,r4,0x38
bl 0x201c6b8
mov r0,r4
bl 0x21c339c
mov r0,r4
ldr r1,[r4,0x38]
ldr r2,[r4,0x3c]
mov r3,0x4
bl 0x201439c
mov r0,r4
bl 0x201360c
ldrsh r0,[r4,0x18]
sub r0,r0,0x1
strh r0,[r4,0x18]
ldr r0,[r4,0x2c]
ldr r1,[r4,0x30]
bl 0x2006170
cmp r0,0x0
moveq r0,0x0
streqh r0,[r4,0x18]
cmp r0,0x0
bne _02203a6c
mov r0,r4
bl 0x2012ee8
mov r0,r4
mov r1,0x0
bl 0x2012ec4
mov r0,0x4
strb r0,[r4,0xd]
b _02203a6c
_0220395c:
bl 0x21c339c
ldr r0,[r4,0x38]
bl 0x2074F20	;FloatConvertFromInt
ldr r1,=0x3f4ccccd
bl 0x2074fec
bl 0x2074da8
str r0,[r4,0x38]
ldr r0,[r4,0x3c]
bl 0x2074F20	;FloatConvertFromInt
ldr r1,=0x3f4ccccd
bl 0x2074fec
bl 0x2074da8
str r0,[r4,0x3c]
ldrb r0,[r4,0x81]
sub r0,r0,0x1
strb r0,[r4,0x81]
ldrb r0,[r4,0x81]
cmp r0,0x0
bne _02203a6c
mov r0,r4
bl 0x2012ae0
add r13,r13,0x20
ldmfd r13!,{r4,r15}
_022039bc:
ldr r0,[r4,0x70]
tst r0,0x100
ldrsh r0,[r4,0x60]
addne r0,r0,0x100
subeq r0,r0,0x100
strh r0,[r4,0x60]
add r0,r4,0x38
ldr r1,[r4,0x40]
ldrh r2,[r4,0x60]
bl 0x201c6b8
mov r0,r4
bl 0x21c339c
ldrb r0,[r4,0x81]
tst r0,0x3
bne _02203a40
mov r0,0x1
str r0,[r13,0x8]
mov r1,0x4
str r1,[r13,0xc]
sub r3,r13,0x4
ldr r0,=0x2217d60
ldmfd r0,{r0,r1,r2}
stmfd r3,{r0,r1,r2}
add r0,r4,0x2c
ldmfd r3,{r3}
ldmfd r0,{r0,r1,r2}
bl 0x2019a84
add r1,r4,0x2c
mov r0,0xc
ldmfd r1,{r1,r2,r3}
bl 0x2029b38
_02203a40:
ldrb r0,[r4,0x81]
sub r0,r0,0x1
strb r0,[r4,0x81]
cmp r0,0x0
bne _02203a6c
mov r0,r4
bl 0x2012ae0
add r13,r13,0x20
ldmfd r13!,{r4,r15}
_02203a6c:
mov r0,r4
bl 0x200ce00
mov r0,r4
bl 0x220e94c
add r13,r13,0x20
ldmfd r13!,{r4,r15}
.pool
.endarea
;arm_func_end 0x2203720

.close

