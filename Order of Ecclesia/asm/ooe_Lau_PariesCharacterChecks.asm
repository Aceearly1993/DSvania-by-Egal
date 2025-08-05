.nds
.relativeinclude on
.erroronwarning on

; By default, the Paries entry points only work for Shanoa
; (character 0x00).  This can be changed to check for another
; character or a list of characters.

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2800

CheckMultipleCharacters	equ	"False"
; If only one character should be checked for Paries, leave at
; "False".  Otherwise, if there are multiple characters, change
; to "True" instead.

.open "/ftc/overlay9_22", 0x2223E00

.org 0x22A2334
.if CheckMultipleCharacters == "False"
cmp r2,0x0	;check if Shanoa
.elseif CheckMultipleCharacters == "True"
bl CheckListofCharactersForParies
.endif

.close



.if CheckMultipleCharacters == "False"
.elseif CheckMultipleCharacters == "True"
.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckListofCharactersForParies:
stmfd r13!,{r1-r5,r14}
ldr r3,=TableOfCharactersForParies
PariesLoop:
ldrb r1,[r3]
cmp r1,0xFF
moveq r3,0x0
beq CheckReturnParies
cmp r1,r2
moveq r3,0x1
beq CheckReturnParies
add r3,r3,0x1
b PariesLoop

CheckReturnParies:
cmp r3,0x1
ldmfd r13!,{r1-r5,r15}
.pool

; Add additional characters here.
; To add characters, add ".db charID"
TableOfCharactersForParies:
.db 0x0	;Shanoa
.db 0x5	;character 0x5
.db 0x6	;character 0x6
.db 0xFF	;terminator byte


.close
.endif
