.nds
.relativeinclude on
.erroronwarning on

; by default, the hard mode rewards check if the level cap EXACTLY
; matches 1, 25, or 50.
; this changes each check to instead check for if the level cap
; is less than OR equal to.

; by EgalLau37

.open "ftc/overlay9_117", 0x22E8820
.org 0x22E9340
cmp r0,0x1
ble 0x22E935C
cmp r0,0x19
ble 0x22E9390
cmp r0,0x32
ble 0x22E93B4
b 0x22E93C4
.close

