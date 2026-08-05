.nds
.relativeinclude on
.erroronwarning on

; This patch allows adding extra destinations to be warped to by
; the Abyss teleporter.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21af040
.area 0xC4,0x69
Object32Create:
stmfd r13!,{r4-r7,r14}
sub r13,r13,0x4
mov r4,r0
add r6,r4,0x200
ldr r1,=0x208ac20
ldr r1,[r1,0x0]
add r1,r1,0x36000
ldrb r0,[r1,0xa77]
ldrh r2,[r6,0x6e]
cmp r0,0x1
bne _021af078
cmp r2,0x2
moveq r2,0x3
streqh r2,[r6,0x6e]
_021af078:
ldr r3,=AbyssTeleporterTable	;0x222be04
add r5,r3,r2,lsl 0x3
ldrb r0,[r4,0x260]
mov r1,0x2
bl 0x21d6d70
mov r1,0x1
str r1,[r13,0x0]
ldr r1,=0x2115418
ldr r1,[r1,0x0]
ldr r2,=0x2217b54
ldr r3,=0x22c12b4
mov r0,r4
bl 0x201c1b8
cmp r0,0x0
addeq r13,r13,0x4
ldmeqfd r13!,{r4-r7,r15}
ldr r1,=0x21c52ec
ldr r0,=0x5680
str r1,[r4,0x4]
str r0,[r4,0x34]
ldrsh r0,[r5,0x2]
strh r0,[r4,0x74]
add r13,r13,0x4
ldmfd r13!,{r4-r7,r15}
.pool
.endarea
;arm_func_end 0x21af040


.org 0x21af104
.area 0x190,0x69
Object32Update:
stmfd r13!,{r4,r5,r14}
sub r13,r13,0xc
mov r5,r0
add r0,r5,0x200
ldrh r0,[r0,0x6e]
ldr r2,=AbyssTeleporterTable	;0x222be04
add r4,r2,r0,lsl 0x3
ldrb r1,[r5,0xd]
cmp r1,0x2
addls r15,r15,r1,lsl 0x2
b Object32Update_end
b _021af148
b _021af200
b _021af22c

_021af148:
ldr r0,=0x208ac20
ldr r0,[r0,0x0]
add r0,r0,0x9000
ldr r0,[r0,0xbbc]
ands r0,r0,0x40
beq Object32Update_end
bl 0x21f6588
cmp r0,0x0
beq Object32Update_end
mvn r0,0x3f
str r0,[r13,0x0]
mov r0,0x10
str r0,[r13,0x4]
mov r0,0x40
str r0,[r13,0x8]
add r0,r5,0x2c
mvn r3,0xf
ldmia r0,{r0,r1,r2}
bl 0x21c2fdc
cmp r0,0x0
beq Object32Update_end
mov r0,0x1
mov r1,0x0
bl 0x2012034
ldr r0,=0x208ac20
mov r1,0x0
ldr r2,[r0,0x0]
ldr r0,=0x3002
add r4,r2,0x36000
ldr r2,[r4,0x61c]
mov r3,r1
orr r12,r2,0x1
mov r2,0x1e
str r12,[r4,0x61c]
bl 0x204f3d4
mov r0,0x1
strb r0,[r5,0xd]
b Object32Update_end
_021af200:
mov r0,0x1
mov r1,0x0
bl 0x2012034
mov r1,0x10
mov r2,r1
mov r0,0x0
bl 0x20080dc
mov r0,0x1a8
bl 0x2029bf0
mov r0,0x2
strb r0,[r5,0xd]
_021af22c:
mov r0,0x1
mov r1,0x0
bl 0x2012034
bl 0x200806c
cmp r0,0x0
bne Object32Update_end
ldr r0,=0x208ac20
ldr r0,[r0,0x0]
add r0,r0,0x36000
ldr r1,[r0,0x61c]
bic r1,r1,0x1
str r1,[r0,0x61c]
ldrsb r0,[r4,0x0]
ldrsb r1,[r4,0x1]
ldrsh r2,[r4,0x4]
ldrsh r3,[r4,0x6]
bl 0x2026ad0
bl 0x2026a2c
Object32Update_end:
add r13,r13,0xc
ldmfd r13!,{r4,r5,r15}
.pool
.endarea
;arm_func_end 0x21af104

.close



Overlay41Start equ 0x2308920
.open "ftc/overlay9_41", Overlay41Start
.org Overlay41Start+0x550

AbyssTeleporterTable:
.db 0xB	;sector
.db 0x0	;room
.db 0x0	;???
.db 0x0	;???
.dh 0x80	;x-position
.dh 0xA0	;y-position

.db 0x5
.db 0x27
.db 0x1
.db 0x0
.dh 0x80
.dh 0xA0

.db 0xA
.db 0x0
.db 0x2
.db 0x0
.dh 0x80
.dh 0xA0

; 03 - Throne room
.db 0x10
.db 0x0
.db 0x2
.db 0x0
.dh 0x1A0
.dh 0xB0

; 04 - abyss center
.db 0xA
.db 0x0
.db 0x2
.db 0x0
.dh 0x80
.dh 0xA0


.close

