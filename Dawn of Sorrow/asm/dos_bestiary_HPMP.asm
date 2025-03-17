.nds
.relativeinclude on
.erroronwarning on

; adds displays for HP and MP values for enemies in the bestiary and on
; the top screen
; by EgalLau37


Overlay41Start equ 0x02308920
FreeSpace equ Overlay41Start + 0x1300

.open "ftc/arm9.bin", 0x2000000

.org 0x203AE50
bl DisplayHPMP
ldr r0,=0x208AC20
ldr r0,[r0]
ldrb r0,[r0,0x10]
cmp r0,0x0
addeq r13,r13,0x10
ldmeqfd r13!,{r4-r6,r15}
mov r0,0x0
mov r1,0x8
bl 0x203B16C
add r13,r13,0x10
ldmfd r13!,{r4-r6,r15}
mov r3,r3
.org 0x203AE94
.pool

.org 0x203ACD4
bl DisplayHPMP_numbers
mov r0,r6
add r13,r13,0x18
ldmfd r13!,{r4-r8,r15}


.org 0x203AD54
mov r1,0x8
.org 0x203AD84
mov r2,0x8
.org 0x203ADBC
mov r0,0x9


.org 0x203AAB8
mov r3,0xD
.org 0x203AAEC
mov r0,0xD
.org 0x203AB1C
mov r0,0xD
.org 0x203AB8C
mov r2,0xD
.org 0x203ABC0
mov r0,0xD
.org 0x203ABF0
mov r0,0xD
.org 0x203ACA4
mov r0,0xD
.org 0x203AC6C
mov r1,0xD

.close


.open "ftc/overlay9_41", Overlay41Start

.org Overlay41Start+0x1300

DisplayHPMP:
stmfd r13!,{r14}
sub r13,r13,0x10
mov r0,0x17
str r0,[r13]
sub r0,r5,0x2
str r0,[r13,0x4]
ldr r0,=0x3FA
str r0,[r13,0x8]
mov r0,0x4
mov r1,0x18
mov r2,0x5
mov r3,0x0
str r6,[r13,0xC]
bl 0x20397C8
mov r0,0x17
str r0,[r13]
sub r0,r5,0x1
str r0,[r13,0x4]
ldr r0,=0x3FB
str r0,[r13,0x8]
mov r0,0x4
mov r1,0x19
mov r2,0x5
mov r3,0x0
str r6,[r13,0xC]
bl 0x20397C8
add r13,r13,0x10
ldmfd r13!,{r15}
.pool

DisplayHPMP_numbers:
stmfd r13!,{r14
sub r13,r13,0x14
mov r0,0x0
str r0,[r13,0xC]
str r7,[r13,0x10]
mov r0,0x16
str r0,[r13]
sub r0,r4,0x2
str r0,[r13,0x4]
ldrh r0,[r6,0xE]
str r0,[r13,0x8]
mov r0,0x10
mov r1,0x1A	;"graphic ID"?
mov r2,0x8	;x offset
mov r3,0x1	;y offset
bl 0x2009D8C
mov r0,0x0
str r0,[r13,0xC]
str r7,[r13,0x10]
mov r0,0x16
str r0,[r13]
sub r0,r4,0x1
str r0,[r13,0x4]
ldrh r0,[r6,0x10]
str r0,[r13,0x8]
mov r0,0x10
mov r1,0x1B
mov r2,0x8
mov r3,0x1
bl 0x2009D8C
add r13,r13,0x14
ldmfd r13!,{r15}
.pool

ldr r0,[r6,0xE]
mov r1,0x1B
mov r2,0x1
str r1,[r13]
sub r1,r4,1
str r1,[r13,0x4]
str r0,[r13,0x8]
mov r0,0x0
str r0,[r13,0xC]
str r0,[r13,0x10]
mov r3,r2
mov r0,0xC
mov r1,0x20
bl 0x2009D8C
add r13,r13,0x14
ldmfd r13!,{r15}

.close


