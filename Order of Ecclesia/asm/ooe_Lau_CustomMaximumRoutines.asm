.nds
.relativeinclude on
.erroronwarning on

; This rewrites the calculation routines for HP, MP, and hearts
; maximums to allow simpler customization on a per-character basis.
; With this, base stats, growth parameters, maximums, bonus/up
; maximums (from HP/MP/Heart Up items), and growth routines can
; be customized on a per-character basis rather than all characters
; all using the same routine.
; Relevant parameters are stored in a table near the bottom
; under the "BasesGrowths_HPMPHearts" label.
; As an example, my own character stats and growth routines are
; included to demonstrate roughly how it works.  Each character has
; 0x2C bytes of data with the last four bytes being the growth
; routines for HP, MP, and hearts; the input into r0 determines
; which growth routine should be used.  If a character does not
; have a growth routine specified, the default one is used instead.
; 00 = HP
; 01 = MP
; 02 = hearts
; The vanilla characters have been given parameters that have
; been approximated from the base game; however, the vanilla
; routines have not been changed to read this data.  Instead,
; custom routines should be written to reference it (the stat caps
; are referenced, however). 
; An example routine is included further down.
; The vanilla routine is more complex in its calculation compared
; to the example routine, so if unsure, I recommend just using
; the example routine, as the calculation is straightfoward.
; An empty slot has been left for a fourth custom parameter in
; case anyone has another custom stat, but it otherwise is unused
; in the base game and has no effect.

; This should NOT be used alongside:
; ooe_Lau_MaximumHeartsRelated.asm
; ooe_Lau_MaximumMPRelated.asm
; ooe_Lau_MaximumHPRelated.asm

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2A00


.open "ftc/arm9.bin", 0x2000000

.org 0x2063DA0	;HP up?
bl 0x204fe08
bl CalculateMaximumHP	;0x204FE30

.org 0x2063de8	;MP up?
bl 0x204fe98
bl CalculateMaximumMP

.org 0x204FD34
bl CalculateMaximumHP
bl CalculateMaximumMP
bl CalculateMaximumHearts

.org 0x204FD88
bl CalculateMaximumHP
bl CalculateMaximumMP
bl CalculateMaximumHearts



;calculates maximum HP upon maximum HP change
.org 0x204fe30
.fill 0x64,0x69
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
strh r0,[r4,0x6]
ldr r1,=0x20ffc58
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

;HP up maximum HP bonus
.org 0x204fe08
stmfd r13!,{r3,r4,r14}
ldr r1,=0x2100758
ldrh r2,[r1,0x44]
add r0,r2,r0
bl RetrieveMaximumHPBonus
cmp r0,r2
movge r0,r2
str r0,[r1,0x44]
ldmfd r13!,{r3,r4,r14}
.pool


;MP maximum calculation
.org 0x204fec0
stmfd r13!,{r4,r14}
ldr r4,=0x21002b0
ldrsh r0,[r4,0x0]
bl 0x2023794
mov r1,r0
ldr r0,=0x40a00000
bl 0x20237dc
mov r1,r0
ldr r0,=0x42960000
bl 0x2022ce4
bl 0x2023760
ldr r1,=0x20ffc58
strh r0,[r4,0xa]
ldrb r0,[r1,0xb38]
cmp r0,0x4
ldmeqfd r13!,{r4,r15}
ldr r0,=0x2100758
ldrsh r1,[r4,0xa]
ldrh r0,[r0,0x46]
add r0,r1,r0
strh r0,[r4,0xa]
ldmfd r13!,{r4,r15}
.pool

;MP up maximum MP bonus
.org 0x204fe98
stmfd r13!,{r3,r4,r14}
ldr r1,=0x2100758
ldrh r2,[r1,0x46]
add r0,r2,r0
bl RetrieveMaximumMPBonus
cmp r0,r2
movge r0,r2
strh r0,[r1,0x46]
ldmfd r13!,{r3,r4,r14}
.pool


;calculates max hearts
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
bl RetrieveMaximumHeartsBonus
cmp r0,r2
movge r0,r2
strgeh r0,[r1,0x48]
ldmfd r13!,{r3,r4,r14}
.pool


.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

BasesGrowths_HPMPHearts:
;character 0x0 - shanoa
.dh 128
.dh 80
.dh 50
.dh 0
.dh 9999
.dh 9999
.dh 999
.dh 0
.dh 600
.dh 300
.dh 300
.dh 0
.dw 8
.dw 5
.dw 0
.dw 0
.dw 0	;growth routine, 0 = default routines

