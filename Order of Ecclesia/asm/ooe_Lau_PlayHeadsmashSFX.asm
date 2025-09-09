.nds
.relativeinclude on
.erroronwarning on

; While the general routine for headsmashing exists, the code to
; play an SFX has been ommitted.  This adds the code to play
; an SFX when headsmashing.

; by EgalLau37


Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2600

HeadsmashSFXID	equ	0x11000307	;


.open "ftc/arm9.bin", 0x2000000

;headsmash routine
.org 0x20483f4
stmfd r13!,{r4,r14}
mov r4,r0
mov r0,0x0
ldr r1,[r4,0xe4]
tst r1,0x2
ldmeqfd r13!,{r4,r15}
ldr r1,[r4,0xd0]
tst r1,0x8000000
ldmeqfd r13!,{r4,r15}
ldr r1,[r4,0x34]
cmp r1,0x30000
ldmlefd r13!,{r4,r15}
bl PlayHeadsmashSFX
.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

PlayHeadsmashSFX:
stmfd r13!,{r14}
sub r13,r13,0x8
mov r0,0x0
str r0,[r13]
add r0,r4,0x30
ldmia r0,{r1-r3}
ldr r0,=HeadsmashSFXID
bl 0x20AA508
add r13,r13,0x8
ldmfd r13!,{r15}
.pool

.close
