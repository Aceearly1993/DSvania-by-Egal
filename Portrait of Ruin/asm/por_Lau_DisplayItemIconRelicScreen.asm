.nds
.relativeinclude on
.erroronwarning on

; There are seemingly unused item icons for relics that are never
; used, and by default, skills do not have any data for which 
; icon they should use.
; This adds a routine that draws an item icon for relics
; while on the relic screen.
; Short 0xA (damage multiplier) has been designated as the
; default offset into skill data for where the icon data is located.
; This can be changed below.
; Icon data follows the exact same structure as other items.
; As an additional note, short 0x8 (mana cost), or the short
; immediately preceding the offset for icon data, must contain
; a unique value between the different relics.  Using the
; global ID of the relic will work.

; by EgalLau37

Overlay119Start	equ	0x2308EC0

ItemTableAddress_Skill	equ	0x20E3CFC	;address for item table
ItemTableEntrySize_Skill	equ	0x18	;size per entry
ItemTableSkillIconOffset	equ	0xA-2	
;starting offset into skill data entry to read icon from
StartingSkillID_Relic	equ	0x5C

.open "ftc/arm9.bin", 0x2000000
; optimized version of the decompiled routine for relic
; screen item description display.
.org 0x2038824
.area 0x1F8,0x69
stmfd r13!,{r4-r11,r14}
cmp r0,0x0
ldmeqfd r13!,{r4-r11,r15}	;vanilla routine checked for missing address but continued anyway which would lead to a game crash; it has been changed to simply end the routine early instead
ldrne r10,[r0,0x158]
sub r13,r13,0x2c
add r10,r10,0x200
mov r5,0x0
mov r9,0x0
mov r0,0x3
str r0,[r13,0x1c]
mov r0,0x58
str r0,[r13,0x20]
mov r0,0x8
str r0,[r13,0x24]
str r5,[r13,0x18]
mov r7,0xb
mov r4,0xc
mov r11,0x1
mvn r6,0x0
_0203886c:
ldrsh r0,[r10,0xf2]
add r1,r9,r0
cmp r1,0x10
blt _020388b0
mov r2,r7
ldr r0,[r13,0x18]
str r0,[r13,0x0]
str r0,[r13,0x4]
add r1,r9,0x3
mov r3,r11
bl 0x2008cf0
add r0,r10,r9,lsl 0x1
strh r6,[r0,0xa4]
b _0203895c
_020388b0:
mov r0,r7
bl 0x21e4288
mov r8,r0
ldrsh r1,[r10,0xf2]
ldr r0,[r13,0x1c]
add r1,r9,r1
bl 0x2215664
bl 0x2215bbc
cmp r0,0x0
add r0,r10,r9,lsl 0x1
ldrsh r1,[r0,0xa4]
ldreq r8,=0x514
cmp r8,r1
beq _0203895c
strh r8,[r0,0xa4]
mov r0,r8,lsl 0x10
mov r1,r9,lsr 0x1f
mov r2,r0,lsr 0x10
rsb r0,r1,r9,lsl 0x1f
add r1,r1,r0,ror 0x1f
mov r0,0xe
mul r0,r1,r0
add r0,r0,0x4
mov r0,r0,lsl 0x3
str r0,[r13,0x0]
add r0,r9,r9,lsr 0x1f
mov r0,r0,asr 0x1
mov r0,r0,lsl 0x1
add r0,r0,0x5
mov r0,r0,lsl 0x3
str r0,[r13,0x4]
str r5,[r13,0x8]
str r2,[r13,0xc]
add r1,r9,0x3
str r5,[r13,0x10]
ldr r2,[r13,0x20]
ldr r3,[r13,0x24]
mov r0,r5
mov r1,r1,lsl 0x3
str r4,[r13,0x14]
bl 0x200870c
_0203895c:
add r9,r9,0x1
cmp r9,0xc
blt _0203886c
ldrsh r1,[r10,0xe6]
mov r0,0x3
bl 0x2215664
bl 0x2215bbc
cmp r0,0x0
ldreq r2,=0x514
beq _020389a8
bl DrawIcon_Relic
ldrsh r1,[r10,0xe6]
mov r0,0xb
bl 0x21e41bc
mov r0,r0,lsl 0x10
mov r2,r0,asr 0x10
_020389a8:
ldrsh r1,[r10,0x92]
cmp r1,r2
beq _02038a0c
strh r2,[r10,0x92]
ldrsh r2,[r10,0x92]
mvn r0,0x0
cmp r2,r0
beq _02038a0c
mov r0,0x30	;text position
str r0,[r13,0x0]
mov r1,0x98
str r1,[r13,0x4]
mov r1,0x0
str r1,[r13,0x8]
mov r0,r2,lsl 0x10
mov r0,r0,lsr 0x10
str r0,[r13,0xc]
str r1,[r13,0x10]
mov r4,0xd
str r4,[r13,0x14]
mov r0,0x8
mov r2,0xe8
mov r3,0x18
bl 0x200870c
_02038a0c:
mov r0,0x1
add r13,r13,0x2c
ldmfd r13!,{r4-r11,r15}
.pool
.endarea

.close



.open "ftc/overlay9_119", Overlay119Start
.org 0x2308EC0+0x2200	;ends ~???

DrawIcon_Relic:
stmfd r13!,{r1-r4,r14}
ldrsh r1,[r10,0xE6]
add r1,r1,StartingSkillID_Relic
ldr r0,=ItemTableAddress_Skill
ldr r2,=ItemTableEntrySize_Skill
mla r0,r1,r2,r0
add r0,r0,ItemTableSkillIconOffset
add r1,r10,0x1F8
mov r2,0x0
bl 0x202C62C
add r0,r10,0x1F8
mov r1,0x2000
bl 0x202C37C	;scaling
add r0,r10,0x1F8
mov r1,0xC
mov r2,0x98
mov r3,0x0
bl 0x202C4C8
ldmfd r13!,{r1-r4,r15}
.pool

.close
