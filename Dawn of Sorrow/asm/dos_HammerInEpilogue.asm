.nds
.relativeinclude on
.erroronwarning on

; This patch adds Hammer to the Julius mode epilogue.
; Intended to be used with a patch that adds Hammer
; as a playable character to Julius mode.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21d3858
.area 0xF0,0x69
stmfd r13!,{r0,r4,r5,r14}
mov r4,r0
mov r2,0x1
mov r3,0x1
mov r1,0x1a
bl 0x21d9cec
cmp r0,0x0
bne _021d3894
mov r0,r4
bl 0x2012ae0
ldmfd r13!,{r0,r4,r5,r15}
_021d3894:
mov r12,0x80
str r12,[r13,0x0]
mov r0,r4
mov r1,0x4
mov r2,0x0
mov r3,0xa0
bl 0x21d9668	;julius
;mov r12,0x80
;str r12,[r13,0x0]
mov r0,r4
mov r1,0x2
mov r2,0x0
mov r3,0xb8
bl 0x21d9668	;yoko
;mov r12,0x80
;str r12,[r13,0x0]
mov r0,r4
mov r1,0x1
mov r2,0x0
mov r3,0xd0
bl 0x21d9668	;arikado
;mov r12,0x80
;str r12,[r13,0x0]
mov r0,r4
mov r1,0x3
mov r2,0x0
mov r3,0xE8
bl 0x21d9668	;hammer
mvn r0,0xf
mov r1,0x0
mov r2,0x3c
bl 0x20080dc
mov r0,0x80000
str r0,[r4,0xD0]
mov r3,0xb0000
str r3,[r4,0xD4]
mov r0,0x0
strb r0,[r4,0xD0+0x4a]
ldr r1,=0x208ac20
ldr r1,[r1,0x0]
add r1,r1,0x36000
ldr r1,[r1,0xb70]
mov r2,0x200000
str r2,[r1,0x2c]
str r3,[r1,0x30]
ldmfd r13!,{r0,r4,r5,r15}
.pool
.endarea
;arm_func_end 0x21d3858


.close

