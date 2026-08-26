.nds
.relativeinclude on
.erroronwarning on

; Specific to Sisters mode is the ability to tap the screen while
; within range of a warp panel to activte it. This check is
; specific to Sisters mode only.
; This patch allows all modes to make use of this check/feature.

; by EgalLau37

Overlay119Start	equ	0x2308EC0
Freespace	equ	Overlay119Start+0x4000


.open "ftc/arm9.bin", 0x2000000

;overwrite check for Sisters mode
.org 0x2082B5C
cmp r3,r3	;cmp r1,0x2


.close

