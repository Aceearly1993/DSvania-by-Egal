.nds
.relativeinclude on
.erroronwarning on

; This is a copy of the code used in EgalLau37's w/Hammer hack
; for the Enemy Set mode.
; This includes:
; -all enemies are available to place
; -boss enemies are located in category four
; -increased placement area for enemies in rooms
; -maximum enemies is now calculated strictly by quantity
; -souls do not need to be owned to be placed

; by EgalLau37


.open "ftc/arm9.bin", 0x2000000

;enemy set mode enemy set update
.org 0x204b5b8
.area 0x590,0x69
stmfd r13!,{r4-r8,r14}
sub r13,r13,0x8
mov r6,r0
bl 0x20499a4
ldr r0,=0x208ac20
ldr r0,[r0,0x0]
ldrb r0,[r0,0x9]
cmp r0,0x7
bne _0204b5e4
mov r0,r6
bl 0x2049910
_0204b5e4:
ldr r0,=0x208ac20
ldr r2,[r0,0x0]
ldrb r0,[r2,0x9]
cmp r0,0x7
bne _0204bb08
ldr r1,=0x9bc4
mov r0,r6
add r5,r6,0xd0
add r7,r2,r1
mov r4,0x0
bl 0x203fd10
cmp r0,0x0
beq _0204b6a4
mov r3,0x4
str r3,[r13,0x0]
mov r0,r6
mov r1,0x3
mov r2,0x3
bl 0x203f9e0
cmp r0,0x0
movge r4,0x20
bge _0204b6a4
mov r0,r6
mov r1,0x4
mov r2,0x4
mov r3,0x4
str r1,[r13,0x0]
bl 0x203f9e0
cmp r0,0x0
movge r4,0x10
bge _0204b6a4
mov r1,0x5
mov r3,0x4
mov r0,r6
mov r2,r1
str r3,[r13,0x0]
bl 0x203f9e0
cmp r0,0x0
movge r4,0x40
bge _0204b6a4
mov r1,0x6
mov r3,0x4
mov r0,r6
mov r2,r1
str r3,[r13,0x0]
bl 0x203f9e0
cmp r0,0x0
movge r4,0x80
_0204b6a4:
cmp r4,0x0
bne _0204b900
ldrb r0,[r7,0x1]
cmp r0,0x0
beq _0204b900
mov r3,0x0
str r3,[r13,0x0]
mov r0,r6
mov r1,0x28
mov r2,0x33
bl 0x203f9e0
cmp r0,0x0
blt _0204b834
mov r3,0x4
mov r0,r6
mov r1,0x14
mov r2,0x27
str r3,[r13,0x0]
bl 0x203f9e0
cmp r0,0x0
blt _0204b900
add r1,r6,0x200
ldrsh r1,[r1,0x94]
ldr r3,=0x66666667
sub r7,r0,0x14
smull r2,r0,r3,r1
mov r2,r7,asr 0x1
add r2,r7,r2,lsr 0x1e
mov r0,r0,asr 0x1
mov r3,r1,lsr 0x1f
ldr r7,=0x5
add r0,r3,r0
smull r0,r3,r7,r0
sub r0,r1,r0
mov r7,r2,asr 0x2
cmp r7,r0
sub r1,r1,r0
addlt r7,r7,0x5
mov r0,r6
add r7,r7,r1
mov r8,0x0
bl 0x204a73c
ldrb r7,[r0,r7]
cmp r7,0xff
beq _0204b768
cmp r7,0xfe
ldrne r1,=0x2078cac
movne r0,0x24
mlane r8,r7,r0,r1
_0204b768:
cmp r8,0x0
beq _0204b828
ldr r1,[r5,0xec]
;ldrb r1,[r8,0x1b]
;add r1,r1,r0
add r1,r1,0x1
cmp r1,0x8
bgt _0204b828
mov r0,r6
bl 0x204a254
ldr r1,[r6,0x38]
mov r0,r6
add r1,r1,0x80
str r1,[r6,0x38]
bl 0x204a84c
mov r0,r6
mov r1,r7
bl 0x2049f34
str r0,[r5,0xf0]
mvn r0,0x0
str r0,[r5,0xf4]
ldr r0,[r5,0xe0]
ldr r1,[r5,0xf0]
add r2,r0,0x3
mov r0,r6
bl 0x2049cb0
mov r0,0x42
bl 0x2029bf0
mov r0,r6
mov r1,0x0
bl 0x20497b4
mov r0,r6
mov r1,0x1
mov r2,0x0
bl 0x2049fa4
mov r0,r6
mov r1,0x0
bl 0x2049784
ldr r0,=0x208ac20
ldr r2,[r0,0x0]
ldrb r1,[r2,0x8]
cmp r1,0x17
beq _0204b900
mov r1,0x8
strb r1,[r2,0x9]
ldr r0,[r0,0x0]
mov r1,0x0
strb r1,[r0,0xa]
b _0204b900
_0204b828:
mov r0,0x45
bl 0x2029bf0
b _0204b900
_0204b834:
mov r3,0x0
str r3,[r13,0x0]
mov r0,r6
mov r1,0x34
mov r2,0x35
bl 0x203f9e0
cmp r0,0x0
blt _0204b878
add r2,r6,0x200
mov r3,0x1
strh r3,[r2,0x92]
mov r0,r6
ldr r1,=0x41d
bl 0x2049470
mov r0,0x42
bl 0x2029bf0
b _0204b900
_0204b878:
mov r3,0x0
str r3,[r13,0x0]
mov r0,r6
mov r1,0x36
mov r2,0x37
bl 0x203f9e0
cmp r0,0x0
blt _0204b8bc
add r2,r6,0x200
mov r3,0x2
strh r3,[r2,0x92]
mov r0,r6
ldr r1,=0x461
bl 0x2049470
mov r0,0x42
bl 0x2029bf0
b _0204b900
_0204b8bc:
mov r3,0x0
str r3,[r13,0x0]
mov r0,r6
mov r1,0x38
mov r2,0x39
bl 0x203f9e0
cmp r0,0x0
movlt r4,0x1
blt _0204b900
add r2,r6,0x200
mov r3,0x3
strh r3,[r2,0x92]
mov r0,r6
ldr r1,=0x462
bl 0x2049470
mov r0,0x42
bl 0x2029bf0
_0204b900:
ldr r0,=0x208ac20
ldr r0,[r0,0x0]
ldrb r1,[r0,0x9]
cmp r1,0x7
bne _0204bb08
cmp r4,0x1
beq _0204b934
cmp r4,0x0
bne _0204b970
add r1,r0,0x9000
ldr r1,[r1,0xbac]
tst r1,0x1
beq _0204b970
_0204b934:
mov r1,0x0
mov r0,0x44
strb r1,[r6,0xd]
bl 0x2029bf0
ldr r0,=0x208ac20
ldr r2,[r0,0x0]
ldrb r1,[r2,0x8]
cmp r1,0x17
beq _0204baf8
mov r1,0xa
strb r1,[r2,0x9]
ldr r0,[r0,0x0]
mov r1,0x0
strb r1,[r0,0xa]
b _0204baf8
_0204b970:
cmp r4,0x40
beq _0204b990
cmp r4,0x0
bne _0204b9e0
add r1,r0,0x9000
ldr r1,[r1,0xbb0]
tst r1,0x40
beq _0204b9e0
_0204b990:
ldrsh r0,[r6,0x92]
cmp r0,0x0
blt _0204b9d4
add r2,r6,0x200
ldrsh r1,[r2,0x94]
sub r1,r1,0x1
strh r1,[r2,0x94]
mov r0,r6
bl 0x204a5b0
mov r0,r6
bl 0x204a48c
mov r0,r6
bl 0x204a2b0
mov r0,0x43
bl 0x2029bf0
b _0204baf8
_0204b9d4:
mov r0,0x45
bl 0x2029bf0
b _0204baf8
_0204b9e0:
cmp r4,0x80
beq _0204ba00
cmp r4,0x0
bne _0204ba54
add r1,r0,0x9000
ldr r1,[r1,0xbb0]
tst r1,0x80
beq _0204ba54
_0204ba00:
ldrsh r0,[r6,0x94]
cmp r0,0x0
blt _0204ba48
add r2,r6,0x200
ldrsh r1,[r2,0x94]
add r1,r1,0x1
strh r1,[r2,0x94]
add r1,r1,0x4
mov r0,r6
bl 0x204a5b0
mov r0,r6
bl 0x204a48c
mov r0,r6
bl 0x204a2b0
mov r0,0x43
bl 0x2029bf0
b _0204baf8
_0204ba48:
mov r0,0x45
bl 0x2029bf0
b _0204baf8
_0204ba54:
cmp r4,0x10
beq _0204ba74
cmp r4,0x0
bne _0204baa8
add r1,r0,0x9000
ldr r1,[r1,0xbb0]
tst r1,0x10
beq _0204baa8
_0204ba74:
ldr r0,[r5,0xe0]
add r0,r0,0x1
cmp r0,0x2+1
movgt r0,0x0
str r0,[r5,0xe0]
mov r0,r6
bl 0x204a748
mov r0,r6
bl 0x204a84c
mov r0,0x43
bl 0x2029bf0
b _0204baf8
_0204baa8:
cmp r4,0x20
beq _0204bac8
cmp r4,0x0
bne _0204baf8
add r0,r0,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x20
beq _0204baf8
_0204bac8:
ldr r0,[r5,0xe0]
subs r0,r0,0x1
movlt r0,0x2+1
str r0,[r5,0xe0]
mov r0,r6
bl 0x204a748
mov r0,r6
bl 0x204a84c
mov r0,0x43
bl 0x2029bf0
_0204baf8:
mov r1,0x1
mov r0,r6
mov r2,r1
bl 0x2049fa4
_0204bb08:
mov r0,r6
mov r1,0x0
bl 0x2049b0c
bl 0x20126ac
mvn r0,0x0
add r13,r13,0x8
ldmfd r13!,{r4-r8,r15}
.pool
.endarea
;arm_func_end 0x204b5b8


