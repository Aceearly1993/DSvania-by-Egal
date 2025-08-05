.nds
.relativeinclude on
.erroronwarning on

; This skips most of the company screens except the first one.
; This also skips the intro movie for the most part.
; by EgalLau37

.open "ftc/overlay9_20", 0x21FFFC0

.org 0x2214250
mov r3,r3
.org 0x22142EC
cmp r13,r14

.org 0x2213E34
mov r0,0x7
mov r1,0x6

.close