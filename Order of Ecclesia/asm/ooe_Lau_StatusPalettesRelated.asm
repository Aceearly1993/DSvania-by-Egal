.nds
.relativeinclude on
.erroronwarning on

; This allows setting which Common palette index to use while
; under the Poison and Curse status effects.
; 
; If UseStatusPaletteFromTable is set to "True", the game will
; instead use a table to determine which palette to use rather
; than using specific hardcoded values.  Palettes can also be
; set if under multiple status effects simultaneously rather than
; the game prioritizing Curse for the palette index to use.

; By default, if an animation uses a non-zero palette index, this
; will cause the common palette index to also be shifted accordingly,
; causing the incorrect color to flash while under that status
; effect while that animation is playing. If UseStatusPaletteFix
; is set to "True", a fix will also be applied to fix this issue.

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x3A00

UseStatusPaletteFromTable	equ	"True"
UseStatusPaletteFix		equ	"True"

.open "ftc/arm9.bin", 0x2000000

.if UseStatusPaletteFromTable == "False"
.org 0x2050A74	;common palette index, poison
mov r1,0x40+0x5
.org 0x2050AB0	;common palette index, curse
mov r1,0x40+0x7

.elseif UseStatusPaletteFromTable == "True"

.org 0x20509B0
cmp r0,0x0
.org 0x2050A70
.area 0x50,0x69
ldrh r0,[r5,0x64]
tst r0,0x2
beq SkipCurseUpdateCheck
ldr r0,=0x2100258
ldrsh r1,[r7,0x18]
ldrsh r0,[r0,0x62]
movs r0,r0,asr 0x7
moveq r0,0x1
tst r1,0x1
bleq 0x2050434
SkipCurseUpdateCheck:
ldrh r0,[r5,0x64]
ldr r1,=AilmentPaletteTable
ldrb r1,[r1,r0]
add r0,r7,0x100
strh r1,[r0,0x48]
add r13,r13,0x20
ldmfd r13!,{r3-r7,r15}
AilmentPaletteTable:
.db 0x0		;none
.db 0x45	;poison
.db 0x47	;curse
.db 0x4F	;poison+curse
.db 0x0		;stone
.db 0x45	;stone+poison
.db 0x47	;stone+curse
.db 0x4F	;stone+poison+curse
.endarea

.org 0x2050ACC
.pool
.endif


.if UseStatusPaletteFix == "True"
.org 0x202B8FC
bl CheckStatusForceCommonPalette
mov r3,r3
.endif


.close



.if UseStatusPaletteFix == "True"
.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckStatusForceCommonPalette:
ldr r0,=0x2100258
ldrh r0,[r7,0xBC]
cmp r0,0x0
bne StatusDrawUpdate
add r0,r2,r11
mov r0,r0,lsl 0x5
bx r14

StatusDrawUpdate:
cmp r11,0x0
addeq r0,r2,r11
moveq r0,r0,lsl 0x5
movne r0,r11,lsl 0x5
bx r14
.pool

.close
.endif

