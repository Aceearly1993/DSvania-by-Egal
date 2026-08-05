.nds
.relativeinclude on
.erroronwarning on

; This replaces the US code for Abaddon with an optimized
; version of the JP code (entirety of overlay_0039).
; The optimized code creates some freespace in Abaddon's overlay,
; so additional code for Abaddon can be added if desired.

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

; Changes the create an update code for Abaddon to match the
; new offsets.
.org 0x2079CB4
.dw EnemyAbaddonCreate
.dw EnemyAbaddonUpdate

.close


.open "ftc/overlay9_39", 0x22FF9C0

.org 0x22FF9C0
.area 0x1A00,0x69
_func_ov039_022fea00:
EnemyAbaddonCreate:
stmfd r13!,{r4,r14}
sub r13,r13,0x8
mov r4,r0
ldr r1,=0x208ac20
ldr r1,[r1,0x0]
add r1,r1,0x36800
ldrh r1,[r1,0x58]
tst r1,0x8000
beq _022fea34
bl 0x2012ae0	;func_02012b38
add r13,r13,0x8
ldmfd r13!,{r4,r15}
_022fea34:
mov r2,0x1
str r2,[r13,0x0]
ldr r1,=0x21155c8	;0x2115660
ldr r1,[r1,0x0]
ldr r2,=_0x23003bc
ldr r3,=0x22bc168	;0x22bb208
bl 0x201c1b8	;func_0201c208
cmp r0,0x0
addeq r13,r13,0x8
ldmeqfd r13!,{r4,r15}
ldr r1,=0x21c52ec	;0x21c53ac
str r1,[r4,0x4]
mov r1,0x200
str r1,[r4,0x48]
mov r0,r4
bl 0x200d0bc	;func_0200d114
add r0,r4,0x200
ldrh r0,[r0,0x6e]
cmp r0,0x0
beq _022fea98
mov r0,r4
mov r1,0xc
bl 0x200d030	;func_0200d088
b _022feaac
_022fea98:
mov r0,r4
mov r1,0x0
bl 0x200d030	;func_0200d088
mov r0,0x1
strb r0,[r4,0xd]
_022feaac:
mov r1,0x5500
mov r0,0xf
str r1,[r4,0x34]
bl 0x22149c8	;func_ov000_02214be8
mov r0,r4
bl 0x21c34a8	;func_ov000_021c3568
ldr r2,=_func_ov039_023003b0
ldr r3,=_func_ov039_02300374
mov r0,r4
mov r1,0x7
bl 0x20143ec	;func_02014444
add r0,r4,0x200
ldrsh r1,[r0,0x6a]
mov r0,r4
mov r2,0x40
bl 0x20143d4	;func_0201442c
mov r0,r4
ldrb r1,[r4,0x260]
bl 0x21c347c	;func_ov000_021c353c
mov r0,r4
bl 0x2014350	;func_020143a8
mov r3,0x2000
str r3,[r4,0x14]
ldr r1,[r4,0x250]
orr r1,r1,0x20
str r1,[r4,0x250]
ldr r2,=0x208ac20
ldr r2,[r2,0x0]
add r2,r2,0x36000
ldr r12,[r2,0x61c]
bic r12,r12,0x4
orr r12,r12,0x2
bic r12,r12,0x4
orr r12,r12,0x2
orr r12,r12,0x40000
str r12,[r2,0x61c]
ldr r0,=0x101a
bl 0x202991c	;func_020299a4
mov r0,0x0
str r0,[r4,0x14]
add r13,r13,0x8
ldmfd r13!,{r4,r15}
.pool
;arm_func_end func_ov039_022fea00

