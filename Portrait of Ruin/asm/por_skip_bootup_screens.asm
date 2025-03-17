.nds
.relativeinclude on
.erroronwarning on

; When booting up the game, the game displays four screens of company names.
; This skips those screens by immediately booting to the main menu

; the F7 start in room shortcut uses 0x18, so using this patch will
; force main screen boot-up instead of starting in the specified room

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

.org 0x2001458
mov r0,0x5		;5=main menu screen
;mov r0,0x18	;18= bootup screens

.close



;for after game over
.open "ftc/overlay9_35", 0x22E01A0

.org 0x22E0258
moveq r4,0x5	;5=main menu screen
;moveq r4,0x18	;18= bootup screens

.close
