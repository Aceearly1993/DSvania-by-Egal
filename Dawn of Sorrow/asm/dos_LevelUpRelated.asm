.nds
.relativeinclude on
.erroronwarning on

; This contains the code for calculating player stats,
; base maximum HP/MP, and levels for Enemy Set and Boss Rush mode.
; Use this to edit growth rates and static values.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

MaximumLevel	equ	99
BaseMaximumHP	equ	120
BaseMaximumMP	equ	80
SetLevel_EnemySet	equ	35
SetLevel_BossRush	equ	50

.org 0x222E5E4
.dw BaseMaximumHP
.dw BaseMaximumMP

.org 0x21ACBC8
mov r0,SetLevel_EnemySet
.org 0x21A1D40
mov r0,SetLevel_BossRush

.org 0x21ffb08
func_ov000_021ffb08:
PlayerCalculateLevelUpStats:
stmfd r13!,{r4-r11,r14}
mov r10,r0
ldrsh r1,[r10,0x0]
cmp r1,MaximumLevel
movge r0,0x0
ldmgefd r13!,{r4-r11,r15}
mov r11,0x0
ldr r0,=0x208ac20
ldr r2,[r0,0x0]
ldr r0,=0x36b7c
add r4,r2,r0
add r0,r1,0x1
bl 0x21ffc8c
ldr r1,[r10,0x3c]
cmp r0,r1
bhi _021ffc34
add r7,r4,0x4	;str
add r6,r4,0x6	;con
add r5,r4,0x8	;int
add r4,r4,0xa	;luk
add r9,r10,0x6	;hp
add r8,r10,0xa	;mp
_021ffb6c:
ldrsh r0,[r9,0x0]
add r0,r0,0x8	;max HP growth
strh r0,[r9,0x0]
ldrsh r0,[r8,0x0]
add r0,r0,0x6	;max MP growth
strh r0,[r8,0x0]
ldrsh r0,[r10,0x0]
cmp r0,0x32
bge _021ffba8
ldrsh r0,[r9,0x0]
add r0,r0,0x4	;max HP growth p2
strh r0,[r9,0x0]
ldrsh r0,[r8,0x0]
add r0,r0,0x2	;max MP growth p2
strh r0,[r8,0x0]
_021ffba8:
ldrsh r1,[r10,0x0]
cmp r1,0x32
ble _021ffbbc
ands r0,r1,0x1
beq _021ffc04
_021ffbbc:
ands r0,r1,0xf
ldrnesh r0,[r7,0x0]	;str growth
addne r0,r0,0x1
strneh r0,[r7,0x0]
ldrsh r0,[r10,0x0]
ands r0,r0,0x7
beq _021ffbf0
ldrsh r0,[r6,0x0]	;con growth
add r0,r0,0x1
strh r0,[r6,0x0]
ldrsh r0,[r5,0x0]	;int growth
add r0,r0,0x1
strh r0,[r5,0x0]
_021ffbf0:
ldrsh r0,[r10,0x0]
ands r0,r0,0x1
ldrnesh r0,[r4,0x0]	;luk growth
addne r0,r0,0x1
strneh r0,[r4,0x0]
_021ffc04:
add r11,r11,0x1
ldrsh r0,[r10,0x0]
add r0,r0,0x1
strh r0,[r10,0x0]
cmp r0,MaximumLevel
bge _021ffc34
add r0,r0,0x1
bl 0x21ffc8c
ldr r1,[r10,0x3c]
cmp r0,r1
bls _021ffb6c
_021ffc34:
cmp r11,0x0
beq _021ffc40
bl 0x21ffca4
_021ffc40:
mov r0,r11
ldmfd r13!,{r4-r11,r15}
.pool
.endarea
;arm_func_end 0x21ffb08


;exp required for level routine
.org 0x21ffc8c
func_ov000_021ffc8c:
add r1,r0,0x1
mul r1,r0,r1
add r2,r0,0x2
add r2,r2,r0,lsl 0x1
mul r0,r2,r1
bx r14
;arm_func_end 0x21ffc8c


.org 0x21ffc58
func_ov000_021ffc58:
stmfd r13!,{r4,r14}
mov r4,r0
ldrsh r0,[r4,0x0]
cmp r0,MaximumLevel
movge r0,0x0
ldmgefd r13!,{r4,r15}
add r0,r0,0x1
bl 0x21ffc8c
ldr r1,[r4,0x3c]
sub r0,r0,r1
ldmfd r13!,{r4,r15}
.pool
.endarea
;arm_func_end 0x21ffc58


.close