_func_ov039_022febb8:
EnemyAbaddonUpdate:
stmfd r13!,{r4,r5,r6,r7,r14}
sub r13,r13,0x1c
mov r5,r0
mov r1,0x20
add r4,r5,0xd0
bl 0x21c4ddc	;func_ov000_021c4e9c
cmp r0,0x0
addne r13,r13,0x1c
ldmnefd r13!,{r4,r5,r6,r7,r15}
mov r0,r5
ldr r1,[r5,0x14]
ldr r2,=_0x23003f0
mov r3,0xa0
bl 0x21c2958	;func_ov000_021c2a18
mov r7,r0
ldrb r1,[r5,0xd]
cmp r1,0x11
addls r15,r15,r1,lsl 0x2
b _022ff4b4
b _022fec50 ; case 0
b _022fed18 ; case 1
b _022fee30 ; case 2
b _022fee58 ; case 3
b _022feee0 ; case 4
b _022fef0c ; case 5
b _022ff4b4 ; case 6
b _022fef2c ; case 7
b _022fefe4 ; case 8
b _022ff0a0 ; case 9
b _022ff0d0 ; case 10
b _022ff16c ; case 11
b _022ff208 ; case 12
b _022ff2a4 ; case 13
b _022ff340 ; case 14
b _022ff360 ; case 15
b _022ff424 ; case 16
b _022ff458 ; case 17
_022fec50:
ldrsh r2,[r5,0x74]
mov r0,0x10
mov r1,0x0
str r2,[r13,0x0]
str r0,[r13,0x4]
str r0,[r13,0x8]
str r1,[r13,0xc]
add r1,r5,0x2c
mov r0,r5
ldmia r1,{r1,r2,r3}
bl 0x2018cbc	;func_02018d0c
movs r6,r0
beq _022fed00
mov r0,0x5500
str r0,[r6,0x34]
ldr r1,[r6,0x70]
mov r0,0x31
orr r1,r1,0x27
str r1,[r6,0x70]
strh r0,[r6,0x76]
mov r0,0x20
str r0,[r6,0x44]
mov r2,0x40
mvn r0,0xf
mov r1,0x10
str r2,[r6,0x48]
bl 0x2012d18	;func_02012d70
strh r0,[r6,0x66]
ldr r1,=_0x23003c4
sub r12,r13,0x4
ldrb r3,[r1,0x0]
ldrb r2,[r1,0x1]
strb r3,[r12,0x0]
strb r2,[r12,0x1]
ldrb r2,[r1,0x2]
ldrb r1,[r1,0x3]
strb r2,[r12,0x2]
strb r1,[r12,0x3]
ldmia r12,{r1}
mov r0,r6
bl 0x201c040	;func_0201c090
ldrb r0,[r6,0xc]
orr r0,r0,0x1
strb r0,[r6,0xc]
_022fed00:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
beq _022ff4b4
mov r0,0x1
strb r0,[r5,0xd]
_022fed18:
tst r7,0x8
beq _022fee1c
mov r0,0x100
bl 0x2012d38	;func_02012d90
cmp r0,0x80
bhs _022fedd4
ldr r1,=_0x23003cc
ldr r3,=_0x23003c8
ldrb r6,[r1,0x0]
ldrb r2,[r1,0x1]
sub r12,r13,0x4
strb r6,[r13,0x0]
strb r2,[r13,0x1]
ldrb r7,[r1,0x2]
ldrb r6,[r1,0x3]
strb r7,[r13,0x2]
strb r6,[r13,0x3]
ldrb r7,[r3,0x0]
ldrb r6,[r3,0x1]
strb r7,[r12,0x0]
strb r6,[r12,0x1]
ldrb r6,[r3,0x2]
ldrb r3,[r3,0x3]
strb r6,[r12,0x2]
strb r3,[r12,0x3]
ldmia r12,{r3}
mov r0,r5
mov r1,0x8
mov r2,0x100
bl 0x201b4a4	;func_0201b4f4
str r0,[r5,0x290]
ldr r1,[r5,0x290]
cmp r1,0x0
beq _022fedb8
mov r0,0x40
str r0,[r1,0x4c]
mov r0,0x54
strh r0,[r1,0x76]
ldrh r0,[r1,0x12]
strh r0,[r4,0x14]
_022fedb8:
mov r0,r5
mov r1,0x5
mov r2,0x2
bl 0x200d020	;func_0200d078
mov r0,0x7
strb r0,[r5,0xd]
b _022ff4b4
_022fedd4:
mov r0,r5
bl 0x21c3168	;func_ov000_021c3228
cmp r0,0x0
beq _022fee00
mov r0,r5
mov r1,0x4
mov r2,0x2
bl 0x200d020	;func_0200d078
mov r0,0x2
strb r0,[r5,0xd]
b _022ff4b4
_022fee00:
mov r0,r5
mov r1,0x1
mov r2,0x2
bl 0x200d020	;func_0200d078
mov r0,0x3
strb r0,[r5,0xd]
b _022ff4b4
_022fee1c:
mov r0,r5
mov r1,0x2
mov r2,0x0
bl 0x200cff4	;func_0200d04c
b _022ff4b4
_022fee30:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
beq _022ff4b4
ldr r1,[r5,0x70]
eor r1,r1,0x80
str r1,[r5,0x70]
mov r0,0x1
strb r0,[r5,0xd]
b _022ff4b4
_022fee58:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
beq _022ff4b4
mov r0,r5
mov r1,0x2
mov r2,0x0
bl 0x200d020	;func_0200d078
mov r1,0x4
mov r0,0x100
strb r1,[r5,0xd]
bl 0x2012d38	;func_02012d90
cmp r0,0xc0
bhs _022feeb8
mov r0,0x2000
rsb r0,r0,0x0
str r0,[r5,0x3c]
mov r1,0x800
str r1,[r5,0x14]
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
ldr r0,=0x156
bl 0x2029b38	;func_02029bc0
b _022ff4b4
_022feeb8:
mov r0,0x3800
rsb r0,r0,0x0
str r0,[r5,0x3c]
mov r1,0x1800
str r1,[r5,0x14]
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
ldr r0,=0x157
bl 0x2029b38	;func_02029bc0
b _022ff4b4
_022feee0:
ands r0,r7,0x8
beq _022ff4b4
mov r0,r5
mov r1,0x3
mov r2,0x2
bl 0x200d020	;func_0200d078
mov r0,0x0
str r0,[r5,0x14]
mov r0,0x5
strb r0,[r5,0xd]
b _022ff4b4
_022fef0c:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
movne r0,0x0
strne r0,[r5,0x290]
movne r0,0x1
strneb r0,[r5,0xd]
b _022ff4b4
_022fef2c:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
beq _022ff4b4
mov r0,0x60
strh r0,[r5,0x18]
mov r1,0x0
mov r0,0x4
strh r1,[r5,0x1a]
bl 0x2012d38	;func_02012d90
mov r0,0x4
bl 0x2012d38	;func_02012d90
strb r0,[r5,0xe]
ldrb r1,[r5,0xe]
mov r0,r5
mov r2,0x2
mov r1,r1,lsl 0x1
add r1,r1,0x6
bl 0x200d020	;func_0200d078
ldrb r1,[r5,0xe]
mov r0,r5
mov r1,r1,lsl 0x1
add r1,r1,0x7
bl _func_ov039_022ff5a0
ldrb r0,[r5,0xe]
cmp r0,0x1
beq _022fefa4
cmp r0,0x3
beq _022fefb8
b _022fefd8
_022fefa4:
add r1,r5,0x2c
mov r0,0x6000
ldmia r1,{r1,r2,r3}
bl 0x20297c4	;func_0202984c
b _022fefd8
_022fefb8:
add r0,r5,0x2c
sub r3,r13,0x8
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
ldr r0,=0x6003
mov r1,0x6000
ldmia r3,{r2,r3}
bl 0x2029740	;func_020297e0
_022fefd8:
mov r0,0x8
strb r0,[r5,0xd]
b _022ff4b4
_022fefe4:
ldrsh r0,[r5,0x9e]
cmp r0,0x0
bne _022ff068
ldrh r0,[r5,0xa2]
cmp r0,0x1
bne _022ff068
ldrb r0,[r5,0xe]
cmp r0,0x3
addls r15,r15,r0,lsl 0x2
b _022ff068
b _022ff01c ; case 0
b _022ff030 ; case 1
b _022ff044 ; case 2
b _022ff058 ; case 3
_022ff01c:
add r1,r5,0x2c
mov r0,0x158
ldmia r1,{r1,r2,r3}
bl 0x2029b38	;func_02029bc0
b _022ff068
_022ff030:
ldr r0,=0x159
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
bl 0x2029b38	;func_02029bc0
b _022ff068
_022ff044:
ldr r0,=0x15a
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
bl 0x2029b38	;func_02029bc0
b _022ff068
_022ff058:
ldr r0,=0x15b
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
bl 0x2029b38	;func_02029bc0
_022ff068:
mov r0,r5
bl 0x200cdc4	;func_0200ce1c
ldrh r0,[r0,0x0]
ldrsh r1,[r5,0x9e]
sub r0,r0,0x2
cmp r1,r0
blt _022ff4b4
mov r0,0x1
str r0,[r4,0x0]
mov r0,0x20
strh r0,[r5,0x1c]
mov r0,0x9
strb r0,[r5,0xd]
b _022ff4b4
_022ff0a0:
ldrsh r0,[r5,0x1c]
sub r0,r0,0x1
strh r0,[r5,0x1c]
ldrsh r0,[r5,0x1c]
cmp r0,0x0
bne _022ff4b4
mov r0,0x1
str r0,[r4,0x0]
ldrb r0,[r5,0xe]
add r0,r0,0xa
strb r0,[r5,0xd]
b _022ff4b4
_022ff0d0:
mov r0,0x1
str r0,[r4,0x0]
ldrb r2,[r5,0xe]
ldr r3,=_0x2300410
ldrsh r1,[r5,0x18]
mov r0,0x14
mla r3,r2,r0,r3
sub r1,r1,0x1
strh r1,[r5,0x18]
mov r0,0x80000
str r0,[r13,0x10]
ldr r0,[r5,0x70]
ldr r1,[r3,0xc]
ands r0,r0,0x80
ldr r0,[r13,0x10]
rsbne r1,r1,0x0
add r0,r0,r1
str r0,[r13,0x10]
ldrsh r6,[r5,0x18]
ldr r3,[r3,0x10]
mov r2,0x380
mov r0,r6,asr 0x4
add r0,r6,r0,lsr 0x1b
mov r0,r0,asr 0x5
add r0,r3,r0,lsl 0x12
str r0,[r13,0x14]
ldrb r3,[r5,0xe]
add r1,r13,0x10
mov r0,r5
str r3,[r13,0x0]
str r6,[r13,0x4]
str r2,[r13,0x8]
ldmia r1,{r1,r2,r3}
bl _func_ov039_022ffdb8
ldrsh r0,[r5,0x18]
cmp r0,0x0
moveq r0,0x5
streqb r0,[r5,0xd]
b _022ff4b4
_022ff16c:
mov r0,0x1
str r0,[r4,0x0]
ldrsh r0,[r5,0x18]
ldrb r2,[r5,0xe]
ldr r3,=_0x2300410
sub r1,r0,0x1
mov r0,0x14
strh r1,[r5,0x18]
mov r1,0x80000
str r1,[r13,0x10]
mla r0,r2,r0,r3
ldrsh r1,[r5,0x18]
ldr r3,[r5,0x70]
ldr r6,[r0,0xc]
mov r2,r1,asr 0x3
add r2,r1,r2,lsr 0x1c
mov r2,r2,asr 0x4
add r6,r6,r2,lsl 0x11
ands r2,r3,0x80
ldr r2,[r13,0x10]
rsbne r6,r6,0x0
add r2,r2,r6
str r2,[r13,0x10]
ldr r0,[r0,0x10]
mov r3,0x380
str r0,[r13,0x14]
ldrb r6,[r5,0xe]
add r2,r13,0x10
mov r0,r5
str r6,[r13,0x0]
str r1,[r13,0x4]
str r3,[r13,0x8]
ldmia r2,{r1,r2,r3}
bl _func_ov039_022ffdb8
ldrsh r0,[r5,0x18]
cmp r0,0x0
moveq r0,0x5
streqb r0,[r5,0xd]
b _022ff4b4
_022ff208:
mov r0,0x1
str r0,[r4,0x0]
ldrb r1,[r5,0xe]
ldr r2,=_0x2300410
mov r0,0x14
mla r6,r1,r0,r2
mov r0,0x80000
str r0,[r13,0x10]
mvn r0,0xf
mov r1,0x10
bl 0x2012d18	;func_02012d70
ldr r2,[r6,0xc]
ldr r1,[r5,0x70]
add r3,r2,r0,lsl 0xc
ands r0,r1,0x80
ldr r0,[r13,0x10]
rsbne r3,r3,0x0
add r0,r0,r3
str r0,[r13,0x10]
ldr r0,[r6,0x10]
mov r2,0x2c0
str r0,[r13,0x14]
ldrb r3,[r5,0xe]
add r1,r13,0x10
mov r0,r5
str r3,[r13,0x0]
ldrsh r3,[r5,0x18]
str r3,[r13,0x4]
str r2,[r13,0x8]
ldmia r1,{r1,r2,r3}
bl _func_ov039_022ffdb8
ldrsh r0,[r5,0x18]
sub r0,r0,0x1
strh r0,[r5,0x18]
ldrsh r0,[r5,0x18]
cmp r0,0x0
moveq r0,0x5
streqb r0,[r5,0xd]
b _022ff4b4
_022ff2a4:
mov r0,0x1
str r0,[r4,0x0]
ldrb r1,[r5,0xe]
ldr r2,=_0x2300410
mov r0,0x14
mla r6,r1,r0,r2
mov r0,0x80000
str r0,[r13,0x10]
ldr r0,[r5,0x70]
ldr r2,[r6,0xc]
ands r0,r0,0x80
ldr r1,[r13,0x10]
rsbne r2,r2,0x0
add r1,r1,r2
str r1,[r13,0x10]
mvn r0,0xf
mov r1,0x10
bl 0x2012d18	;func_02012d70
ldr r1,[r6,0x10]
mov r2,0x3c0
add r0,r1,r0,lsl 0xc
str r0,[r13,0x14]
ldrb r3,[r5,0xe]
add r1,r13,0x10
mov r0,r5
str r3,[r13,0x0]
ldrsh r3,[r5,0x18]
str r3,[r13,0x4]
str r2,[r13,0x8]
ldmia r1,{r1,r2,r3}
bl _func_ov039_022ffdb8
ldrsh r0,[r5,0x18]
sub r0,r0,0x1
strh r0,[r5,0x18]
ldrsh r0,[r5,0x18]
cmp r0,0x0
moveq r0,0x5
streqb r0,[r5,0xd]
b _022ff4b4
_022ff340:
mov r0,0x140
bl 0x2214af8	;func_ov000_02214d20
mov r0,0xf
mov r1,0x1
bl 0x22149e0	;func_ov000_02214c00
mov r0,0xf
strb r0,[r5,0xd]
b _022ff4b4
_022ff360:
bl 0x2215378	;func_ov000_022155a0
cmp r0,0x0
beq _022ff4b4
bgt _022ff3b0
ldr r0,=0x6002
add r1,r5,0x2c
ldmia r1,{r1,r2,r3}
bl 0x20297c4	;func_0202984c
ldrb r0,[r5,0x260]
bl 0x2214a20	;func_ov000_02214c40
add r1,r5,0x200
strh r0,[r1,0x58]
ldr r0,[r5,0x250]
bic r0,r0,0x1
str r0,[r5,0x250]
ldrb r0,[r5,0xf]
strb r0,[r5,0xd]
b _022ff4b4
_022ff3b0:
ldr r2,[r5,0x250]
bic r2,r2,0x1
str r2,[r5,0x250]
mov r1,0x0
mov r0,r5
bl 0x21c3934	;func_ov000_021c39f4
add r1,r5,0x2c
ldr r0,=0x6001
ldmia r1,{r1,r2,r3}
bl 0x2029b38	;func_02029bc0
mov r0,r5
mov r1,0xf
mov r2,0x2
bl 0x200d020	;func_0200d078
bl _func_ov039_022ffa74
ldr r1,=0x208ac20
mov r2,0x10
ldr r0,[r1,0x0]
add r0,r0,0x36800
ldrh r3,[r0,0x58]
orr r3,r3,0x8000
strh r3,[r0,0x58]
ldr r0,[r1,0x0]
add r0,r0,0x36000
ldr r1,[r0,0x61c]
orr r1,r1,0x4
str r1,[r0,0x61c]
strb r2,[r5,0xd]
b _022ff4b4
_022ff424:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
beq _022ff4b4
mov r3,0x8
mov r0,r5
mov r1,0x10
mov r2,0x0
strh r3,[r5,0x18]
bl 0x200d020	;func_0200d078
mov r0,0x11
strb r0,[r5,0xd]
b _022ff4b4
_022ff458:
mov r0,r5
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
beq _022ff4b4
ldrh r0,[r5,0xa0]
bic r0,r0,0x1
strh r0,[r5,0xa0]
ldrsh r0,[r5,0x18]
cmp r0,0x0
subgt r0,r0,0x1
strgth r0,[r5,0x18]
bne _022ff4b4
mov r0,r5
bl _func_ov039_022ff714
mov r1,0x29
strh r1,[r5,0x74]
mov r0,r5
bl _func_ov039_022ff8e4
mov r0,r5
bl 0x2012ae0	;func_02012b38
add r13,r13,0x1c
ldmfd r13!,{r4,r5,r6,r7,r15}
_022ff4b4:
ldr r0,[r5,0x290]
cmp r0,0x0
beq _022ff528
ldrh r2,[r0,0x12]
ldrh r1,[r4,0x14]
cmp r2,r1
movne r0,0x0
strne r0,[r5,0x290]
bne _022ff528
ldrsh r2,[r5,0x1a]
ldr r1,=0xffff
ldr r3,=0x2086390
add r2,r2,0x80
strh r2,[r5,0x1a]
ldrsh r6,[r5,0x1a]
ldr r2,=0x2aaaaaab
and r1,r6,r1
strh r1,[r5,0x1a]
ldrh r1,[r5,0x1a]
mov r1,r1,asr 0x4
mov r1,r1,lsl 0x2
ldrsh r3,[r3,r1]
smull r1,r6,r2,r3
mov r6,r6,asr 0x2
mov r1,r3,lsr 0x1f
adds r6,r1,r6
rsbmi r6,r6,0x0
add r1,r6,0x40
str r1,[r0,0x4c]
_022ff528:
ldr r0,[r4,0x0]
cmp r0,0x0
bne _022ff53c
mov r0,r5
bl 0x200ce00	;func_0200ce58
_022ff53c:
mov r2,0x0
str r2,[r4,0x0]
mov r0,r5
mov r1,0x20
bl 0x21c4cfc	;func_ov000_021c4dbc
add r13,r13,0x1c
ldmfd r13!,{r4,r5,r6,r7,r15}
.pool
;arm_func_end func_ov039_022febb8