;create enemy list for category
.org 0x204a748
.area 0x104,0x69
stmfd r13!,{r4-r10,r14}
mov r9,r0
bl 0x204a73c
mov r8,r0
ldr r6,[r9,0x1b0]
add r10,r9,0x200
mov r5,0x0
strh r5,[r10,0x90]
strh r5,[r10,0x94]
ldr r7,=0x2078cac
_0204a774:
cmp r6,0x3
blt EnemySetCategory_normal
cmp r5,0x65
blt _0204a7c8
b _0204a7ac
EnemySetCategory_normal:
ldrb r0,[r7,0x1b]	;enemy cost
cmp r0,0x0
beq _0204a7c8
ldrsb r0,[r7,0x1a]	;soul ID
cmp r0,0x0
blt _0204a7c8
bl 0x220fbc8	;checks category
cmp r6,r0
bne _0204a7c8
;ldrsb r0,[r7,0x1a]
;bl 0x221029c	;checks quantity owned
;cmp r0,0x0
;beq _0204a7c8
_0204a7ac:
ldrsh r1,[r10,0x90]
strb r5,[r8,r1]
mov r0,r9
bl 0x204a5b0
ldrsh r0,[r10,0x90]
add r0,r0,0x1
strh r0,[r10,0x90]
_0204a7c8:
add r7,r7,0x24
add r5,r5,0x1
cmp r5,0x76
blt _0204a774
ldrsh r5,[r10,0x90]
cmp r5,0x40
bge _0204a808
mov r4,0xff
_0204a7ec:
mov r0,r9
mov r1,r5
strb r4,[r8,r5]
bl 0x204a5b0
add r5,r5,0x1
cmp r5,0x40
blt _0204a7ec
_0204a808:
ldrsh r0,[r10,0x90]
cmp r0,0x0
bne _0204a838
mov r0,0x0
strh r0,[r10,0x94]
mov r3,0xfe
strb r3,[r8,r0]
mov r0,r9
ldrsh r1,[r10,0x94]
bl 0x204a5b0
_0204a838:
mov r0,r9
bl 0x204a48c
ldmfd r13!,{r4-r10,r15}
.pool
.endarea
;arm_func_end 0x204a748