;arma felix
.dh 128		;0x00
.dh 80		;0x02
.dh 50		;0x04
.dh 0		;0x06
.dh 9999	;0x08
.dh 9999	;0x0a
.dh 999		;0x0c
.dh 0		;0x0e
.dh 600		;0x10
.dh 300		;0x12
.dh 300		;0x14
.dh 0		;0x16
.dw 8		;0x18
.dw 5		;0x1c
.dw 0		;0x20
.dw 0		;0x24
.dw 0		;0x28

;arma chiroptera
.dh 128
.dh 80
.dh 50
.dh 0
.dh 9999
.dh 9999
.dh 999
.dh 0
.dh 600
.dh 300
.dh 300
.dh 0
.dw 8
.dw 5
.dw 0
.dw 0
.dw 0

;arma machina
.dh 128
.dh 80
.dh 50
.dh 0
.dh 9999
.dh 9999
.dh 999
.dh 0
.dh 600
.dh 300
.dh 300
.dh 0
.dw 8
.dw 5
.dw 0
.dw 0
.dw 0

;character 0x4 - albus
.dh 128
.dh 80
.dh 50
.dh 0
.dh 9999
.dh 9999
.dh 999
.dh 0
.dh 600
.dh 300
.dh 300
.dh 0
.dw 10
.dw 4
.dw 2
.dw 0
.dw 0


;character 0x5 - EgalLau37
;(example parameters)
.dh 115		;base HP
.dh 90		;base MP
.dh 35		;base hearts
.dh 0		;base unused
.dh 9999	;max HP
.dh 9999	;max MP
.dh 999		;max hearts
.dh 0		;max unused
.dh 777		;max HP bonus
.dh 333		;max MP bonus
.dh 333		;max heart bonus
.dh 0		;max unused bonus
.dw 9		;HP growth stat
.dw 5		;MP growth stat
.dw 1		;heart growth stat
.dw 0		;other growth stat
.dw HPMPHeartsGrowthRates_Lau



CalculateMaximumHP:
stmfd r13!,{r0-r4,r14}
ldr r0,=BasesGrowths_HPMPHearts
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
mov r2,0x2C
mla r0,r1,r2,r0
ldr r1,[r0,0x28]
cmp r1,0x2000000
ldrlt r1,=GenericHPMPHeartsRoutine
mov r0,0x0
blx r1
ldr r0,=BasesGrowths_HPMPHearts
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
mov r2,0x2C
mla r0,r1,r2,r0
ldrh r0,[r0,0x8]
ldr r2,=0x21002b0
ldrh r1,[r2,0x6]
cmp r0,r1
movge r0,r1
strh r0,[r2,0x6]
ldmfd r13!,{r0-r4,r15}
.pool

CalculateMaximumMP:
stmfd r13!,{r0-r4,r14}
ldr r0,=BasesGrowths_HPMPHearts
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
mov r2,0x2C
mla r0,r1,r2,r0
ldr r1,[r0,0x28]
cmp r1,0x2000000
ldrlt r1,=GenericHPMPHeartsRoutine
mov r0,0x1
blx r1
ldr r0,=BasesGrowths_HPMPHearts
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
mov r2,0x2C
mla r0,r1,r2,r0
ldrh r0,[r0,0xA]
ldr r2,=0x21002b0
ldrh r1,[r2,0xA]
cmp r0,r1
movge r0,r1
strh r0,[r2,0xA]
ldmfd r13!,{r0-r4,r15}
.pool

CalculateMaximumHearts:
stmfd r13!,{r0-r4,r14}
ldr r0,=BasesGrowths_HPMPHearts
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
mov r2,0x2C
mla r0,r1,r2,r0
ldr r1,[r0,0x28]
cmp r1,0x2000000
ldrlt r1,=GenericHPMPHeartsRoutine
mov r0,0x2
blx r1
ldr r0,=BasesGrowths_HPMPHearts
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
mov r2,0x2C
mla r0,r1,r2,r0
ldrh r0,[r0,0xC]
ldr r2,=0x21002b0
ldrh r1,[r2,0xE]
cmp r0,r1
movge r0,r1
strh r0,[r2,0xE]
ldmfd r13!,{r0-r4,r15}
.pool



