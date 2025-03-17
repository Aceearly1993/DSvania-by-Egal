.nds
.relativeinclude on
.erroronwarning on

; Allows Soma's pause menu in Julius mode.
; by EgalLau37

@Overlay41Start equ 0x02308920
@FreeSpace equ @Overlay41Start + 0x100

.open "ftc/arm9.bin", 0x2000000

.org 0x203002C
mov r0,0x0	;mode always 0 for pause check

.org 0x209A5F0	;check table
.dw CheckMode_Equip

.org 0x20282F4	;check for suspend save
cmp r2,0x1
ldrgt r0,=0x419
bxgt r14
.org 0x2028318
.pool

.close


.open "ftc/overlay9_41", @Overlay41Start

.org @FreeSpace
.align 4
CheckMode_Equip:	;disables equip menu in Julius mode
ldr r1,=0x208AC20
mvn r0,0x0
ldr r1,[r1]
add r1,r1,0x36000
ldrb r2,[r1,0xA77]
cmp r2,0x1
ldreq r0,=0x44B	;text ID for description for disabled equip menu
bx r14
.pool

.close
