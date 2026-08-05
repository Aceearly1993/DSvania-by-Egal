.nds
.relativeinclude on
.erroronwarning on

; By default, the game disables enemy drops in modes other than
; Soma/story mode. This can be used to edit which mode to allow
; or disallow enemy drops.

;gamemode IDs
;0x0 - Soma/story mode
;0x1 - Julius/extra mode

; by EgalLau37

Overlay41Start equ 0x2308920
Freespace	equ	Overlay41Start+0x580

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21C3A34
cmp r0,0x0	;gamemode ID to check
addne r13,r13,0x10
ldmnefd r13!,{r4-r10,r15}
mov r3,r3


.close



.open "ftc/overlay9_41", Overlay41Start
.org Freespace



.close

