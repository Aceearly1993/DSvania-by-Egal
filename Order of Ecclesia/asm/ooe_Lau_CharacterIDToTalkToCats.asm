.nds
.relativeinclude on
.erroronwarning on

; This patch changes which character ID can talk to the cats.
; by EgalLau37

.open "/ftc/overlay9_19", 0x21FFFC0

.org 0x221B6A4
cmp r0,0x1	;default: 0x1, felix


.close