.nds
.relativeinclude on
.erroronwarning on

; CharacterSwitch.asm description
; work-in-progress
; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2400
FreespaceTableSize	equ	0x10


.open "ftc/arm9.bin", 0x2000000


.org 0x204E4FC
bl Load2CharactersInstead

.org 0x204D054
LoadCharacter1:
stmfd r13!,{r0-r3}
stmfd r13!,{r3-r5,r14}
mov r5,r3
ldr r4,[r13,0x14]
bl 0x2028540
ldr r0,=0x20ffc58
strb r5,[r0,0xb3a]
bl 0x2215160
cmp r0,0x0
beq _0204d094
ldr r0,=0x20ffc58
mov r1,0x0
strb r1,[r0,0xb39]
strb r1,[r0,0xb3c]
mov r1,0xff
strb r1,[r0,0xb42]
_0204d094:
ldr r0,=0x20ffc58
ldr r2,=0x2100792
ldrb r3,[r0,0xb3e]
mov r1,0x0
ldrb r2,[r2,r3]
strb r2,[r0,0xb3d]
ldrb r0,[r0,0xb3a]
bl 0x204e634
ldr r0,=0x20ffc58
mov r1,0x0
ldr r2,[r0,0x34]
orr r2,r2,0x20000000
str r2,[r0,0x34]
ldrb r0,[r0,0xb3a]
bl 0x204e6d8
ldr r1,[r13,0x10]
mov r5,r0
str r1,[r5,0x30]
ldr r0,=0x20ffc58
str r4,[r5,0x34]
mov r3,0x0
str r3,[r0,0x1bc]
str r3,[r0,0x2f4]
str r5,[r0,0xc8]
str r5,[r0,0xcc]
ldrb r1,[r0,0xb3e]
ldrsb r0,[r5,0xec]
cmp r1,r0
bne _0204d11c
sub r0,r3,0x1f000
str r0,[r13,0x0]
add r0,r5,0x30
ldmfd r0,{r0,r1,r2}
bl 0x203aac8
_0204d11c:
bl 0x204d20c
bl 0x20497d4
bl 0x205150c
mov r0,0xf0
ldr r2,=0x204d870
mov r1,r0
bl 0x2028c58
cmp r0,0x0
ldmeqfd r13!,{r3-r5,r14}
addeq r13,r13,0x10
bxeq r14
mov r1,0xb
strh r1,[r0,0x10]
mov r0,0x6
ldr r2,=0x204eb20
mov r1,r0
bl 0x2028c58
cmp r0,0x0
ldmeqfd r13!,{r3-r5,r14}
addeq r13,r13,0x10
bxeq r14
mov r1,0xb
strh r1,[r0,0x10]
mov r0,0x2a
ldr r2,=0x204ddb4
mov r1,r0
bl 0x2028c58
movs r4,r0
ldmeqfd r13!,{r3-r5,r14}
addeq r13,r13,0x10
bxeq r14
bl 0x203c834
ldr r0,=0x204dbbc
mov r1,0xb
str r0,[r4,0x4]
ldr r0,=0x6fe0
strh r1,[r4,0x10]
str r0,[r4,0x2c]
mov r2,0x0
strb r2,[r4,0x71]
ldrb r1,[r4,0xc]
ldr r0,=0x20ffc58
orr r1,r1,0x2
strb r1,[r4,0xc]
str r2,[r5,0xd0]
ldr r1,[r0,0x34]
bic r1,r1,0x20000000
str r1,[r0,0x34]
ldmfd r13!,{r3-r5,r14}
add r13,r13,0x10
bx r14
.pool

.org 0x2049854	;character check for glyph sleeve
cmp r3,r3
.org 0x20498AC
bl SwitchCooldownTimer
mov r3,r3
.org 0x20498D8
ldr r0,=0x20FFE9C
ldrh r0,[r0,0x8]
tst r0,r1
ldmnefd r13!,{r4,r15}
ldr r0,=0x20FFE9C
ldrh r0,[r0]
tst r0,0x40
bleq ExecuteCharacterSwap
ldmfd r13!,{r4,r15}
.pool

.org 0x209B5FC
cmp r3,r3	;glyph sleeve, display main
.org 0x20AF754
cmp r3,r3	;glyph sleeve, display sub


.org 0x2027E28
cmp r4,0xB	;FreespaceTableSize
.org 0x2027D58
cmp r0,FreespaceTableSize+1	;0xC

