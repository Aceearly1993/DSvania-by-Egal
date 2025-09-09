.nds
.relativeinclude on
.erroronwarning on

; Status ailment data is always saved, but when resuming from
; a save, the game always clears any status ailments along with
; its associated status data.  
; This skips the subroutine which clears any status ailments.
; Note that this also applies to standard save point saves, but
; this only is relevant if a status ailment is applied after
; the statue clears the status.
; It is possible to differentiate which type of save is being
; loaded, but this would need to be coded in.

; by EgalLau37


Overlay86Start equ 0x22EB1A0


.open "ftc/arm9.bin", 0x2000000

.org 0x204E578
mov r3,r3

.close



