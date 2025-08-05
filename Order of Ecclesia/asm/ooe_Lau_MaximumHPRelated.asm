.nds
.relativeinclude on
.erroronwarning on

; These are routines that relate to calculating maximum HP.
; These can be edited to be custom formulas.
; Maximum HP from HP ups is also here.

; This should not be used alongside:
; ooe_Lau_CustomMaximumRoutines.asm

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x28C0
MaximumHPFromHPUp	equ	600


.open "ftc/arm9.bin", 0x2000000

;calculates maximum HP upon maximum HP change
.org 0x204fe30
stmfd r13!,{r4,r14}
ldr r4,=0x21002b0
ldrsh r0,[r4]	;retrieves current level
bl 0x2023794
mov r1,r0
mov r0,0x41000000
bl 0x20237dc
mov r1,r0
ldr r0,=0x42f00000
bl 0x2022ce4
bl 0x2023760
ldr r1,=0x20ffc58
strh r0,[r4,0x6]
ldrb r0,[r1,0xb38]
cmp r0,0x4	;mode ID to not add HP from HP ups, 0x4 = boss rush
ldmeqfd r13!,{r4,r15}
ldr r0,=0x2100758
ldrsh r1,[r4,0x6]
ldrh r0,[r0,0x44]
add r0,r1,r0
strh r0,[r4,0x6]
ldmfd r13!,{r4,r15}
.pool

.org 0x204fe08
ldr r1,=0x2100758
ldrh r2,[r1,0x44]
add r0,r2,r0
strh r0,[r1,0x44]
cmp r0,MaximumHPFromHPUp	;maximum HP from HP up
movhi r0,MaximumHPFromHPUp
strhih r0,[r1,0x44]
bx r14
mov r3,r3
.pool

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace


.close