_func_ov039_022ff5a0:
stmfd r13!,{r4,r5,r6,r14}
sub r13,r13,0x8
ldr r2,=_func_ov039_022ff6e4
mov r6,r0
mov r5,r1
mov r0,0x81
mov r1,0xef
bl 0x2012b10	;func_02012b68
movs r4,r0
addeq r13,r13,0x8
ldmeqfd r13!,{r4,r5,r6,r15}
mov r0,r6
mov r1,r4
bl 0x201b340	;func_0201b390
cmp r0,0x0
bne _022ff5f8
mov r0,r4
bl 0x2012ae0	;func_02012b38
add r13,r13,0x8
ldmfd r13!,{r4,r5,r6,r15}
_022ff5f8:
ldr r1,=0x21c52ec	;0x21c53ac
add r0,r6,0x2c
str r1,[r4,0x4]
add r3,r4,0x2c
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
mov r0,r4
bl 0x200d0bc	;func_0200d114
mov r0,r4
mov r1,r5
bl 0x200d030	;func_0200d088
ldr r0,=0x5680
str r0,[r4,0x34]
ldr r0,[r6,0x70]
ands r0,r0,0x80
ldrne r0,[r4,0x70]
orrne r0,r0,0x80
strne r0,[r4,0x70]
ldreq r0,[r4,0x70]
biceq r0,r0,0x80
streq r0,[r4,0x70]
bl 0x201c0cc	;func_0201c11c
strb r0,[r4,0x80]
mov r1,0x10
ldr r0,=_0x23003d4
strb r1,[r4,0x81]
ldrb r5,[r0,0x0]
ldrb r2,[r0,0x1]
ldr r3,=_0x23003d0
sub r14,r13,0x4
strb r5,[r13,0x0]
strb r2,[r13,0x1]
ldrb r5,[r0,0x2]
ldrb r12,[r0,0x3]
mov r0,r4
mov r2,0x0
strb r5,[r13,0x2]
strb r12,[r13,0x3]
ldrb r12,[r3,0x0]
ldrb r4,[r3,0x1]
strb r12,[r14,0x0]
strb r4,[r14,0x1]
ldrb r4,[r3,0x2]
ldrb r3,[r3,0x3]
strb r4,[r14,0x2]
strb r3,[r14,0x3]
ldmia r14,{r3}
bl 0x201b4a4	;func_0201b4f4
cmp r0,0x0
movne r1,0x0
strneh r1,[r0,0x1a]
add r13,r13,0x8
ldmfd r13!,{r4,r5,r6,r15}
.pool
;arm_func_end func_ov039_022ff5a0