.org 0x2027E30
bl ForceExtraFreespace

.org 0x204DCC4	;level display
cmp r13,r14

.org 0x2037920	;top-screen toggle
cmp r3,r3

.org 0x2038018	;pause menu
cmp r3,r3


.org 0x2038014	;pause menu
bl LoadAlbusModeMenu
mov r3,r3
mov r3,r3

.org 0x2047918	;quadruple ignis
bl CheckAlsoDPadUp

.org 0x206AADC
bl CheckAlbusForDoubleMax


.close




.open "ftc/overlay9_22", 0x2223E00

.org 0x2227E84	;glyph sleeve, equip screen
mov r3,0x0
.org 0x2227EB0	;glyph sleeve, equip screen
mov r3,0x0
.org 0x2227EDC	;glyph sleeve, equip screen
mov r3,0x0

.org 0x22286C0	;check for toggle, equip screen
cmp r3,r3

.org 0x22288E0
bl AlwaysWriteGlyphsToSet1
bl CheckCalculateGlyphUnion


.org 0x2228D08	;glyph sleeve, letter display, equip screen
cmp r3,r3
.org 0x2228D34	;glyph sleeve, letter display, equip screen
cmp r3,r3
.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

Load2CharactersInstead:
stmfd r13!,{r14}
bl LoadCharacter1
;bl LoadCharacter2
ldmfd r13!,{r15}


LoadCharacter2:
stmfd r13!,{r0-r3}
stmfd r13!,{r3-r5,r14}
mov r5,r3
ldr r4,[r13,0x14]
bl 0x2028540
ldr r0,=0x20ffc58
strb r5,[r0,0xb3a]
bl 0x2215160
cmp r0,0x0
beq _0204d094_2
ldr r0,=0x20ffc58
mov r1,0x0
strb r1,[r0,0xb39]
strb r1,[r0,0xb3c]
mov r1,0xff
strb r1,[r0,0xb42]
_0204d094_2:
ldr r0,=0x20ffc58
ldr r2,=0x2100792
ldrb r3,[r0,0xb3e]
mov r1,0x0
ldrb r2,[r2,r3]
strb r2,[r0,0xb3d]
ldrb r0,[r0,0xb3a]
mov r0,0x4
bl LoadCharacter2Graphics	;0x204e634
ldr r0,=0x20ffc58
mov r1,0x0
ldr r2,[r0,0x34]
orr r2,r2,0x20000000
str r2,[r0,0x34]
ldrb r0,[r0,0xb3a]
mov r0,0x4
bl LoadCharacter2Data	;0x204e6d8
ldr r1,[r13,0x10]
mov r5,r0
str r1,[r5,0x30]
ldr r0,=0x20ffc58
str r4,[r5,0x34]
mov r3,0x0
str r3,[r0,0x1bc]
str r3,[r0,0x2f4]
;str r5,[r0,0xc8]
;str r5,[r0,0xcc]
ldrb r1,[r0,0xb3e]
ldrsb r0,[r5,0xec]
cmp r1,r0
bne _0204d11c_2
sub r0,r3,0x1f000
str r0,[r13,0x0]
add r0,r5,0x30
ldmfd r0,{r0,r1,r2}
bl 0x203aac8
_0204d11c_2:
bl 0x204d20c	;resets equipment?
bl 0x20497d4	;sets glyph equipment
bl 0x205150c
mov r0,0xf1	;0xf0
mov r1,r0
ldr r2,=0x204d870
bl 0x2028c58
cmp r0,0x0
ldmeqfd r13!,{r3-r5,r14}
addeq r13,r13,0x10
bxeq r14
mov r1,0xD	;0xb
strh r1,[r0,0x10]
mov r0,0x7	;0x6
mov r1,r0
ldr r2,=0x204eb20
bl 0x2028c58
cmp r0,0x0
ldmeqfd r13!,{r3-r5,r14}
addeq r13,r13,0x10
bxeq r14
mov r1,0xD	;0xb
strh r1,[r0,0x10]
mov r0,0x2b	;0x2a
mov r1,r0
ldr r2,=0x204ddb4
bl 0x2028c58
movs r4,r0
ldmeqfd r13!,{r3-r5,r14}
addeq r13,r13,0x10
bxeq r14
bl 0x203c834
ldr r0,=0x204dbbc
mov r1,0xD	;0xb
str r0,[r4,0x4]
ldr r0,=0x6fe0
strh r1,[r4,0x10]
str r0,[r4,0x2c]
mov r2,0x0
strb r2,[r4,0x71]
ldrb r1,[r4,0xc]
ldr r0,=0x20ffc58
orr r1,r1,0x2
strb r1,[r4,0xc]
str r2,[r5,0xd0]
ldr r1,[r0,0x34]
bic r1,r1,0x20000000
str r1,[r0,0x34]
ldmfd r13!,{r3-r5,r14}
add r13,r13,0x10
bx r14
.pool




