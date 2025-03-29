.nds
.relativeinclude on
.erroronwarning on

; by default, Dracula never finishes his drink and will wait indefinitely
; if the Dracula fight is entered while in Sisters mode.
; this fixes that.

; by EgalLau37

.open "ftc/overlay9_87" 0x22E8820
.org 0x22E8DCC
cmp r0,0x2
blt 0x22E8E10

.close