_func_ov039_022ff6e4:
stmfd r13!,{r4,r14}
mov r4,r0
bl 0x200ce00	;func_0200ce58
mov r0,r4
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
ldmeqfd r13!,{r4,r15}
mov r0,r4
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r15}
.pool
;arm_func_end func_ov039_022ff6e4

_func_ov039_022ff714:
stmfd r13!,{r4,r5,r14}
mov r5,r0
mov r0,0x81
mov r1,0xef
ldr r2,=_func_ov039_022ff7ec
bl 0x2012b10	;func_02012b68
movs r4,r0
ldmeqfd r13!,{r4,r5,r15}
mov r0,r5
mov r1,r4
bl 0x201b340	;func_0201b390
mov r0,r4
bl 0x200d0bc	;func_0200d114
mov r0,r4
mov r1,0x11
mov r2,0x0
bl 0x200d020	;func_0200d078
ldr r0,[r5,0x70]
tst r0,0x80
ldr r0,[r4,0x70]
orrne r0,r0,0x80
biceq r0,r0,0x80
str r0,[r4,0x70]
add r3,r4,0x2c
add r0,r5,0x2c
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
ldr r1,=0x21c52ec	;0x21c53ac
ldr r0,=0x209a164	;0x209a074
str r1,[r4,0x4]
ldr r1,[r4,0x70]
add r3,r4,0x50
orr r1,r1,0xc
str r1,[r4,0x70]
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
mov r1,0x40
strh r1,[r4,0x1c]
str r1,[r4,0x40]
mov r0,0x1000
str r0,[r4,0x14]
mov r0,0x100
str r0,[r4,0x4c]
ldmfd r13!,{r4,r5,r15}
.pool
;arm_func_end func_ov039_022ff714