LoadCharacter2Graphics:
stmfd r13!,{r4-r10,r14}
mov r1,0x5c
mul r1,r0,r1
ldr r2,=0x20eed5c
mov r0,0xD	;0xb
add r4,r2,r1
ldr r5,[r2,r1]
bl 0x2027d44
mov r7,r0
mov r0,0xC	;0xa
bl 0x2027d44
mov r6,r0
ldrh r0,[r4,0x12]
mov r1,r6
bl 0x2032cbc
cmp r0,0x0
ldmeqfd r13!,{r4-r10,r15}
mov r0,r6
bl 0x20330c8
ldr r1,[r4,0x4]
mov r8,0x0
str r0,[r1,0x0]
ldrh r0,[r5,0x2]
cmp r0,0x0
ldmlefd r13!,{r4-r10,r15}
mov r9,r8
_0204e69c_2:
ldr r1,[r5,0x4]
ldrh r0,[r4,0x10]
add r10,r7,r9
ldr r6,[r1,r8,lsl 0x2]
mov r1,r10
add r0,r0,r8
bl 0x2032cbc
str r10,[r6,0x8]
ldrh r0,[r5,0x2]
add r8,r8,0x1
add r9,r9,0x2000
cmp r8,r0
blt _0204e69c_2
ldmfd r13!,{r4-r10,r15}
.pool


LoadCharacter2Data:
stmfd r13!,{r3-r6,r14}
sub r13,r13,0xc
ldr r2,=0x20eed5c
mov r6,r0
mov r1,0x5c
mov r0,0xD	;0xb
mla r5,r6,r1,r2
bl 0x2027d44
ldr r0,=0x2109820+0x160
bl 0x2028d00
mov r0,0x5	;0x4
ldr r2,=0x2049c58
mov r1,r0
bl 0x2028c58
movs r4,r0
addeq r13,r13,0xc
ldmeqfd r13!,{r3-r6,r15}
mov r0,0x0
strh r0,[r4,0x12]
ldrsh r0,[r4,0x6c]
ldr r1,=0xfff
cmp r0,r1
beq _0204e740_2
bl 0x202bc2c
ldr r0,=0xfff
strh r0,[r4,0x6c]
_0204e740_2:
mov r0,0xD	;0xb
str r0,[r13,0x0]
mov r0,0x1
str r0,[r13,0x4]
str r0,[r13,0x8]
mov r1,0x0
ldr r0,[r5,0x0]
mov r3,r1
mov r2,0x2
bl 0x202f0b0
ldr r1,[r5,0x4]
mov r0,r4
ldr r1,[r1,0x0]
mov r2,0x0
bl 0x2028e90
mov r1,0x0
ldr r0,[r5,0x8]
mov r2,r1
bl 0x202e328
strh r0,[r4,0x86]
ldrsh r1,[r4,0x86]
mov r0,r4
strh r1,[r4,0x88]
ldrsh r1,[r5,0x40]
strh r1,[r4,0xa2]
bl 0x2030684
mov r0,r4
mov r1,0x0
mov r2,0x2
bl 0x20306d8
mov r1,r6
mov r0,0xff
strb r0,[r4,0x70]
ldr r2,=0x2049708
mov r0,0x5b00
str r2,[r4,0x4]
str r0,[r4,0x38]
mov r0,0x4000
str r0,[r4,0x74]
mov r2,0x1
strb r2,[r4,0x20]
mov r0,0xD	;0xb
strh r0,[r4,0x10]
sub r12,r0,0xc
ldrb r3,[r4,0xc]
add r0,r4,0x100
mov r6,0x0
orr r3,r3,0xc
strb r3,[r4,0xc]
ldr r5,[r5,0xc]
mov r3,0x2
str r5,[r4,0xf8]
strh r12,[r0,0x0]
strb r6,[r4,0xec]
strb r3,[r4,0x112]
mov r0,r4
bl 0x2046248
mov r0,0x20
str r0,[r4,0xe0]
mov r0,0x1000
str r0,[r4,0x40]
mov r0,0x2
strh r0,[r4,0x86]
strh r0,[r4,0x88]
mov r0,0x0
str r0,[r4]
str r0,[r4,0x4]

