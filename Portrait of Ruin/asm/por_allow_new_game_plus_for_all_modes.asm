.nds
.relativeinclude on
.erroronwarning on

; by default, the game checks if a particular save file is Jonathan
; mode for whether to allow the CLEAR option to display.
; this removes that check.
; also by default, the game only unlocks the option for New Game+ for
; Jonathan mode.
; this changes the subroutine that unlocks New Game+ to always
; unlock New Game+.

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000
.org 0x20117B8
mov r7,0x1

.close


.open "ftc/overlay9_25", 0x22D7900
.org 0x22D8248	;check for Jonathan mode for CLEAR option
mov r3,r3	

.close

