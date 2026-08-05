.nds
.relativeinclude on
.erroronwarning on

; This patch includes an optimized version of the code
; responsible for drawing the Julius mode GUI, including the
; character portraits, subweapon, and current level/pause.
; This patch also changes the Julius mode GUI to change color
; (specifically the level/numbers) based on the current character.
; The table of colors is located near the bottom and correspond
; to the palette IDs used for the Common GFX sprites.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

;routine that draws GUI for Julius mode
.org 0x21f6ae4
.area 0x1DC,0x69
stmfd r13!,{r4-r11,r14}
mov r4,r0
ldr r5,=0x208ac20
ldr r5,[r5,0x0]
add r1,r5,0x36000
ldrb r3,[r1,0xa77]
cmp r3,0x1
ldmnefd r13!,{r4-r11,r15}
ldr r1,[r1,0x61c]
tst r1,0x80
ldmnefd r13!,{r4-r11,r15}
add r3,r5,0x36c00
ldrsh r6,[r3,0x2e]
mov r1,0x80000
str r1,[r4,0x20]
mov r1,0xc000
str r1,[r4,0x24]
sub r3,r6,0x1
add r1,r5,r3
add r1,r1,0x36c00
ldrsb r1,[r1,0x89]
ldr r2,=0x222ded4
add r2,r2,r3,lsl 0x3
ldrsh r2,[r2,0x2]
add r1,r2,r1
strh r1,[r4,0x74]
bl 0x200d720	;draws icon for subweapon
;ldr r0,[r4,0x20]
;add r0,r0,0x20000
ldr r0,=0xA0000
str r0,[r4,0x20]
mov r8,r6
mov r7,0x1
mov r9,0x0
_021f6b7c:
add r0,r5,0x36000
ldrb r2,[r0,0xa78]
mov r0,r7,lsl r8
tst r2,r0
beq _021f6bb4
add r1,r8,0xf3-1	;icon of first character
strh r1,[r4,0x74]
mov r0,r4
bl 0x200d720
ldr r0,[r4,0x20]
add r0,r0,0xe000
str r0,[r4,0x20]
_021f6bb4:
add r8,r8,0x1
cmp r8,0x4
movge r8,0x1
add r9,r9,0x1
cmp r9,0x3	;number of character icons to draw
blt _021f6b7c
mov r0,0xe0000-0x4000
str r0,[r4,0x20]
;mov r1,0xc000
;str r1,[r4,0x24]
ldrh r7,[r4,0x7A]
ldr r1,=CharacterToPaletteTable
ldrb r1,[r1,r6]
strh r1,[r4,0x7A]
ldrb r0,[r5,0x10]
cmp r0,0x0
beq _021f6c14
ldrb r0,[r5,0x12]
cmp r0,0x3
bne _021f6c14
mov r1,0x114	;icon ID of PAUSE graphic
strh r1,[r4,0x74]
mov r0,r4
bl 0x200d720
b JuliusModEGUIDraw_end
_021f6c14:
ldr r1,=0x10d	;icon ID of LV. graphic
strh r1,[r4,0x74]
mov r0,r4
bl 0x200d720
ldr r1,[r4,0x20]
add r1,r1,0x18000+0x8000	;offset of numbers from LV.
str r1,[r4,0x20]
add r0,r5,0x36c00
ldrsh r9,[r0,0x2c]
mov r8,0x0
ldr r10,=0x66666667
_021f6c50:
smull r0,r1,r10,r9
mov r1,r1,asr 0x2
mov r0,r9,lsr 0x1f
add r1,r0,r1
mov r12,0xA
smull r0,r1,r12,r1
sub r1,r9,r0
add r1,r1,0x100
strh r1,[r4,0x74]
mov r0,r4
bl 0x200d720
mov r1,r9
smull r0,r9,r10,r1
ldr r0,[r4,0x20]
sub r0,r0,0x8000	;distance between numbers
str r0,[r4,0x20]
mov r0,r1,lsr 0x1f
mov r9,r9,asr 0x2
add r9,r0,r9
add r8,r8,0x1
cmp r8,0x2+1	;number of digits to draw
blt _021f6c50
JuliusModEGUIDraw_end:
strh r7,[r4,0x7A]
ldmfd r13!,{r4-r11,r15}
.pool

CharacterToPaletteTable:
.db 0x9,0x8,0x2,0x1,0x5
;Soma, Julius, Yoko, Alucard, Hammer

.endarea
;arm_func_end 0x21f6ae4

.close


.open "ftc/overlay9_3", 0x229E600

;sets level GUI palettes to 0x0
.org 0x229ED18+0xE	;LV.
.dh 0x0
.org 0x229EC38+0xE	;PAUSE
.dh 0x0
.org 0x229EC48+0xE	;0
.dh 0x0
.org 0x229EEA8+0xE	;1
.dh 0x0
.org 0x229EA28+0xE	;2
.dh 0x0
.org 0x229EA18+0xE	;3
.dh 0x0
.org 0x229E9C8+0xE	;4
.dh 0x0
.org 0x229EBF8+0xE	;5
.dh 0x0
.org 0x229EDF8+0xE	;6
.dh 0x0
.org 0x229EDE8+0xE	;7
.dh 0x0
.org 0x229EDB8+0xE	;8
.dh 0x0
.org 0x229EDA8+0xE	;9
.dh 0x0
.org 0x229ED78+0xE	;:
.dh 0x0
.org 0x229ED68+0xE	;+
.dh 0x0
.org 0x229E988+0xE	;-
.dh 0x0

.close