_func_ov039_022ff7ec:
stmfd r13!,{r4,r5,r14}
mov r4,r0
ldrsh r1,[r4,0x1c]
cmp r1,0x0
beq _022ff81c
sub r1,r1,0x1
strh r1,[r4,0x1c]
bl 0x200ce00	;func_0200ce58
ldmfd r13!,{r4,r5,r15}
_022ff81c:
bl 0x201937c	;func_020193cc
cmp r0,0x0
beq _022ff83c
mov r0,r4
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r5,r15}
_022ff83c:
ldr r1,[r4,0x14]
mov r0,0x1e
mul r2,r1,r0
mov r0,r2,asr 0xb
add r0,r2,r0,lsr 0x14
mov r0,r0,asr 0xc
add r0,r0,0x1
strb r0,[r4,0x81]
ldr r5,[r4,0x14]
mov r0,r5
bl 0x2074F20	;FloatConvertFromInt
ldr r1,=0x45666666
bl 0x2073C5C
cmp r0,0x0
beq _022ff8cc
mov r0,r5,asr 0x2
add r0,r5,r0,lsr 0x1d
mov r1,r0,asr 0x3
add r0,r4,0x2c
rsb r1,r1,0x1000
bl 0x201ab68	;func_0201abb8
cmp r0,0x0
beq _022ff8cc
ldr r1,[r4,0x14]
cmp r1,0x800
bge _022ff8c0
cmp r0,0x2
bne _022ff8c0
mov r0,r4
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r5,r15}
_022ff8c0:
add r0,r4,0x38
mov r1,0x10
bl 0x201c758	;func_0201c7a8
_022ff8cc:
mov r0,r4
bl 0x200ce00	;func_0200ce58
ldmfd r13!,{r4,r5,r15}
.pool
;arm_func_end func_ov039_022ff7ec

_func_ov039_022ff8e4:
stmfd r13!,{r4,r5,r6,r7,r8,r9,r10,r11,r14}
sub r13,r13,0xc
mov r10,r0
bl 0x200cd98	;func_0200cdf0
ldrb r8,[r0,0x3]
mov r9,0x0
cmp r8,0x0
addle r13,r13,0xc
ldmleia r13!,{r4,r5,r6,r7,r8,r9,r10,r11,r15}
mov r0,0x1000
rsb r0,r0,0x0
mov r7,0x10
str r0,[r13,0x0]
mov r0,0x200
mov r4,r9
str r7,[r13,0x4]
str r0,[r13,0x8]
mov r6,0x81
mov r11,0xef
_022ff934:
ldr r2,=_func_ov039_022ff9cc
mov r0,r6
mov r1,r11
bl 0x2012b10	;func_02012b68
movs r5,r0
beq _022ff9a8
mov r0,r10
mov r1,r5
mov r2,r9
bl 0x2019274	;func_020192c4
ldr r1,[r10,0x34]
ldr r0,[r13,0x0]
str r1,[r5,0x34]
ldr r1,=0x2019330	;func_02019380
str r1,[r5,0x4]
ldr r2,[r5,0x70]
mov r1,r4
orr r2,r2,0xc
str r2,[r5,0x70]
str r4,[r5,0x38]
bl 0x2012d18	;func_02012d70
str r0,[r5,0x3c]
ldr r0,[r13,0x4]
str r0,[r5,0x40]
add r0,r9,r7
strh r0,[r5,0x1c]
ldr r0,[r13,0x8]
bl 0x2012d58	;func_02012db0
str r0,[r5,0x4c]
_022ff9a8:
add r7,r7,0x20
add r9,r9,0x1
cmp r9,r8
blt _022ff934
add r13,r13,0xc
ldmfd r13!,{r4,r5,r6,r7,r8,r9,r10,r11,r15}
.pool
;arm_func_end func_ov039_022ff8e4

_func_ov039_022ff9cc:
stmfd r13!,{r4,r14}
mov r4,r0
ldrsh r1,[r4,0x1c]
cmp r1,0x0
beq _022ffa08
cmp r1,0x20
bge _022ff9f4
add r1,r4,0x2c
ldmia r1,{r1,r2,r3}
bl _func_ov039_022ffbc4
_022ff9f4:
ldrsh r0,[r4,0x1c]
sub r0,r0,0x1
strh r0,[r4,0x1c]
ldmfd r13!,{r4,r15}
_022ffa08:
bl 0x201937c	;func_020193cc
cmp r0,0x0
beq _022ffa24
mov r0,r4
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r15}
_022ffa24:
add r0,r4,0x2c
mov r1,0x1000
bl 0x201ab68	;func_0201abb8
cmp r0,0x0
ldmeqfd r13!,{r4,r15}
ldr r1,[r4,0x14]
cmp r1,0x800
bge _022ffa60
cmp r0,0x2
bne _022ffa60
mov r0,r4
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r15}
_022ffa60:
add r0,r4,0x38
mov r1,0x10
bl 0x201c758	;func_0201c7a8
ldmfd r13!,{r4,r15}
.pool
;arm_func_end func_ov039_022ff9cc

_func_ov039_022ffa74:
stmfd r13!,{r14}
ldr r2,=_func_ov039_022ffab0
mov r0,0x81
mov r1,0xef
bl 0x2012b10	;func_02012b68
cmp r0,0x0
movne r1,0x3000
strne r1,[r0,0xd0]
movne r1,0x80000
strne r1,[r0,0xd4]
ldmfd r13!,{r15}
.pool
;arm_func_end func_ov039_022ffa74

