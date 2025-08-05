.nds
.relativeinclude on
.erroronwarning on

; These are the properties for the save prompt textbox.
; The default values are 0x50, 0x32, 0x0 for the y-position, height,
; and palette index, respectively.
; by EgalLau37

Overlay86Start equ 0x22EB1A0

.open "/ftc/overlay9_22", 0x2223E00

.org 0x229D27C
mov r0,0x50	;textbox position
mov r1,0x32	;textbox height
mov r3,0x0	;textbox palette index

.close


