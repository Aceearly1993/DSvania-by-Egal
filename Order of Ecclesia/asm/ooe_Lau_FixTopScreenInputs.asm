.nds
.relativeinclude on
.erroronwarning on

; By default, the inputs on the top-screen do not display the
; correct buttons if swapped off the default combination.
; (The game was using the set input to determine which text ID
; to display instead of always using the Y, X, and R buttons
; which caused the wrong button to ultimately be displayed.)
; This fixes that.

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2000


.open "ftc/arm9.bin", 0x2000000

.org 0x20AF4E4
mov r0,r9
bl RetrieveExactSameInputs

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

RetrieveExactSameInputs:
ldr r1,=0x2100790
ldrb r1,[r1,0x2]
cmp r1,0x4
ldrne r1,=TableOfCombatInputs
ldreq r1,=TableOfCombatInputs_Albus
ldr r0,[r1,r0,lsl 0x2]
bx r14
.pool


TableOfCombatInputs:
.dw 0x436	;text ID for Y button
.dw 0x435	;text ID for X button
.dw 0x438	;text ID for R button
.dw 0x61D

TableOfCombatInputs_Albus:
.dw 0x438	;text ID for R button
.dw 0x61D	;text ID for glyph union
.dw 0x436	;text ID for Y button
.dw 0x435	;text ID for X button

.close
