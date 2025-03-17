.nds
.relativeinclude on
.erroronwarning on

; Mostly skips the bootup screens; the "Licensed by Nintendo"
; still appears for a few frames though.

.open "ftc/arm9.bin", 0x2000000

.org 0x203E794	;game bootup
mov r3,r3

.org 0x203E7A0
mov r12,0x5

.close