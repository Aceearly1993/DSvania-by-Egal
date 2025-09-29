.nds
.relativeinclude on
.erroronwarning on

; By default, there are only six pages of graphics for the item
; icons.  The game has a hardcoded check to forcefully cause the
; game to infinitely hang if an item icon ID goes past the 6th page.
; This removes that hardcoded check entirely.

; by EgalLau37

Overlay86Start equ 0x22EB1A0

.open "ftc/arm9.bin", 0x2000000

.org 0x209B238
cmp r4,0xFF
mov r3,r3
mov r3,r3

.close


