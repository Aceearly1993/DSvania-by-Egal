.nds
.relativeinclude on
.erroronwarning on

; by default, the game only displays the current level on the bottom
; screen for modes other than Jonathan mode (0x00).
; this changes the code to always display the current level
; regardless of the mode.

; by EgalLau37

.open "ftc/overlay9_0", 0x21CDF60
.org 0x21FD86C
mov r0,0x1
.close

