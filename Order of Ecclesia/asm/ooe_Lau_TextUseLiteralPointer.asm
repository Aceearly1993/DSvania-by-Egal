.nds
.relativeinclude on
.erroronwarning on

; This adds additional support to the text routine to also accept
; the literal pointer to a text rather than the text ID for a text.
; Normally, when calling the routine at 0x2088B88 or some other
; text routine, the expected input is a text ID that consists of
; only two bytes.  The game also forces the input to two bytes
; at several points in the code.  This changes the necessary
; routines to not truncate the leading two bytes and maintain the
; full input.
; So if a text is at 0x22EE88D, the input into r0 for the routine
; at 0x2088B88 should just be 0x22EE88D.
; Additionally, this adds functionality for another text table
; separate from the one used by the default texts.  By adding
; 0x3700 to a text ID, this other text table is used instead.
; This text table should be added under "OtherTextTable:" header
; and follows the format of a table of pointers to texts, the
; exact same as the vanilla text table.
; The text IDs for this table should be ID-0x3700.  So a text ID
; of 0x3702 will reference the new text table and read entry 0x2.
; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x3700


.open "ftc/arm9.bin", 0x2000000

.org 0x2085244
bne CheckToUseLiteralPointer


.org 0x20874F0	;load word instead of short
ldr r0,[r13,0x30]
.org 0x2087518	;load word instead of short
ldr r0,[r13,0x30]
.org 0x20859D0	;load word instead of short
ldr r14,[r13,0x2C]

.org 0x2088B4C	;prevents game from forcing short
mov r0,r1
.org 0x2088B60
mov r3,r3

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckToUseLiteralPointer:
ldr r1,=0x3700
cmp r0,r1
blt 0x2085250
tst r0,0x2000000
ldmnefd r13!,{r3,r15}
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
.db 0x1F
.db 0x1F
.db 0x1F
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


TestTextPointer:
.db 0x01
.db 0x00
.db 0x1F
.db 0x0B
.db 0xD
.db 0xEA


.close