;reads enemy data for transition into room
.org 0x204bcdc
.area 0x1B0,0x69
stmfd r13!,{r4-r10,r14}
sub r13,r13,0x20
mov r9,r0
ldr r10,=0x208ac20
ldr r10,[r10,0x0]
add r3,r10,0x36000
mov r2,0x0
strb r2,[r3,0x615]
strb r2,[r10,0x10]
mov r1,0x1
strb r1,[r10,0x11]
ldr r12,[r3,0x61c]
bic r12,r12,0x8
bic r12,r12,0x100000
str r12,[r3,0x61c]
ldr r5,=0x3fb76
strh r2,[r10,r5]
str r2,[r13,0x0]
add r8,r9,0xd0
ldr r12,[r8,0xe4]
mov r12,r12,lsl 0x3
str r12,[r13,0x4]
mov r12,0x30
str r12,[r13,0x8]
str r1,[r13,0xc]
str r2,[r13,0x10]
mov r12,0x8000
str r12,[r13,0x14]
str r2,[r13,0x18]
ldrsb r1,[r8,0x6b]
mov r3,0x90
bl 0x20423d0
mov r6,0x0
mov r7,0x0
ldr r4,=0x2078cac
mov r5,0x3
_0204bd94:
mov r0,r9
mov r1,r7
bl 0x204a4dc
cmp r0,0x0
bge _0204bdbc
mov r0,r9
mov r1,r7
mov r2,r5
bl 0x2049cb0
b _0204be0c
_0204bdbc:
mov r0,r9
mov r1,r7
bl 0x204a4dc
mov r1,0x24
mla r2,r0,r1,r4
ldrb r1,[r2,0x1b]
add r6,r6,0x1	;r1
;ldrsb r0,[r2,0x1a]
;cmp r0,0x0
;blt _0204bdfc
bl 0x220fbc8
mov r2,r0
add r2,r2,0x3
mov r0,r9
mov r1,r7
bl 0x2049cb0
b _0204be0c
_0204bdfc:
mov r0,r9
mov r1,r7
mov r2,r5
bl 0x2049cb0
_0204be0c:
add r7,r7,0x1
cmp r7,0x8
blt _0204bd94
mov r0,r9
mov r1,0x1
bl 0x2049350
mov r0,r9
mov r1,r6
bl 0x204a254
ldr r0,[r8,0xe4]
add r0,r0,0x1
bl 0x203c3ec
mvn r0,0xf
mov r1,0x0
mov r2,0x1
bl 0x2041300
ldrb r1,[r10,0x8]
cmp r1,0x17
movne r1,0x6
strneb r1,[r10,0x9]
movne r1,0x0
strneb r1,[r10,0xa]
mvn r0,0x0
add r13,r13,0x20
ldmfd r13!,{r4-r10,r15}
.pool
.endarea
;arm_func_end 0x204bcdc