;ldr r0,=0x2109820
;ldr r3,=0x20FFC58
;str r0,[r3,0xC8]
;str r0,[r3,0xCC]

mov r0,r4
add r13,r13,0xc
ldmfd r13!,{r3-r6,r15}
.pool


ExecuteCharacterSwap:
stmfd r13!,{r3-r8,r14}
sub r13,r13,0x4
b _0207d164
cmp r0,0x4
addls r15,r15,r0,lsl 0x2
b _0207d3f4
b _0207d144 ; case 0
b _0207d164 ; case 1
b _0207d184 ; case 2
b _0207d2c0 ; case 3
b _0207d3f4 ; case 4
_0207d144:
mov r0,r8
bl 0x207ccc4
mov r0,r8
bl 0x207d01c
mov r0,0x8
strh r0,[r8,0x18]
mov r0,0x1
strb r0,[r8,0xd]
_0207d164:
_0207d184:
ldr r1,=0x20ffc58
mov r3,0x0
_0207d18c:
mov r0,0x0
ldr r1,=0x20FFC58
ldrb r1,[r1,0x1A8]
cmp r1,0x0
moveq r1,0x4
movne r1,0x0
ldr r2,=0x20FFC58
ldr r2,[r2,0xC8]
ldr r6,[r2,0xD0]
ldr r7,[r2,0x3C]
ldr r8,[r2,0x40]
ldr r3,[r2,0x34]
ldr r2,[r2,0x30]

bl 0x204ea38
ldr r2,=0x20FFC58
ldr r2,[r2,0xC8]
str r6,[r2,0xD0]
str r7,[r2,0x3C]
str r8,[r2,0x40]
ldr r0,=0x2100258
ldr r1,=0x20FFC58
ldrb r1,[r1,0x1A8]
cmp r1,0x0
moveq r1,0x4
movne r1,0x0
cmp r1,0x4
addls r15,r15,r1, lsl 0x2
b _0207d284
b SetShanoaCharacter
b _0207d244
b _0207d25c
b _0207d274
b SetAlbusCharacter
_0207d244:
mov r1,0x33
strh r1,[r0,0x68]
mov r1,0x34
strh r1,[r0,0x6a]
b _0207d284
_0207d25c:
mov r1,0x35
strh r1,[r0,0x68]
mov r1,0x36
strh r1,[r0,0x6a]
b _0207d284
_0207d274:
mov r1,0x0
strh r1,[r0,0x68]
strh r1,[r0,0x6a]
b _0207d284

SetShanoaCharacter:
bl SwapEquipment
mov r1,0x0
ldr r2,=0x20FFC58
add r2,r2,0x6E0
strb r1,[r2,0xA]
b _0207d284

SetAlbusCharacter:
mov r1,0x1E
strh r1,[r0,0x68]
strh r1,[r0,0x8C]
mov r1,0x2D
strh r1,[r0,0x6a]
strh r1,[r0,0x8E]
mov r1,0x18
strh r1,[r0,0x6C]
strh r1,[r0,0x90]
mov r1,0x1A
strh r1,[r0,0x6E]
strh r1,[r0,0x92]
bl SwapEquipment
mov r1,0x1
ldr r2,=0x20FFC58
add r2,r2,0x6E0
strb r1,[r2,0xA]

_0207d284:
ldr r2,=0x20FFC58
ldr r2,[r2,0xC8]
ldr r3,[r2,0x38]
ldr r1,[r2,0x30]
ldr r2,[r2,0x34]

;ldr r0,=0x110000a7	;transform sfx
ldr r0,=0x20FFC58
ldrb r0,[r0,0x1A8]
cmp r0,0x0
ldreq r0,=0x44000071	;78 in sound room
ldrne r0,=0x4400008B	;102 in sound room

bl 0x20aa508

bl 0x20497D4

ldr r0,=0x20FFC58
ldrb r1,[r0,0x1A8]
rsb r1,r1,0x1
strb r1,[r0,0x1A8]

