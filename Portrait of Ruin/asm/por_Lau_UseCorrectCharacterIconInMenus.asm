.nds
.relativeinclude on
.erroronwarning on

; In vanilla, the Use Item screen is hardcoded to the character
; icons for Jonathan and Charlotte, using 0xF3 and 0xF4.
; This patch changes it to instead use the character icons for the
; lead and back partners.  The same hardcoding also exists for
; the Guides screen, and this patch also changes that.

; In vanilla, character equipment is tied to lead/back
; characters rather than the actual character IDs.
; For example, Stella will be shown as being able to equip
; Jonathan's weapons and her sister, Charlotte's weapons.
; It is possible to change that using other patches.
; Ping @EgalLau37 for expanded character equip flags.

; by EgalLau37

PlayerDataTable	equ	0x221E7F4

Overlay119Start	equ	0x2308EC0


.open "ftc/arm9.bin", 0x2000000
; for use item screen
.org 0x203A58C
bl RetrieveCharacterIcon_lead
str r0,[r13,0x10]
bl RetrieveCharacterIcon_back
str r0,[r13,0xC]
mov r8,0x32	
mov r9,0x0
; the game is wonky and loads the back partner icon,
; does the above two mov rx, then stores the icon;
; this makes the code more organized


; for Guides -> Items screen
.org 0x2036B10
bl RetrieveCharacterIcon_lead
str r0,[r13,0xC]
bl RetrieveCharacterIcon_back
str r0,[r13,0x8]
.close


.open "ftc/overlay9_119", Overlay119Start
.org 0x2308EC0+0x2500	;0x4C bytes

RetrieveCharacterIcon_lead:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE3]
ldr r1,=PlayerDataTable
ldr r2,=0x58
mla r0,r0,r2,r1
ldrh r0,[r0,0x52]
bx r14
RetrieveCharacterIcon_back:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE4]
ldr r1,=PlayerDataTable
ldr r2,=0x58
mla r0,r0,r2,r1
ldrh r0,[r0,0x52]
bx r14
.pool

.close
