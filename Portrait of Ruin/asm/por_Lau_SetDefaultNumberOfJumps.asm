.nds
.relativeinclude on
.erroronwarning on

; By default, the player is allowed to jump twice before
; returning to the ground. By increasing this number, the number
; of double-jumps can be increased beyond the default one.
; This can be used to allow triple and quadruple jumps.

; by EgalLau37

Freespace	equ	0x2308EC0+0x2000
Overlay119Start	equ	0x2308EC0


.open "ftc/overlay9_0", 0x21CDF60
.org 0x2200584
mov r3,0x2	;default number of jumps allowed

.close



.open "ftc/overlay9_119", Overlay119Start

.close


