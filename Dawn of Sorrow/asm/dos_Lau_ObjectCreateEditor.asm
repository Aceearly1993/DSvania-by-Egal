.nds
.relativeinclude on
.erroronwarning on

; Allows changing which gamemode ID to check for upon object
; create for certain objects.

;gamemode IDs
;0x0 - Soma/story mode
;0x1 - Julius/extra mode
;0x2 - boss rush
;0x3 - enemy set

; by EgalLau37

Overlay41Start equ 0x2308920
Freespace	equ	Overlay41Start+0x580

.open "ftc/overlay9_0", 0x219E3E0

;object 0x6C create
.org 0x21D2BB8
mov r2,0x0	;which gamemode to check for

;object 0x6D create
.org 0x21D20B8
mov r2,0x0	;gamemode ID check
mov r3,0x0	;because game does stupid mov r3,r2 nonsense

;object 0x6E create
.org 0x21D1E8C
mov r2,0x0	;gamemode ID check
mov r3,0x0	;because game does stupid mov r3,r2 nonsense


.close



.open "ftc/overlay9_41", Overlay41Start
.org Freespace



.close