add r13,r13,0x4
ldmfd r13!,{r3-r8,r15}
_0207d2c0:
cmp r6,0x1
bne _0207d35c
ldr r0,[r4,0xd0]
tst r0,0x10
bne _0207d348
tst r0,0x2
beq _0207d348
ldr r0,[r4,0x74]
orr r0,r0,0x4
str r0,[r4,0x74]
ldr r1,[r4,0x34]
ldr r0,[r4,0x30]
add r1,r1,0x1000
bl 0x2033838
bl 0x2033524
mov r1,r0
mov r0,0x1
bl 0x203e35c
sub r0,r0,0x4000
strh r0,[r8,0x64]
ldrsh r0,[r4,0x64]
ldrsh r1,[r8,0x64]
mov r2,0x200
bl 0x203b434
strh r0,[r4,0x64]
ldr r0,[r4,0x104]
tst r0,0x2
beq _0207d33c
ldr r0,[r4,0xd4]
tst r0,0x4000000
beq _0207d35c
_0207d33c:
ldrsh r0,[r8,0x64]
strh r0,[r4,0x64]
b _0207d35c
_0207d348:
ldr r1,[r4,0x74]
mov r0,0x0
bic r1,r1,0x4
str r1,[r4,0x74]
strh r0,[r4,0x64]
_0207d35c:
cmp r6,0x3
bne _0207d3a0
ldr r0,=0x20ffc58
ldr r1,=0x20ffe58
ldr r3,[r0,0x1bc]
mov r2,0x3c
orr r3,r3,0x800000
str r3,[r0,0x1bc]
ldr r0,=0x2100258
strh r2,[r1,0x68]
ldrsh r0,[r0,0x60]
cmp r0,0x0
bgt _0207d3a0
mov r0,r8
bl 0x207a214
add r13,r13,0x4
ldmfd r13!,{r3-r8,r15}
_0207d3a0:
ldr r0,[r4,0xd4]
tst r0,0x580000
beq _0207d3bc
mov r0,r8
bl 0x207a214
add r13,r13,0x4
ldmfd r13!,{r3-r8,r15}
_0207d3bc:
ldr r0,=0x2100258
ldrh r0,[r0,0xbc]
tst r0,0x7
mov r0,r8
beq _0207d3dc
bl 0x207a214
add r13,r13,0x4
ldmfd r13!,{r3-r8,r15}
_0207d3dc:
bl 0x206befc
cmp r0,0x0
addeq r13,r13,0x4
ldmeqfd r13!,{r3-r8,r15}
mov r0,r8
bl 0x207a214
_0207d3f4:
add r13,r13,0x4
ldmfd r13!,{r3-r8,r15}
.pool


SwapEquipment:
ldr r0,=0x2100258
ldr r1,=0x20FFC58
ldrb r1,[r1,0x1A8]
cmp r1,0x0
rsb r8,r1,0x1
add r2,r0,0x82
mov r3,0x12
mla r8,r8,r3,r2
mla r2,r1,r3,r2

ldrh r3,[r0,0x70]
ldrh r4,[r0,0x72]
ldrh r5,[r0,0x74]
ldrh r6,[r0,0x76]
ldrh r7,[r0,0x78]
strh r3,[r2]
strh r4,[r2,0x2]
strh r5,[r2,0x4]
strh r6,[r2,0x6]
strh r7,[r2,0x8]

ldrh r3,[r8]
ldrh r4,[r8,0x2]
ldrh r5,[r8,0x4]
ldrh r6,[r8,0x6]
ldrh r7,[r8,0x8]

strh r3,[r0,0x70]
strh r4,[r0,0x72]
strh r5,[r0,0x74]
strh r6,[r0,0x76]
strh r7,[r0,0x78]
bx r14



ExecuteCharacterSwap_old:
stmfd r13!,{r0-r10,r14}
ldr r0,=0x20FFC58
mov r1,0x10
strb r1,[r0,0x1AA]
ldrb r1,[r0,0x1A8]
cmp r1,0x0
moveq r1,0x1
movne r1,0x0
add r2,r0,0x6E0
strb r1,[r2,0xA]
strb r1,[r0,0x1A8]
mov r0,0x0
moveq r1,0x4
movne r1,0x0
bl 0x204EA38
ldr r0,=0x44000071	;78 in sound room
bl 0x20AA4D4

