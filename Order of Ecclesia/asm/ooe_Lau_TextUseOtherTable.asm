.nds
.relativeinclude on
.erroronwarning on

; TextUseOtherTable.asm description
; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x3700


.open "ftc/arm9.bin", 0x2000000

.org 0x2085244
bne CheckToUseOtherTable

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckToUseOtherTable:
ldr r1,=0x3700
cmp r0,r1
blt 0x2085250
sub r0,r0,0x3700
ldr r1,=OtherTextTable
ldr r0,[r1,r0,lsl 0x2]
ldmfd r13!,{r3,r15}
.pool


OtherTextTable:
;.ascii "Paste-write 'otherTextTable.bin' on top of this text. ~EgalLau37"
;.import "otherTextTable.bin"

.dw TextPointer3700
.dw TextPointer3701
.dw TextPointer3702
.dw TextPointer3703


TextPointer3700:
.db 0x01
.db 0x00
.db 0x28
.db 0x30
.db 0xEA

TextPointer3701:
.db 0x01
.db 0x00
.db 0x28
.db 0x30
.db 0xEA

TextPointer3702:
.db 0x01
.db 0x00
.db 0x28
.db 0x30
.db 0xEA

TextPointer3703:
.db 0x01
.db 0x00
.db 0x28
.db 0x30
.db 0xEA

.close
