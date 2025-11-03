.nds
.relativeinclude on
.erroronwarning on

; This allows editing various properties of object 26, the mouse.
; by EgalLau37

Mouse_GlobalID	equ 0xAC


Overlay86Start equ 0x22EB1A0


.open "ftc/overlay9_22", 0x2223E00

;which quest ID to check for ability to pick-up mouse
.org 0x229B874
mov r0,0x9	;character ID, Anna
mov r1,0x1	;character-specific quest ID, second quest
bl 0x20A963C
cmp r0,0x0
beq 0x229B8C8
;mov r3,r3	;swap this line with above to always return true


.org 0x229B9A0
tst r0,0x80	;input(s) to check for voice clip, up
.org 0x229B9B0
cmp r0,0x0	;character ID to check to play voice clip
.org 0x229BBCC
.dw 0x4400005D	;voice clip to play when picking up mouse

.org 0x229BA3C
cmp r0,0x1	;character ID, related to movement?

.org 0x229BB94
mov r3,Mouse_GlobalID+1


.close