;handles touch screen enemy placement
.org 0x204b05c
.area 0x55C,0x69
stmfd r13!,{r4-r11,r14}
sub r13,r13,0x64
add r10,r0,0xd0
ldr r1,=0x208ac20
ldr r7,[r1,0x0]
ldr r2,=0x368b4
add r5,r7,0x36800
add r6,r7,r2
ldrsh r2,[r5,0xb4]
ldr r5,=0x36a7c
ldrsh r4,[r6,0x2]
str r2,[r13,0x28]
ldrsh r2,[r6,0x6]
ldrsh r6,[r6,0x4]
ldr r1,=0x36b1c
add r8,r4,r2
ldr r2,[r13,0x28]
add r8,r8,0xc0	;related to box at bottom of tall rooms?
add r2,r2,r6
add r6,r2,0x100
mov r2,r8,lsl 0x10
add r8,r4,0x30	;y offset from top of room
mov r8,r8,lsl 0x10
mov r8,r8,asr 0x10
str r8,[r13,0x1c]
mov r6,r6,lsl 0x10
mov r11,r2,asr 0x10
mov r2,r6,asr 0x10
str r2,[r13,0x30]
ldr r2,[r13,0x28]
ldr r3,[r10,0xe4]
add r6,r2,0x30	;x offset from left
ldr r2,[r13,0x30]
add r9,r7,r5
sub r5,r2,0x30	;x offset from right
add r2,r7,r1
add r1,r9,r3,lsl 0x5
ldr r8,=0x9bc4
ldr r9,[r10,0xf0]
add r7,r7,r8
add r8,r1,r9,lsl 0x2
mov r1,0x9
str r7,[r13,0x10]
mla r7,r3,r1,r2
add r2,r3,0x7
ldrb r3,[r7,r9]
add r1,r7,r9
str r1,[r13,0x14]
mov r6,r6,lsl 0x10
mov r5,r5,lsl 0x10
ldr r7,=0x2078cac
mov r1,0x24
sub r3,r3,0x1
mla r1,r3,r1,r7
str r1,[r13,0x18]
add r1,r10,0xe0
add r7,r1,r2,lsl 0x2
sub r1,r11,0x10
mov r1,r1,lsl 0x10
mov r1,r1,asr 0x10
str r1,[r13,0x20]
mov r1,0x0
str r1,[r13,0x24]
mov r1,0x1
str r0,[r13,0xc]
mov r6,r6,asr 0x10
mov r5,r5,asr 0x10
bl 0x2049b0c
ldr r0,[r10,0xf4]
str r0,[r13,0x2c]
cmp r0,0x0
blt _0204b250
ldr r0,[r13,0x10]
ldrb r0,[r0,0x0]
cmp r0,0x0
bne _0204b250
ldr r0,[r13,0x2c]
cmp r0,0x2
bne _0204b1d0
ldr r0,[r13,0x18]
ldr r2,[r10,0xec]
ldrb r1,[r0,0x1b]
sub r1,r2,0x1	;r1
ldr r0,[r13,0xc]
bl 0x204a254
ldr r0,[r13,0x14]
mov r1,0x0
strb r1,[r0,0x0]
mov r0,0x44
bl 0x2029bf0
mov r0,0x1
str r0,[r13,0x24]
b _0204b1e8
_0204b1d0:
cmp r0,0x1
bne _0204b1e8
mov r0,0x42
bl 0x2029bf0
mov r0,0x1
str r0,[r13,0x24]
_0204b1e8:
ldr r0,[r13,0x24]
cmp r0,0x0
beq _0204b34c
ldr r0,[r13,0xc]
mov r1,r9
mov r2,0x1
bl 0x2049cec
ldr r0,[r13,0xc]
mov r1,0x1
bl 0x20497b4
ldr r0,[r13,0xc]
mov r1,0x1
bl 0x2049784
mvn r0,0x0
str r0,[r10,0xf0]
mov r3,0x9
ldr r0,=0x208ac20
str r3,[r10,0xf8]
ldr r2,[r0,0x0]
ldrb r1,[r2,0x8]
cmp r1,0x17
strneb r3,[r2,0x9]
movne r1,0x0
strneb r1,[r2,0xa]
b _0204b34c
_0204b250:
ldr r0,[r13,0x10]
ldrsh r1,[r7,0x0]
ldrsh r2,[r0,0x4]
ldr r0,[r13,0xc]
add r1,r2,r1
strh r1,[r8,0x0]
ldr r1,[r13,0x10]
ldrsh r14,[r7,0x2]
ldrsh r12,[r1,0x6]
mov r1,0xd
mov r2,r1
add r12,r12,r14
strh r12,[r8,0x2]
mov r3,0x2
str r3,[r13,0x0]
bl 0x203f9e0
cmp r0,0x0
movge r0,0x2
strge r0,[r10,0xf4]
bge _0204b2ec
ldrsh r0,[r8,0x0]
cmp r0,r6
blt _0204b2e4
cmp r0,r5
bge _0204b2e4
ldrsh r1,[r8,0x2]
ldr r2,[r13,0x1c]	;max x?
cmp r1,r2
blt _0204b2e4
ldr r2,[r13,0x20]	;max y?
cmp r1,r2
bge _0204b2e4
bl 0x2006c78
cmp r0,0x0
moveq r0,0x1
streq r0,[r10,0xf4]
beq _0204b2ec
_0204b2e4:
mov r0,0x0
str r0,[r10,0xf4]
_0204b2ec:
ldr r1,[r10,0xf4]
ldr r0,[r13,0x2c]
cmp r1,r0
beq _0204b33c
cmp r1,0x2
moveq r0,0x5
beq _0204b314
cmp r1,0x0
movne r0,0x1
moveq r0,0x3
_0204b314:
mov r0,r0,lsl 0x10
mov r0,r0,lsr 0x10
mov r1,0x0
bl 0x200b13c
ldr r0,[r13,0xc]
mov r1,r9
bl 0x204a4dc
mov r0,0x1
mov r1,0x0
bl 0x200b13c
_0204b33c:
ldr r0,[r13,0xc]
mov r1,r9
mov r2,0x0
bl 0x2049cec
_0204b34c:
ldrsh r2,[r7,0x0]
mov r8,0x7000
mov r1,0x0
sub r0,r6,r2
strh r0,[r13,0x3a]
ldrsh r9,[r7,0x2]
ldr r0,[r13,0x28]
sub r3,r0,r2
sub r2,r11,r9
strh r2,[r13,0x3c]
sub r2,r4,r9
strh r2,[r13,0x36]
strh r8,[r13,0x3e]
strh r3,[r13,0x34]
strh r8,[r13,0x38]
mov r0,0x15
str r1,[r13,0x0]
str r0,[r13,0x4]
mov r0,0x10
str r0,[r13,0x8]
ldrh r1,[r13,0x34]
ldrh r0,[r13,0x36]
sub r2,r13,0x8
strh r1,[r2,0x0]
strh r0,[r2,0x2]
ldrh r0,[r13,0x38]
strh r0,[r2,0x4]
ldrh r8,[r13,0x3a]
ldrh r3,[r13,0x3c]
ldmia r2,{r0,r1}
strh r8,[r2,0x0]
strh r3,[r2,0x2]
ldrh r3,[r13,0x3e]
strh r3,[r2,0x4]
ldmia r2,{r2,r3}
bl 0x2008148
ldrsh r1,[r7,0x0]
ldr r0,[r13,0x30]
mov r8,0x7000
sub r0,r0,r1
strh r0,[r13,0x46]
ldrsh r9,[r7,0x2]
sub r3,r5,r1
mov r2,0x0
strh r3,[r13,0x40]
sub r3,r11,r9
strh r3,[r13,0x48]
sub r3,r4,r9
strh r8,[r13,0x4a]
strh r8,[r13,0x44]
strh r3,[r13,0x42]
str r2,[r13,0x0]
mov r1,0x15
mov r0,0x10
str r1,[r13,0x4]
str r0,[r13,0x8]
ldrh r1,[r13,0x40]
ldrh r0,[r13,0x42]
sub r2,r13,0x8
strh r1,[r2,0x0]
strh r0,[r2,0x2]
ldrh r0,[r13,0x44]
strh r0,[r2,0x4]
ldrh r8,[r13,0x46]
ldrh r3,[r13,0x48]
ldmia r2,{r0,r1}
strh r8,[r2,0x0]
strh r3,[r2,0x2]
ldrh r3,[r13,0x4a]
strh r3,[r2,0x4]
ldmia r2,{r2,r3}
bl 0x2008148
ldrsh r1,[r7,0x0]
mov r8,0x7000
mov r3,0x0
sub r0,r5,r1
strh r0,[r13,0x52]
ldrsh r10,[r7,0x2]
sub r0,r6,r1
mov r2,0x15
strh r0,[r13,0x4c]
ldr r0,[r13,0x1c]
strh r8,[r13,0x56]
sub r9,r0,r10
sub r0,r4,r10
strh r9,[r13,0x54]
strh r0,[r13,0x4e]
strh r8,[r13,0x50]
str r3,[r13,0x0]
mov r1,0x10
str r2,[r13,0x4]
str r1,[r13,0x8]
ldrh r1,[r13,0x4c]
ldrh r0,[r13,0x4e]
sub r4,r13,0x8
strh r1,[r4,0x0]
strh r0,[r4,0x2]
ldrh r0,[r13,0x50]
strh r0,[r4,0x4]
ldrh r3,[r13,0x52]
ldrh r2,[r13,0x54]
ldmia r4,{r0,r1}
strh r3,[r4,0x0]
strh r2,[r4,0x2]
ldrh r2,[r13,0x56]
strh r2,[r4,0x4]
ldmia r4,{r2,r3}
bl 0x2008148
ldrsh r0,[r7,0x0]
mov r4,r8
mov r3,0x0
sub r1,r5,r0
strh r1,[r13,0x5e]
sub r0,r6,r0
ldrsh r6,[r7,0x2]
mov r2,0x15
mov r1,0x10
strh r0,[r13,0x58]
ldr r0,[r13,0x20]
sub r5,r11,r6
sub r0,r0,r6
strh r5,[r13,0x60]
strh r0,[r13,0x5a]
strh r4,[r13,0x62]
strh r4,[r13,0x5c]
str r3,[r13,0x0]
str r2,[r13,0x4]
str r1,[r13,0x8]
ldrh r1,[r13,0x58]
ldrh r0,[r13,0x5a]
sub r4,r13,0x8
strh r1,[r4,0x0]
strh r0,[r4,0x2]
ldrh r0,[r13,0x5c]
strh r0,[r4,0x4]
ldrh r3,[r13,0x5e]
ldrh r2,[r13,0x60]
ldmia r4,{r0,r1}
strh r3,[r4,0x0]
strh r2,[r4,0x2]
ldrh r2,[r13,0x62]
strh r2,[r4,0x4]
ldmia r4,{r2,r3}
bl 0x2008148
bl 0x20126ac
mvn r0,0x0
add r13,r13,0x64
ldmfd r13!,{r4-r11,r15}
.pool
.endarea
;arm_func_end 0x204b05c


.close

