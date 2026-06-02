.nds
.relativeinclude on
.erroronwarning on

; The routine at 0x21fc9d8 gives the starting consumeable
; items in Jonathan mode (2x Potion, 1x High tonic).
; That routine has been included here, optimized, and
; adds support for adding starting consumeable items for
; other modes.
; To give different items for different modes, change the
; branch point in the addls table for the corresponding
; mode ID, then add that label in freespace in overlay_0119.
; Labels have been created for the extra modes.
; Further instructions included below.

; by EgalLau37

Freespace	equ	0x2308EC0+0x2000
Overlay119Start	equ	0x2308EC0


.open "ftc/overlay9_0", 0x21CDF60

;optimized version of original routine
;(not labeled/noted in DSVania's .sym file at current)
.org 0x21fc9d8
.area 0x12C,0x69
stmfd r13!,{r4-r7,r14}
ldr r4,=0x20ca580
ldr r4,[r4]
add r0,r4,0x1b000
ldr r1,[r0,0x97c]	;2111BEC
orr r1,r1,0x1
str r1,[r0,0x97c]
mov r1,0x0
strb r1,[r0,0xf60]	;21121D0
ldr r1,[r0,0xf54]	;21121C4
cmp r1,0x0
ldreq r1,=0x5dc
streq r1,[r0,0xf54]
mvn r3,0x0
ldr r1,=0xf08
strh r3,[r0,r1]	;2112178
mov r1,0x0
strb r1,[r0,0xf61]	;21121D1
strb r1,[r0,0xfcd]	;211223D
ldrb r0,[r0,0xce1]	;2111F51
SetStartingConsumeables:
cmp r0,0x4
addls r15,r15,r0,lsl 0x2
b _021fcaa8	;null
b _021fca64	; 0x0 - story mode
b SetStartingConsumeables_Sisters	; 0x1 - sisters
b SetStartingConsumeables_Richter	; 0x2 - richter
b SetStartingConsumeables_OldAxeArmor	; 0x3 - old axe armor
;b _021fcaa8	; 0x4 - boss rush
;b _021fcaa8	; 0x5 - shop mode
;b _021fcaa8	; 0x6 - debug? mode
;(boss rush uses a different routine for its inventory)
_021fca64:
mov r0,0x2
mov r1,0x0
bl 0x21e45a4	;"GetOwnedItemNum"
cmp r0,0x0
bne _021fca84
mov r0,0x2
mov r1,0x0
mov r2,0x2
bl 0x21e4428	;"SetOwnedItemNum"
_021fca84:
mov r0,0x2
mov r1,0x4
bl 0x21e45a4
cmp r0,0x0
bne _021fcaa8
mov r0,0x2
mov r1,0x4
mov r2,0x1
bl 0x21e4428
_021fcaa8:
mov r0,0x1
bl 0x2207608
add r1,r4,0x1B000
add r1,r1,0xE80
ldrsh r0,[r1,0x7E]	;211216E
strh r0,[r1,0x7C]	;211216C
ldrsh r0,[r1,0x82]	;2112172
strh r0,[r1,0x80]		;2112172
bl 0x21f22b8
ldmfd r13!,{r4-r7,r15}
.pool
.endarea
;arm_func_end func_ov000_021fc9d8

.close



; The block of code below can be copy/pasted or duplicated for
; as many items should be given. "b _021fcaa8" should be placed
; at the very end when all items have been given. The label
; "SkipSetQuantity_5a" should be unique, and the name does
; not matter.
; An example that gives multiple items is listed further down.

.open "ftc/overlay9_119", Overlay119Start

.org Freespace

SetStartingConsumeables_Sisters:
;(copy-paste code here if each mode should grant different items)
SetStartingConsumeables_Richter:
;(copy-paste code here if each mode should grant different items)
SetStartingConsumeables_OldAxeArmor:
mov r0,0x2	;category
mov r1,0x5A	;ID
bl 0x21e45a4
cmp r0,0x1
bge SkipSetQuantity_5a
mov r0,0x2	;category
mov r1,0x5A	;ID
mov r2,0x1	;quantity
bl 0x21e4428
SkipSetQuantity_5a:
b _021fcaa8
.pool

.close


/*
;an example of how to give multiple items
SetStartingConsumeables_Soma:
mov r0,0x2	;category
mov r1,0x5A	;ID
bl 0x21e45a4
cmp r0,0x1
bge SkipSetQuantity_recordPlayer
mov r0,0x2	;category
mov r1,0x5A	;ID
mov r2,0x1	;quantity
bl 0x21e4428

SkipSetQuantity_recordPlayer:
mov r0,0x2	;category
mov r1,0x4A	;ID
bl 0x21e45a4
cmp r0,0x1
bge NoGiveRustyFoodTin
mov r0,0x2	;category
mov r1,0x4A	;ID
mov r2,0x1	;quantity
bl 0x21e4428
NoGiveRustyFoodTin:

b _021fcaa8	;always end with this
*/


/*
relevant routines, copied from DSVania's .sym file:
021E43E4 GiveItem
  ; r0 - Item type (2 is consumables, etc)
  ; r1 - Item index
021E4374 RemoveItem
  ; r0 - Item type (2 is consumables, etc)
  ; r1 - Item index
  ; Reduces the number of this item you have by 1.
  ; If you already have 0, ???
021E4428 SetOwnedItemNum
  ; r0 - Item type (2 is consumables, etc)
  ; r1 - Item index
  ; r2 - Number to set
  ; Doesn't add or subtract, simply overrides the number of the item you own with r2.
*/