;bl 0x20497D4

ldmfd r13!,{r0-r10,r15}


ldreq r1,=0x2109980
ldrne r1,=0x2109820
ldr r2,[r0,0xC8]
str r1,[r0,0xC8]

ldr r4,[r2]
ldr r5,[r2,0x4]
mov r3,0x0
str r3,[r2]
str r3,[r2,0x4]
str r4,[r1]
str r5,[r1,0x4]


ldr r3,[r2,0x30]
ldr r4,[r2,0x34]
str r3,[r1,0x30]
str r4,[r1,0x34]

ldr r0,=0x44000071	;78 in sound room
bl 0x20AA4D4

bl 0x20497D4

ldmfd r13!,{r0-r10,r15}
.pool


SwitchCooldownTimer:
ldr r0,=0x20FFC58
ldrb r1,[r0,0x1AA]
cmp r1,0x0
bxle r14
sub r1,r1,0x1
strb r1,[r0,0x1AA]
ldmfd r13!,{r4,r15}
.pool


ForceExtraFreespace:
mov r4,0xB
add r0,r1,r4,lsl 0x2
ldr r4,[r0]
add r4,r4,0x2000
str r4,[r0,0x4]
add r4,r4,0xB000
str r4,[r0,0x8]
mov r0,0x1
ldmfd r13!,{r4,r15}
.pool


CheckAlsoDPadUp:
tst r0,r1
beq 0x2047950
ldr r0,=0x20FFE9C
ldrh r0,[r0]
tst r0,0x40
beq 0x2047950
add r15,r14,0x4
.pool



AlwaysWriteGlyphsToSet1:
stmfd r13!,{r3,r14}
cmp r0,0x3
addls r15,r15,r0, lsl 0x2
ldmfd r13!,{r3,r15}
b _02227f30
b _02227f64
b _02227f98
ldmfd r13!,{r3,r15}
_02227f30:
mov r0,r1
bl 0x2063240
ldr r2,=0x20FFC58
ldrb r2,[r2,0x1A8]
cmp r2,0x1
ldr r2,=0x2100258
ldr r1,=0x20ffc58
strneh r0,[r2,0x68]
mov r2,r0
add r0,r1,0x600
mov r1,0x0	;ldrsb r1,[r0,0xea]
mov r0,0x12
smulbb r1,r1,r0
ldr r0,=0x21002d2
strh r2,[r0,r1]
ldmfd r13!,{r3,r15}
_02227f64:
mov r0,r1
bl 0x2063240
ldr r2,=0x20FFC58
ldrb r2,[r2,0x1A8]
cmp r2,0x1
ldr r2,=0x2100258
ldr r1,=0x20ffc58
strneh r0,[r2,0x6a]
mov r2,r0
add r0,r1,0x600
mov r1,0x0	;ldrsb r1,[r0,0xea]
mov r0,0x12
smulbb r1,r1,r0
ldr r0,=0x21002d4
strh r2,[r0,r1]
ldmfd r13!,{r3,r15}
_02227f98:
mov r0,r1
bl 0x2063240
ldr r2,=0x20FFC58
ldrb r2,[r2,0x1A8]
cmp r2,0x1
ldr r2,=0x2100258
ldr r1,=0x20ffc58
strneh r0,[r2,0x6c]
mov r2,r0
add r0,r1,0x600
mov r1,0x0	;ldrsb r1,[r0,0xea]
mov r0,0x12
smulbb r1,r1,r0
ldr r0,=0x21002d6
strh r2,[r0,r1]
ldmfd r13!,{r3,r15}
.pool



CheckCalculateGlyphUnion:
stmfd r13!,{r14}
ldr r1,=0x20FFC58
ldrb r1,[r1,0x1A8]
cmp r1,0x1
ldmeqfd r13!,{r15}
bl 0x206E984
ldmfd r13!,{r15}
.pool



LoadAlbusModeMenu:
ldrb r0,[r1,0xB3A]
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


.align 0x4
CheckAlbusForDoubleMax:
ldrh r3,[r4]
cmp r3,0x1E
bne SkipDoubleCheck
ldr r3,=0x20FFC58
ldrb r3,[r3,0xB3A]
cmp r3,0x4
moveq r1,r1,lsl 0x1
SkipDoubleCheck:
cmp r0,r1
bx r14
.pool


.close