_func_ov039_022ffab0:
stmfd r13!,{r4,r14}
sub r13,r13,0x18
ldr r1,=0x208ac20
mov r4,r0
ldr r1,[r1,0x0]
add r1,r1,0x36000
ldr r1,[r1,0x61c]
ands r1,r1,0x8
bne _022ffb20
mov r1,0x72
strb r1,[r4,0x260]
add r1,r4,0x2c
ldmia r1,{r1,r2,r3}
bl 0x21c38e0	;func_ov000_021c39a0
ldr r1,=0x208ac20
mov r0,0x5
ldr r1,[r1,0x0]
add r1,r1,0x36000
ldr r2,[r1,0x61c]
bic r2,r2,0x4
str r2,[r1,0x61c]
bl 0x201ad60	;func_0201adb0
bl 0x20298a0	;func_02029928
mov r0,r4
bl 0x2012ae0	;func_02012b38
add r13,r13,0x18
ldmfd r13!,{r4,r15}
_022ffb20:
add r0,r13,0xc
bl 0x22149f8	;func_ov000_02214c18
add r0,r13,0xc
add r3,r4,0x2c
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
ldrsh r1,[r4,0x18]
ldr r0,=0xffff
add r1,r1,0x300
strh r1,[r4,0x18]
ldrsh r1,[r4,0x18]
and r0,r1,r0
strh r0,[r4,0x18]
ldr r0,[r4,0xd0]
cmp r0,0x5000
addlt r0,r0,0x80
strlt r0,[r4,0xd0]
ldr r0,[r4,0xd4]
cmp r0,0x10
ble _022ffb84
bl 0x2074F20	;FloatConvertFromInt
ldr r1,=0x44cccccd
bl 0x20754d8	;func_020754d4
bl 0x2074da8	;FloatConvertToInt	;func_02074da4
str r0,[r4,0xd4]
_022ffb84:
mov r0,0x5
str r0,[r13,0x0]
ldr r1,[r4,0xd4]
add r0,r4,0x2c
str r1,[r13,0x4]
ldrh r1,[r4,0x18]
str r1,[r13,0x8]
ldr r3,[r4,0xd0]
ldmia r0,{r0,r1,r2}
bl 0x201ac88	;func_0201acd8
add r13,r13,0x18
ldmfd r13!,{r4,r15}
.pool
;arm_func_end func_ov039_022ffab0

_func_ov039_022ffbc4:
stmfd r13!,{r0,r1,r2,r3}
stmfd r13!,{r4,r5,r14}
sub r13,r13,0x4
ldr r2,=_func_ov039_022ffcdc
mov r5,r0
mov r0,0x81
mov r1,0xef
bl 0x2012b10	;func_02012b68
movs r4,r0
addeq r13,r13,0x4
ldmeqfd r13!,{r4,r5,r14}
addeq r13,r13,0x10
bxeq r14
mov r0,r5
mov r1,r4
bl 0x201b340	;func_0201b390
cmp r0,0x0
bne _022ffc24
mov r0,r4
bl 0x2012ae0	;func_02012b38
add r13,r13,0x4
ldmfd r13!,{r4,r5,r14}
add r13,r13,0x10
bx r14
_022ffc24:
ldr r0,=0x21c52ec	;0x21c53ac
mov r1,0x1000
str r0,[r4,0x4]
ldr r2,[r4,0x70]
ldr r0,=0x209a164	;0x209a074
orr r2,r2,0xc
str r2,[r4,0x70]
str r1,[r4,0x14]
add r3,r4,0x50
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
add r0,r13,0x14
add r3,r4,0x2c
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
mov r0,r4
bl 0x200d0bc	;func_0200d114
mov r0,r4
mov r1,0x14
bl 0x200d030	;func_0200d088
mov r1,0x4000
mov r2,0x5500
rsb r0,r1,0x0
str r2,[r4,0x34]
bl 0x2012d18	;func_02012d70
mov r1,0x1000
mov r2,0x6000
str r0,[r4,0x38]
rsb r1,r1,0x0
rsb r0,r2,0x0
bl 0x2012d18	;func_02012d70
str r0,[r4,0x3c]
mov r0,0x40
str r0,[r4,0x40]
bl 0x2012d78	;func_02012dd0
strh r0,[r4,0x60]
mov r0,0x200
bl 0x2012d58	;func_02012db0
str r0,[r4,0x4c]
add r13,r13,0x4
ldmfd r13!,{r4,r5,r14}
add r13,r13,0x10
bx r14
.pool
;arm_func_end func_ov039_022ffbc4

_func_ov039_022ffcdc:
stmfd r13!,{r4,r5,r14}
mov r5,r0
bl 0x201937c	;func_020193cc
cmp r0,0x0
beq _022ffd08
mov r0,r5
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r5,r15}
_022ffd08:
ldr r4,[r5,0x14]
mov r0,r4
bl 0x2074F20
ldr r1,=0x45666666
bl 0x2073C5C
cmp r0,0x0
beq _022ffd78
mov r0,r4,asr 0x2
add r0,r4,r0,lsr 0x1d
mov r1,r0,asr 0x3
add r0,r5,0x2c
rsb r1,r1,0x1000
bl 0x201ab68	;func_0201abb8
cmp r0,0x0
beq _022ffd78
ldr r1,[r5,0x14]
cmp r1,0x800
bge _022ffd6c
cmp r0,0x2
bne _022ffd6c
mov r0,r5
bl 0x2012ae0	;func_02012b38
ldmfd r13!,{r4,r5,r15}
_022ffd6c:
add r0,r5,0x38
mov r1,0x10
bl 0x201c758	;func_0201c7a8
_022ffd78:
mov r0,r5
bl 0x200ce00	;func_0200ce58
mov r0,0x50
bl 0x2012d38	;func_02012d90
cmp r0,0x0
ldmnefd r13!,{r4,r5,r15}
add r1,r5,0x2c
mov r0,0x15c
ldmia r1,{r1,r2,r3}
bl 0x2029b38	;func_02029bc0
ldmfd r13!,{r4,r5,r15}
.pool
;arm_func_end func_ov039_022ffcdc

