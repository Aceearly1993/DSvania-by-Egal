.nds
.relativeinclude on
.erroronwarning on

; When resuming a Suspend save, that suspend save option no longer
; is selectable.  However, the suspend save data still remains;
; the game only clears the flag that allows the suspend save file
; to be selected.  This changes that so that the suspend save
; flag persists, allowing the Suspend save file to still be
; selected.

; by EgalLau37


Overlay86Start equ 0x22EB1A0


.open "ftc/arm9.bin", 0x2000000

.org 0x20AC70C
mov r3,r3

.close