; This is the generic routine used by the vanilla characters.
; This is a routine that branches to the vanilla routines to
; calculate HP, MP, or hearts, whichever calculations are needed.
; The growth routines are located and labeled above and are somewhat
; complex, at least in my opinion.
GenericHPMPHeartsRoutine:
stmfd r13!,{r14}
ldr r1,=HPMPHeartsTable
ldr r1,[r1,r0,lsl 0x2]
blx r1
ldmfd r13!,{r15}
.pool
HPMPHeartsTable:
.dw 0x204fe30	;vanilla max HP routine
.dw 0x204fec0	;vanilla max MP routine
.dw 0x204ff54	;vanilla max hearts routine


; For my own stats, I use a simple formula of:
; (level*growth parameter) + base stat
; So I have:
; 1015 HP | 590 MP | 135 hearts
; at level 100.
; Feel free to use this routine.
; This routine handles the growths for HP, MP, and hearts.
; The input in r0 determines which maxmimum stat to calculate.
; If given to the vanilla characters, it should resemble vanilla
; growths... somewhat.
HPMPHeartsGrowthRates_Lau:
stmfd r13!,{r2-r6,r14}
ldr r1,=HPMPHeartsTable_Lau
ldr r15,[r1,r0,lsl 0x2]
HPRoutine_Lau:
ldr r0,=0x21002b0
ldrsh r0,[r0]
ldr r1,=BasesGrowths_HPMPHearts
ldr r2,=0x2100790
ldrb r2,[r2,0x2]
mov r3,0x2C
mla r1,r2,r3,r1
ldr r2,[r1,0x18]
ldrh r1,[r1]
mla r1,r0,r2,r1
ldr r2,=0x21002b0
strh r1,[r2,0x6]
ldr r3,=0x20ffc58
ldrb r3,[r3,0xb38]
cmp r3,0x4
ldmeqfd r13!,{r2-r6,r15}
ldr r3,=0x2100758
ldrh r4,[r3,0x44]
add r1,r1,r4
strh r1,[r2,0x6]
ldmfd r13!,{r2-r6,r15}

MPRoutine_Lau:
ldr r0,=0x21002b0
ldrsh r0,[r0]
ldr r1,=BasesGrowths_HPMPHearts
ldr r2,=0x2100790
ldrb r2,[r2,0x2]
mov r3,0x2C
mla r1,r2,r3,r1
ldr r2,[r1,0x1C]
ldrh r1,[r1,0x2]
mla r1,r0,r2,r1
ldr r2,=0x21002b0
strh r1,[r2,0xA]
ldr r3,=0x20ffc58
ldrb r3,[r3,0xb38]
cmp r3,0x4
ldmeqfd r13!,{r2-r6,r15}
ldr r3,=0x2100758
ldrh r4,[r3,0x46]
add r1,r1,r4
strh r1,[r2,0xA]
ldmfd r13!,{r2-r6,r15}

HeartsRoutine_Lau:
ldr r0,=0x21002b0
ldrsh r0,[r0]
ldr r1,=BasesGrowths_HPMPHearts
ldr r2,=0x2100790
ldrb r2,[r2,0x2]
mov r3,0x2C
mla r1,r2,r3,r1
ldr r2,[r1,0x20]
ldrh r1,[r1,0x4]
mla r1,r0,r2,r1
ldr r2,=0x21002b0
strh r1,[r2,0xE]
ldr r3,=0x20ffc58
ldrb r3,[r3,0xb38]
cmp r3,0x4
ldmeqfd r13!,{r2-r6,r15}
ldr r3,=0x2100758
ldrh r4,[r3,0x48]
add r1,r1,r4
strh r1,[r2,0xE]
ldmfd r13!,{r2-r6,r15}
.pool
HPMPHeartsTable_Lau:
.dw HPRoutine_Lau
.dw MPRoutine_Lau
.dw HeartsRoutine_Lau



RetrieveMaximumHPBonus:
ldr r3,=0x2100790
ldrb r3,[r3,0x2]
ldr r1,=BasesGrowths_HPMPHearts
mov r2,0x2C
mla r1,r3,r2,r1
ldrh r2,[r1,0x10]
bx r14

RetrieveMaximumMPBonus:
ldr r3,=0x2100790
ldrb r3,[r3,0x2]
ldr r1,=BasesGrowths_HPMPHearts
mov r2,0x2C
mla r1,r3,r2,r1
ldrh r2,[r1,0x12]
bx r14

RetrieveMaximumHeartsBonus:
ldr r3,=0x2100790
ldrb r3,[r3,0x2]
ldr r1,=BasesGrowths_HPMPHearts
mov r2,0x2C
mla r1,r3,r2,r1
ldrh r2,[r1,0x14]
bx r14
.pool



.close