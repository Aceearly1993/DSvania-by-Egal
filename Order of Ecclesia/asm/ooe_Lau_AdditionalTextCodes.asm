.nds
.relativeinclude on
.erroronwarning on

; AdditionalTextCodes.asm description
; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2680
PortraitLocationAddress	equ	0x20FE200

.open "/ftc/overlay9_22", 0x2223E00

.org 0x2232564
bl CheckNewTextCodes

.org 0x2232CE8
bl CheckNewPortraitLocation
str r0,[r4,0x30]
str r1,[r4,0x34]

.org 0x2232728
b AlsoClearPortraitLocation

.org 0x223266C
b 0x2232774
;b AdjustPortraitAfterLoading
.org 0x2232E58
bl AdjustPortraitAfterLoading_2

.close


.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckNewTextCodes:
cmp r0,0xA
bxle r14
sub r0,r0,0x15
cmp r0,0xB
addls r15,r15,r0,lsl 0x2
b 0x2232568
b TextControlCode_ChangeTextboxPalette		;0xf5
b TextControlCode_ChangeTextboxProperties	;0xf6
b TextControlCode_ChangePortraitLocation	;0xf7
b 0x2232568		;0xf8
b 0x2232568		;0xf9
b 0x2232568		;0xfa
b 0x2232568		;0xfb
b 0x2232568		;0xfc
b 0x2232568		;0xfd
b 0x2232568		;0xfe
b 0x2232568		;0xff

; EB ~ F4 - d-pad buttons

TextControlCode_ChangeTextboxPalette:
ldr r1,=0x2159A30
ldrb r0,[r7,0x1]
strb r0,[r1,0x1C]
ldrh r0,[r5,0x4A]
add r0,r0,0x2
strh r0,[r5,0x4A]
b 0x2232774

TextControlCode_ChangeTextboxProperties:
ldr r1,=0x2159A30
ldrb r0,[r7,0x1]
cmp r0,0xFE
beq SkipPosition
cmp r0,0xFF
moveq r0,0x78
strb r0,[r1,0x14]
SkipPosition:
ldrb r0,[r7,0x2]
cmp r0,0xFE
beq SkipHeight
cmp r0,0xFF
moveq r0,0x72
strb r0,[r1,0x16]
SkipHeight:
ldrh r0,[r5,0x4A]
add r0,r0,0x3
strh r0,[r5,0x4A]
b 0x2232774

TextControlCode_ChangePortraitLocation:
ldr r1,=PortraitLocationAddress
ldrb r0,[r7,0x1]
strb r0,[r1]
ldrb r0,[r7,0x2]
strb r0,[r1,0x1]
ldrb r0,[r7,0x3]
strb r0,[r1,0x2]
ldrb r0,[r7,0x4]
strb r0,[r1,0x3]

ldrb r0,[r7,0x5]
strb r0,[r1,0x4]
ldrb r0,[r7,0x6]
strb r0,[r1,0x5]
ldrb r0,[r7,0x7]
strb r0,[r1,0x6]
ldrb r0,[r7,0x8]
strb r0,[r1,0x7]

ldrb r0,[r7,0x9]
strb r0,[r1,0x8]
ldrb r0,[r7,0xA]
strb r0,[r1,0x9]
ldrb r0,[r7,0xB]
strb r0,[r1,0xA]
ldrb r0,[r7,0xC]
strb r0,[r1,0xB]

ldrh r0,[r5,0x4A]
add r0,r0,0xD
strh r0,[r5,0x4A]
b 0x2232774
.pool


AdjustPortraitAfterLoading:
TextControlCode_AdjustPortraitLocation_actual:
stmfd r13!,{r2-r4}
ldr r0,=0x2D
mov r1,0x160
ldr r2,=0x21092A0
mla r2,r0,r1,r2
ldr r3,=0x2232E9C	;update portrait
mov r4,0x4F
CheckNextEntitySlot:
cmp r4,0x0
ble NoPortraitLoaded
ldr r1,[r2]
cmp r1,r3
sub r4,0x1
addne r2,0x160
bne CheckNextEntitySlot
ldr r1,=PortraitLocationAddress
ldr r0,[r1]
cmp r0,0x0
moveq r0,0xC0000
str r0,[r2,0x30]
SkipPortraitX:
ldr r0,[r1,0x4]
cmp r0,0x0
moveq r0,0x78000
str r0,[r2,0x34]
ldr r0,[r1,0x8]
str r0,[r2,0x74]
NoPortraitLoaded:
ldmfd r13!,{r2-r4}
b 0x2232774


AdjustPortraitAfterLoading_2:
stmfd r13!,{r2-r4,r14}
ldr r0,=0x2D
mov r1,0x160
ldr r2,=0x21092A0
mla r2,r0,r1,r2
ldr r3,=0x2232E9C	;update portrait
mov r4,0x4F
CheckNextEntitySlot_2:
cmp r4,0x0
ble NoPortraitLoaded_2
ldr r1,[r2]
cmp r1,r3
sub r4,0x1
addne r2,0x160
bne CheckNextEntitySlot_2
ldr r1,=PortraitLocationAddress
ldr r0,[r1]
cmp r0,0x0
moveq r0,0xC0000
str r0,[r2,0x30]
SkipPortraitX_2:
ldr r0,[r1,0x4]
cmp r0,0x0
moveq r0,0x78000
str r0,[r2,0x34]
ldr r0,[r1,0x8]
str r0,[r2,0x74]
NoPortraitLoaded_2:
mov r0,r2
ldr r1,[r2,0x4]
bl 0x2232F78;blx r1
mov r0,0x1
ldmfd r13!,{r2-r4,r15}

.pool


CheckNewPortraitLocation:
ldr r1,=PortraitLocationAddress
ldr r0,[r1,0x8]
str r0,[r4,0x74]
ldr r0,[r1]
cmp r0,0x0
moveq r0,0xC0000
ldr r1,[r1,0x4]
cmp r1,0x0
moveq r1,0x78000
bx r14

AlsoClearPortraitLocation:
mov r0,0x0
ldr r1,=PortraitLocationAddress
str r0,[r1]
str r0,[r1,0x4]
str r0,[r1,0x8]
b 0x2232774




.pool


.close