_func_ov039_022ffdb8:
stmfd r13!,{r0,r1,r2,r3}
stmfd r13!,{r4,r5,r6,r7,r14}
sub r13,r13,0x4
ldr r2,[r13,0x28]
ldr r3,=_0x2300410
mov r1,0x14
mla r4,r2,r1,r3
mov r7,r0
ldr r2,=_func_ov039_022ffff0
mov r0,0x30
mov r1,0x80
bl 0x2012b10	;func_02012b68
movs r6,r0
addeq r13,r13,0x4
ldmeqfd r13!,{r4,r5,r6,r7,r14}
addeq r13,r13,0x10
bxeq r14
mov r0,r7
mov r1,r6
bl 0x201b340	;func_0201b390
cmp r0,0x0
bne _022ffe28
mov r0,r6
bl 0x2012ae0	;func_02012b38
add r13,r13,0x4
ldmfd r13!,{r4,r5,r6,r7,r14}
add r13,r13,0x10
bx r14
_022ffe28:
mov r0,0x1
strb r0,[r6,0x261]
ldrb r2,[r7,0x260]
mov r1,0x2
ldr r0,=0x21c52ec	;0x21c53ac
strb r2,[r6,0x260]
strh r1,[r6,0x10]
str r0,[r6,0x4]
ldr r1,[r6,0x70]
add r0,r13,0x1c
orr r1,r1,0x4
str r1,[r6,0x70]
ldr r1,[r6,0x70]
add r3,r6,0x2c
orr r1,r1,0x80
str r1,[r6,0x70]
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
mov r0,r6
add r5,r6,0xd0
bl 0x200d0bc	;func_0200d114
mov r0,r6
mov r1,0x12
bl 0x200d030	;func_0200d088
mov r0,0x5500
str r0,[r6,0x34]
mov r0,r6
bl 0x21c34a8	;func_ov000_021c3568
mov r1,0x1
add r0,r6,0x200
strh r1,[r0,0x58]
ldr r2,=_func_ov039_02300368
ldr r3,=_func_ov039_02300358
mov r0,r6
mov r1,0x8
bl 0x20143ec	;func_02014444
add r0,r6,0x200
ldrsh r0,[r0,0x6a]
bl 0x2074F20
mov r1,r0
mov r0,0x3f400000
bl 0x2074fec	;func_02074fe8
bl 0x2074da8	;func_02074da4
mov r1,r0
mov r0,r6
mov r2,0x44
bl 0x20143d4	;func_0201442c
ldrb r1,[r6,0x260]
mov r0,r6
bl 0x21c347c	;func_ov000_021c353c
mov r0,r6
mov r1,0x10
bl 0x2014374	;func_020143cc
mov r0,0x1000
bl 0x2012d38	;func_02012d90
add r0,r0,0x4000
str r0,[r6,0x40]
ldr r0,[r7,0x70]
mov r1,0x200
ands r0,r0,0x80
movne r0,0x1
strne r0,[r5,0x0]
rsb r0,r1,0x0
bl 0x2012d18	;func_02012d70
ldrsh r1,[r4,0x0]
add r0,r1,r0
strh r0,[r6,0x60]
ldr r0,[r5,0x0]
ldrsh r1,[r13,0x30]
cmp r0,0x0
ldrnesh r0,[r6,0x60]
rsbne r0,r0,0x8000
strneh r0,[r6,0x60]
ldrsh r2,[r6,0x60]
ldr r0,=0xffff
and r0,r2,r0
strh r0,[r6,0x60]
str r1,[r6,0x4c]
ldr r0,[r13,0x2c]
mov r1,0x3c
strh r0,[r6,0x18]
ldrsh r2,[r4,0x2]
ldr r0,[r13,0x28]
strh r2,[r6,0x1a]
strh r1,[r6,0x1c]
str r0,[r5,0x4]
ldrh r0,[r6,0x60]
ldr r2,=0x2086394	;0x2086390
ldr r1,[r6,0x2c]
mov r0,r0,asr 0x4
mov r0,r0,lsl 0x1
add r0,r0,0x1
mov r0,r0,lsl 0x1
ldrsh r0,[r2,r0]
add r0,r1,r0,lsl 0x8
str r0,[r5,0x8]
ldrh r0,[r6,0x60]
ldr r1,[r6,0x30]
mov r0,r0,asr 0x4
mov r0,r0,lsl 0x2
ldrsh r0,[r2,r0]
add r0,r1,r0,lsl 0x8
str r0,[r5,0xc]
add r13,r13,0x4
ldmfd r13!,{r4,r5,r6,r7,r14}
add r13,r13,0x10
bx r14
.pool
;arm_func_end func_ov039_022ffdb8

_func_ov039_022ffff0:
stmfd r13!,{r4,r5,r14}
sub r13,r13,0x1c
ldr r1,=0x208ac20
mov r5,r0
ldr r1,[r1,0x0]
add r4,r5,0xd0
add r1,r1,0x36000
ldr r1,[r1,0x61c]
ands r1,r1,0x4
beq _02300060
mvn r1,0xf
mov r4,0xd0
mov r2,r1
mov r3,0x110
str r4,[r13,0x0]
bl 0x21c4b54	;func_ov000_021c4c14
cmp r0,0x0
beq _0230004c
mov r3,0x0
str r3,[r13,0x0]
add r0,r5,0x2c
ldmia r0,{r0,r1,r2}
bl 0x201a598	;func_0201a5e8
_0230004c:
mov r0,r5
bl 0x2012ae0	;func_02012b38
add r13,r13,0x1c
ldmfd r13!,{r4,r5,r15}
_02300060:
ldrsh r0,[r5,0x1a]
cmp r0,0x0
beq _023000c8
sub r0,r0,0x1
strh r0,[r5,0x1a]
ldrsh r0,[r5,0x1a]
cmp r0,0x0
bne _023000c8
ldr r2,[r4,0x4]
ldr r3,=_0x2300410
mov r0,0x14
mla r3,r2,r0,r3
ldr r1,[r4,0x0]
cmp r1,0x0
ldreq r1,[r5,0x2c]
ldreq r0,[r3,0x4]
addeq r0,r1,r0
streq r0,[r4,0x8]
ldrne r1,[r5,0x2c]
ldrne r0,[r3,0x4]
subne r0,r1,r0
strne r0,[r4,0x8]
ldr r1,[r5,0x30]
ldr r0,[r3,0x8]
add r0,r1,r0
str r0,[r4,0xc]
_023000c8:
mov r1,0x10000
rsb r0,r1,0x0
bl 0x2012d18	;func_02012d70
ldr r2,[r4,0x8]
mov r1,0x10000
add r0,r2,r0
str r0,[r13,0x10]
rsb r0,r1,0x0
bl 0x2012d18	;func_02012d70
ldr r2,[r4,0xc]
add r1,r13,0x10
add r0,r2,r0
str r0,[r13,0x14]
ldrsh r0,[r5,0x60]
sub r3,r13,0x4
add r4,r5,0x2c
str r0,[r13,0x8]
ldr r0,[r5,0x4c]
str r0,[r13,0xc]
ldmia r1,{r0,r1,r2}
stmia r3,{r0,r1,r2}
ldmia r4,{r0,r1,r2}
ldmia r3,{r3}
bl 0x201c414	;func_0201c464
strh r0,[r5,0x60]
mov r0,r5
bl _func_ov039_0230018c
cmp r0,0x0
beq _02300150
mov r0,r5
bl 0x2012ae0	;func_02012b38
add r13,r13,0x1c
ldmfd r13!,{r4,r5,r15}
_02300150:
mov r0,0x50
bl 0x2012d38	;func_02012d90
cmp r0,0x0
addne r13,r13,0x1c
ldmnefd r13!,{r4,r5,r15}
mov r1,r4
ldmia r1,{r1,r2,r3}
mov r0,0x15c
bl 0x2029b38	;func_02029bc0
add r13,r13,0x1c
ldmfd r13!,{r4,r5,r15}
.pool
;arm_func_end func_ov039_022ffff0

