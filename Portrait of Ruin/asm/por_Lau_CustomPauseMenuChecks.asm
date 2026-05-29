.nds
.relativeinclude on
.erroronwarning on

; In vanilla, the game never expects the player to be able to
; access the standard pause menu in any mode other than
; story/Jonathan mode. As a result, the pause menu was not
; designed for the other characters, meaning if the regular pause
; menu is accessed in Richter mode, using the Talk option
; results in Jonathan/Charlotte dialogue.
; This patch can be used to somewhat customize the availability
; of different pause menu main entry options.

; This patch was designed to give some flexibility to the user.
; Some generic checks were added to the end of the patch that
; can be referenced by the addls table below.
; To change how the game checks the availability of a pause
; menu entry, swap out the label with one from below.
; Some examples have been given, such as the ones for
; Talk, Relics, Guides. Change the address after the "b" to the
; label desired, and the game will instead use the new check.

; "Gamemode" vs. "character mode"
; Not sure what the official names for the modes are for at
; 2111F51 and 2111F52, but EgalLau37 calls them "gamemode"
; and "character mode" to distinguish them.
; 2111F51 seems to more denote which gamemode (main vs. Boss
; Rush, for example) while 2111F52 stays the same between gamemodes
; but still varies per pair.
; 0x0/0x0 would be for story mode/Jonathan.
; 0x4/0x1 would be for Boss Rush with Sisters.
; 0x0/0x5 would be for story mode/Soma in EgalLau37's hack.


; by EgalLau37


PlayerDataTable	equ	0x221E7F4

Overlay119Start	equ	0x2308EC0


.open "ftc/arm9.bin", 0x2000000
;Equip and Guides have sub-entries. They are listed below.

.org 0x203CF0C	;sub-entry 0x1, character equip
cmp r0,0x0	;check if equip box selected
beq 0x203CF74	;b AlsoCheckCharacterMode_Equip

.org 0x203CD98	;sub-entry 0x2, Guides
cmp r0,0x0
beq 0x203CDC0	;b AlsoCheckCharacterMode_Guide



.org 0x203D0D0
cmp r0,0x7	;there are seven main entries
addls r15,r15,r0,lsl 0x2
b 0x203d1f0
b 0x203d0fc ; 0x0 - Equip
b 0x203d1f0 ; 0x1 - Use Item
b 0x203d130 ; 0x2 - Suspend
b 0x203d1f0 ; 0x3 - Config
b 0x203d1f0 ; 0x4 - Talk	;b CheckCharacterMode	;
b 0x203d1f0 ; 0x5 - Relics	;b CheckCharacterMode	;
b 0x203d18c ; 0x6 - Guides	;b CheckCharacterMode	;
b 0x203d1b4 ; 0x7 - Maps
; To swap the check for Talk, replace:
; "b 0x203d1f0" with "b CheckCharacterMode".

.org 0x203D1E8
ClosePauseMenu:

.org 0x203D1F0
AlwaysReturnTrue:

.org 0x203D158
AlwaysReturnFalse:	;probably

.close



.open "ftc/overlay9_119", Overlay119Start
.org 0x2308EC0+0x2550	;0x4C bytes

; using this will mean that an option will NOT be available in
; Boss Rush mode.
CheckGamemode:	;check if story mode (0x0 for Jonathan mode)
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE1]
cmp r0,0x0
beq AlwaysReturnTrue
bne AlwaysReturnFalse


CheckCharacterMode:	;check if Jonathan [character] mode (0x0)
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
cmp r0,0x0
beq AlwaysReturnTrue
bne AlwaysReturnFalse


; do not use these for anything other than their intended sub-entry

AlsoCheckCharacterMode_Equip:
beq 0x203CF74
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
beq 0x203CF14	;is Jonathan mode
bne 0x203CF4C	;is not


AlsoCheckCharacterMode_Guide:
beq 0x203CDC0
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
beq 0x203CDA0	;is Jonathan mode
bne 0x203D0A8	;is not
.pool


.close
