.nds
.relativeinclude on
.erroronwarning on

; By default, the death ring deals damage equal to the player's
; maximum HP.  If cheats are used to make the current HP exceed
; the maximum, the player will not actually die.  This changes
; the Death ring so that the player will die even if the current
; HP exceeds the maximum HP.
; The item ID for the Death ring can also be changed here.

; by EgalLau37

Overlay86Start equ 0x22EB1A0

DeathRingID_local	equ	0x10

.open "ftc/arm9.bin", 0x2000000

.org 0x20516A0
mov r1,DeathRingID_local

.org 0x20516B4
movne r4,r1

.close

