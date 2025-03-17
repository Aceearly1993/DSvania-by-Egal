.nds
.relativeinclude on
.erroronwarning on

PlayerDataTable	equ	0x221E7F4

; by default, the game is hardcoded to load the character icons for
; Jonathan and Charlotte (0xF3, 0xF4) on the use item screen.
; this changes the code to instead load the icons for the current
; characters.

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

.org 0x203A58C
bl DynamicLoadCharacterIconA_ItemUse
.org 0x203A594
bl DynamicLoadCharacterIconB_ItemUse

.close


.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x1DA0

DynamicLoadCharacterIconA_ItemUse:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE3]
ldr r9,=PlayerDataTable
ldr r8,=0x58
mla r0,r0,r8,r9
ldrh r0,[r0,0x52]
bx r14

DynamicLoadCharacterIconB_ItemUse:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE4]
ldr r9,=PlayerDataTable
ldr r8,=0x58
mla r0,r0,r8,r9
ldrh r0,[r0,0x52]
bx r14
.pool

.close

