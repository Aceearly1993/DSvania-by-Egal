.nds
.relativeinclude on
.erroronwarning on

; by default, Behemoth can sometimes attack with its tongue in such
; a way that requires a frame perfect jump.
; this changes its AI to not attack with its tongue if it is too
; close to the edges of the arena.

; by EgalLau37

.open "ftc/overlay9_0053.bin" 0x22D7900
.org 0x22D7FB4
bl CheckBehemothTongue
.close


.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x2350	;ends ~???
CheckBehemothTongue:
cmp r0,0x1
bxne r14
ldrh r0,[r7,0x3C]
cmp r0,0x0
addeq r15,r14,0x10
ldrsh r0,[r7,0x3E]
cmp r0,0x0
blt BehemothLeftFaceCheck
ldrh r0,[r7,0x32]
cmp r0,0xE
addge r15,r14,0x10
mov r0,0x4
cmp r0,0x4
bx r14
BehemothLeftFaceCheck:
ldrh r0,[r7,0x32]
cmp r0,0x11
addle r15,r14,0x10
mov r0,0x4
cmp r0,0x4
bx r14
.pool