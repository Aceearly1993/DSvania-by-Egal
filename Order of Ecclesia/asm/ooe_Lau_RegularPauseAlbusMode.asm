.nds
.relativeinclude on
.erroronwarning on

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2100

.open "ftc/arm9.bin", 0x2000000

.org 0x2037924	;top-screen toggle
cmp r3,r3	;always allow
;cmp r1,0x0	;default display

.org 0x2038014	;pause menu
bl LoadAlbusModeMenu
mov r3,r3

.org 0x204DCC4	;level display
cmp r1,0x4	;default display
;cmp r3,r3	;always display

.close



.open "ftc/overlay9_22", 0x2223E00

.org 0x222DEF4	;prevent access to glyph equips in Albus mode
b CheckAlbusMode_Equip
.org 0x222DF94	;suspend save in Shanoa/Albus mode
cmp r0,0x1
bgt 0x222DFE8

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace


LoadAlbusModeMenu:
ldrb r0,[r1,0xB3A]
cmp r0,0x0
cmpne r0,0x4
ldr r2,=CharacterPauseAnimIDTable
ldrb r0,[r2,r0]
ldr r2,=0x22AFA48
strb r0,[r2]
bx r14
.pool

CharacterPauseAnimIDTable:
.db 0x0
.db 0x0
.db 0x0
.db 0x0
.db 0x72
.db 0x0
.db 0x0
.db 0x0
.db 0x0
.align 0x4

CheckAlbusMode_Equip:
ldr r1,=0x20FFC58
ldrb r1,[r1,0xB3A]
cmp r1,0x4
bne 0x222DFFC
beq 0x222DF24
.pool