_func_ov039_0230018c:
stmfd r13!,{r4,r14}
sub r13,r13,0x30
mov r4,r0
ldrb r1,[r4,0xf]
cmp r1,0x0
bne _02300298
add r1,r4,0x200
ldrsh r1,[r1,0x58]
cmp r1,0x0
bne _023001d8
ldr r2,[r4,0x70]
mov r1,0x15
bic r3,r2,0x100
mov r2,0x2
str r3,[r4,0x70]
bl 0x200d020	;func_0200d078
mov r0,0x1
strb r0,[r4,0xf]
b _023002b8
_023001d8:
bl _func_ov039_023002cc
ldrsh r0,[r4,0x1c]
mvn r1,0xf
mov r12,0xd0
cmp r0,0x0
subne r0,r0,0x1
strneh r0,[r4,0x1c]
ldrsh r2,[r4,0x18]
mov r0,r4
add r3,r2,0x1
strh r3,[r4,0x18]
mov r2,r1
mov r3,0x110
str r12,[r13,0x0]
bl 0x21c4b54	;func_ov000_021c4c14
cmp r0,0x0
beq _0230027c
ldrsh r0,[r4,0x18]
tst r0,0x1
bne _023002b8
ldr r1,=_0x23003e8
mov r3,0x0
ldrh r14,[r1,0x0]
ldrh r12,[r1,0x2]
mov r2,0x3
mov r0,r4
strh r14,[r13,0x0]
strh r12,[r13,0x2]
ldrh r14,[r1,0x4]
ldrh r12,[r1,0x6]
add r1,r4,0x2c
strh r14,[r13,0x4]
strh r12,[r13,0x6]
str r3,[r13,0x8]
str r2,[r13,0xc]
ldmia r1,{r1,r2,r3}
bl 0x2013270	;func_020132c8
add r0,r13,0x10
mov r1,r4
bl 0x2013bb4	;func_02013c0c
b _023002b8
_0230027c:
ldrsh r0,[r4,0x1c]
cmp r0,0x0
bne _023002b8
add r13,r13,0x30
mov r0,0x1
ldmfd r13!,{r4,r15}
_02300298:
bl 0x200ce00	;func_0200ce58
mov r0,r4
bl 0x200cdf4	;func_0200ce4c
cmp r0,0x0
addne r13,r13,0x30
movne r0,0x1
ldmnefd r13!,{r4,r15}
_023002b8:
mov r0,0x0
add r13,r13,0x30
ldmfd r13!,{r4,r15}
.pool
;arm_func_end func_ov039_0230018c

_func_ov039_023002cc:
stmfd r13!,{r4,r5,r6,r14}
mov r5,r0
ldrh r2,[r5,0x60]
ldr r1,[r5,0x40]
add r0,r5,0x38
bl 0x201c6b8	;func_0201c708
mov r0,r5
bl 0x21c339c	;func_ov000_021c345c
ldrsh r1,[r5,0x60]
ldr r0,=0xffff
ldr r4,=_0x23003e0
sub r1,r1,0x2000
and r1,r1,r0
mov r0,r1,asr 0xd
add r0,r1,r0,lsr 0x12
mov r6,r0,asr 0xe
add r0,r4,r6,lsl 0x1
ldrb r1,[r0,0x1]
mov r0,r5
mov r2,0x0
bl 0x200cff4	;func_0200d04c
ldrb r0,[r4,r6,lsl 0x1]
cmp r0,0x0
ldr r0,[r5,0x70]
orrne r0,r0,0x100
biceq r0,r0,0x100
str r0,[r5,0x70]
mov r0,r5
bl 0x200ce00	;func_0200ce58
ldmfd r13!,{r4,r5,r6,r15}
.pool
;arm_func_end func_ov039_023002cc

_func_ov039_02300358:
add r0,r0,0x200
mov r1,0x0
strh r1,[r0,0x58]
bx r14
.pool
;arm_func_end func_ov039_02300358

_func_ov039_02300368:
ldr r15,=0x21c3774	;0x21c3834
.pool
;arm_func_end func_ov039_02300368

_func_ov039_02300374:
stmfd r13!,{r4,r14}
mov r4,r0
bl 0x21c3e8c	;func_ov000_021c3f4c
cmp r0,0x0
ldmeqfd r13!,{r4,r15}
ldr r1,[r4,0x250]
mov r0,0xe
orr r1,r1,0x1
str r1,[r4,0x250]
ldrb r1,[r4,0xd]
strb r1,[r4,0xf]
strb r0,[r4,0xd]
ldmfd r13!,{r4,r15}
.pool
;arm_func_end func_ov039_02300374

_func_ov039_023003b0:
ldr r15,=0x21c3774	;0x21c3834
.pool
;arm_func_end func_ov039_023003b0


.org 0x2301318
_0x23003bc:
.db 0x00,0x01,0x05,0x00
.dw _0x23003fc
_0x23003c4:
.db 0x1f,0x04,0x0b,0x1f
_0x23003c8:
.db 0x1f,0x0f,0x1f,0x18
_0x23003cc:
.db 0x1f,0x0f,0x0f,0x00
_0x23003d0:
.db 0x1f,0x1f,0x1f,0x18
_0x23003d4:
.db 0x1f,0x1f,0x1f,0x00
.db 0x00,0x00,0x00,0x00

_0x23003e0:
.db 0x00,0x14,0x01,0x12,0x01,0x14,0x00,0x12
_0x23003e8:
.db 0xf8,0xff,0xf8,0xff,0x08,0x00,0x08,0x00
_0x23003f0:
.db 0x02,0x00,0xd8,0xff,0xff,0xff,0x08,0x00,0xf1,0xff,0xe1,0xff
_0x23003fc:
.dw 0x22c9690	;0x22c870c, overlay_0004
.dw 0x22c969c	;0x22c8718
.dw 0x22c96a8	;0x22c8724
.dw 0x22c96b4	;0x22c8730
.dw 0x22c96c0	;0x22c873c

_0x2300410:
.db 0x00,0x80,0x00,0x00,0x00,0x00,0xf0,0xff,0x00,0x00,0x00,0x00,0x00,0x00,0x08,0x00
.db 0x00,0x00,0x01,0x00,0x00,0x80,0x28,0x00,0x00,0x00,0xfd,0xff,0x00,0x00,0x10,0x00
.db 0x00,0x00,0x08,0x00,0x00,0x00,0x02,0x00,0x00,0x40,0x20,0x00,0x00,0x00,0xf8,0xff
.db 0x00,0x00,0xf0,0xff,0x00,0x00,0x04,0x00,0x00,0x00,0xfe,0xff,0x00,0x80,0x28,0x00
.db 0x00,0x00,0x10,0x00,0x00,0x00,0xfa,0xff,0x00,0x00,0x08,0x00,0x00,0x00,0x09,0x00

.endarea
