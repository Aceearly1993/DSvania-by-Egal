.nds
.relativeinclude on
.erroronwarning on

; by default, the option to set level cap is only available for hard
; difficulty.
; this changes the code to also allow the same level cap options
; even if normal difficulty is selected.
; note that normal difficulty will have the same choices of
; 50/25/01 for the level cap.

; by EgalLau37

.open "ftc/overlay9_25", 0x22D7900
.org 0x22D7DD4	;always considered Hard mode for selection, level select
mov r0,0x1

.org 0x22D7EA0
mov r0,r9
bl RetrieveDifficulty
mov r2,0x32

.org 0x22D7EB4
mov r0,r9
bl RetrieveDifficulty
mov r2,0x19

.org 0x22D7EC8
mov r0,r9
bl RetrieveDifficulty
mov r2,0x1

.close



.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x2250	;ends ~???
RetrieveDifficulty:
ldrb r1,[r9,0x48]
bx r14

/*
RetrieveLevelCap:
ldr r2,[r9,0x158]
add r2,r2,0x100
ldrb r2,[r2,0xD8]
bx r14
*/

.close

