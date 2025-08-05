.nds
.relativeinclude on
.erroronwarning on

; These are routines that relate to calculating maximum hearts.
; These can be edited to be custom formulas.
; Maximum hearts from Heart ups is also here.

; This should NOT be used alongside:
; ooe_Lau_CustomMaximumRoutines.asm

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2900
MaximumHeartsFromHeartUp	equ	300


.open "ftc/arm9.bin", 0x2000000

;calculates maximum hearts
.org 0x204ff54
ldr r0,=0x2100758
ldr r2,=0x21002b0
ldrh r1,[r0,0x48]
ldr r0,=0x20ffc58
add r1,r1,0x32
strh r1,[r2,0xe]
ldrb r0,[r0,0xb38]
cmp r0,0x4
moveq r0,0x64
streqh r0,[r2,0xe]
bx r14
.pool

;Heart up maximum heart bonus
.org 0x204ff2c
stmfd r13!,{r3,r4,r14}
ldr r1,=0x2100758
ldrh r2,[r1,0x48]
add r0,r2,r0
cmp r0,MaximumHeartsFromHeartUp
movge r0,MaximumHeartsFromHeartUp
strgeh r0,[r1,0x48]
ldmfd r13!,{r3,r4,r14}
mov r3,r3
.pool

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace


.close