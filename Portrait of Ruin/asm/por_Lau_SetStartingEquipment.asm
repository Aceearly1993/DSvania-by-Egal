.nds
.relativeinclude on
.erroronwarning on

; Upon starting a new game or loading a save, the game runs
; a routine that sets the current equipment set, adds items to
; the inventory, and sets the character's base damage.
; Part of that routine has been transcribed below to allow
; easier editing.
; By default, the sisters share a branch routine that is also
; used for invalid IDs that sets the currently equipped weapon
; to ID 0x00, nothing.

; Relevant sections will be listed below and explained.
/*
;add to inventory + equip
;this block adds an item to inventory and equips it.
ldrsb r0,[r6,0xec]	;lead/back character
mov r1,0x3	;item category, 0x3 = weapon
mov r2,0x0	;equipment slot to equip to, weapon slot
mov r3,0x1	;local item ID, 0x1 = vampire killer
bl 0x2206bfc	
*/

/*
;set character base damage
;sets character's base damage-- NOT STR or ATK.
;used for Yoko, Alucard, Old Axe Armor whose unarmed
;attack has hurtboxes attached to the unarmed animation
add r0,r6,0x100
mov r1,0x14
strh r1,[r0,0x40]
*/

/*
;checks if loading from save file or starting new game
;used by Jonathan/Charlotte to only set equipment if starting
;a new game and not loading a save
ldr r0,=0x20ca580
ldr r0,[r0]
add r0,r0,0x1b000
ldrb r0,[r0,0x519]
cmp r0,0x0
bne labelName	;can be whatever
labelName:	;place this after code that should be skipped
*/

/*
;always add this to the end
b _02206be8
*/

;how to make custom branch:
; 1. replace the branch label with a new one
;  For example, replace "SetEquipment_Richter" with any new label.
;  In this case, let's use Stella:  "SetEquipment_Stella"
;  "b SetEquipment_Richter" -> "b SetEquipment_Stella"
;  The actual label name does not matter, it can be anything.
; 2. add the new label below the line indicated near the end.
;  Scroll down to see the example.
; 3. Add the code desired.
; 4. Add the final line
;the character will now have new code for setting initial equipment

;new code for Stella and Loretta have been added near the end
;as an example. to use them, simply replace the corresponding
;after the addls line.

; by EgalLau37


ItemType_Consumeable	equ	0x2
ItemType_Weapon		equ	0x3
ItemType_Chestplate	equ	0x4
ItemType_Helmet		equ	0x5
ItemType_Boots		equ	0x6
ItemType_Accessory	equ	0x7
ItemType_Skill		equ	0x8
ItemType_Spell		equ	0x8
ItemType_DualCrush		equ	0x9
ItemType_Relic		equ	0xB


Overlay119Start equ 0x2308EC0
Freespace	equ	Overlay119Start+0x480


.open "ftc/overlay9_0", 0x21CDF60

.org 0x2206a9c
.area 0x154,0x69
_02206a9c:
cmp r5,0x6	;number of characters
addls r15,r15,r5,lsl 0x2	;replace labels below
b SetEquipment_null	;null case; do not replace
b SetEquipment_Jonathan ; 0x0 - Jonathan
b SetEquipment_Charlotte; 0x1 - Charlotte
b SetEquipment_null		; 0x2 - Stella
b SetEquipment_null 	; 0x3 - Loretta
b SetEquipment_Richter	; 0x4 - Richter
b SetEquipment_Maria	; 0x5 - Maria
b SetEquipment_OldAxeArmor ; 0x6 - Old Axe Armor

SetEquipment_Jonathan:
ldr r0,=0x20ca580
ldr r0,[r0]
add r0,r0,0x1b000
ldrb r0,[r0,0x519]
cmp r0,0x0	;checks if loading save or new game
bne _02206b14
ldrsb r0,[r6,0xec]	;lead/back character
mov r1,0x3	;item category, 0x3 = weapon
mov r2,0x0	;equipment slot to equip to, weapon slot
mov r3,0x1	;local item ID, 0x1 = vampire killer
bl 0x2206bfc	;add to inventory + equip
ldrsb r0,[r6,0xec]
mov r1,0x4
mov r2,0x2
mov r3,0x1
bl 0x2206bfc
mov r0,0x3
mov r1,0x1
mov r2,0x1
bl 0x21e4428	;add to inventory?
_02206b14:
add r0,r6,0x100
mov r1,0x14
strh r1,[r0,0x40]
b _02206be8

SetEquipment_Charlotte:
ldr r0,=0x20ca580
ldr r0,[r0]
add r0,r0,0x1b000
ldrb r0,[r0,0x519]
cmp r0,0x0
bne _02206be8
ldrsb r0,[r6,0xec]
mov r1,0x3
mov r2,0x0
mov r3,0xc	;0xC = Encyclopedia
bl 0x2206bfc
ldrsb r0,[r6,0xec]
mov r1,0x4
mov r2,0x2
mov r3,0x1
bl 0x2206bfc
b _02206be8

SetEquipment_Richter:
ldrsb r0,[r6,0xec]
mov r1,0x3
mov r2,0x0
mov r3,0xb	;0xB = Richter's vampire killer
bl 0x2206bfc
add r0,r6,0x100
mov r1,0x32
strh r1,[r0,0x40]
b _02206be8

SetEquipment_Maria:
ldrsb r0,[r6,0xec]
mov r1,0x3
mov r2,0x0
mov r3,0x48	;Tori
bl 0x2206bfc
add r0,r6,0x100
mov r1,0x32
strh r1,[r0,0x40]
b _02206be8

SetEquipment_OldAxeArmor:
ldrsb r0,[r6,0xec]
mov r1,0x3
mov r2,0x0
mov r3,0x40	;0x40 = Golden axe
bl 0x2206bfc
add r0,r6,0x100
mov r1,0x28
strh r1,[r0,0x40]
b _02206be8

SetEquipment_null:
ldrsb r0,[r6,0xec]
mov r1,0x3
mov r2,0x0
mov r3,0x0	;(unarmed)
bl 0x2206bfc
_02206be8:
bl 0x2207db0
ldmfd r13!,{r4-r6,r15}
.endarea
.org 0x2206bf8
.pool

.close


.open "ftc/overlay9_119", Overlay119Start

.org Freespace

SetEquipment_Stella:
ldrsb r0,[r6,0xec]
mov r1,ItemType_Weapon
mov r2,0x0
mov r3,0x48	;equips Tori, change as desired
bl 0x2206bfc
add r0,r6,0x100
mov r1,0x14	;character base damage
strh r1,[r0,0x40]
b _02206be8

SetEquipment_Loretta:
ldrsb r0,[r6,0xec]
mov r1,ItemType_Weapon
mov r2,0x0
mov r3,0x48	;equips Tori, change as desired
bl 0x2206bfc
add r0,r6,0x100
mov r1,0x14	;character base damage
strh r1,[r0,0x40]
b _02206be8


;add new code and labels below here

.pool
.close


