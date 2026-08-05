.nds
.relativeinclude on
.erroronwarning on

; This is an optimized copy of the code for the Use Item
; screen that restores some of Soma's voice clips which were
; removed from the US version.
; (The developers actually kept the SFX IDs in but overwrote the
; line for submitting the voice clip with the ID for the generic
; item select SFX. This patch could probably have technically
; just been one line, but the whole of the routine has been
; included.)
; Likely incompatible with the magical ticket ASM but can
; be tweaked to include it.

; by EgalLau37

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21eeb4c
.area 0x880,0x69
func_ov000_021eeb4c:
UseItemScreen_Update:
stmfd r13!,{r4-r11,r14}
mov r9,r0
bl 0x21ee258
mov r8,r0
ldr r11,=0x208ac20
ldr r11,[r11,0x0]
mvn r10,0x0
add r1,r9,0x200
ldrsh r5,[r1,0x92]
ldrsh r4,[r1,0x94]
ldr r3,[r9,0x124]
add r6,r3,0xd0
ldrb r0,[r11,0xa]
cmp r0,0x3
addls r15,r15,r0,lsl 0x2
b _021ef3a8
b _021eeb9c ; case 0
b _021eebd0 ; case 1
b _021eebf8 ; case 2
b _021ef380 ; case 3
_021eeb9c:
mov r0,r9
mov r1,r8
bl 0x21ee2c0
mvn r0,0xf
mov r1,0x0
mov r2,0x8
bl 0x20080dc
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x1
strneb r0,[r11,0xa]
_021eebd0:
bl 0x200806c
cmp r0,0x0
bne _021ef3a8
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x2
strneb r0,[r11,0xa]
b _021ef3a8
_021eebf8:
mov r0,r9
bl 0x21ede04
mov r7,r0
cmp r7,0x200
beq _021eec2c
cmp r7,0x0
bne _021eec4c
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x200
beq _021eec4c
_021eec2c:
ldrsh r1,[r9,0x92]
cmp r1,0x0
addge r0,r9,0x200
strgeh r1,[r0,0x94]
bge _021eece8
mov r0,0x45
bl 0x2029bf0
b _021eece8
_021eec4c:
cmp r7,0x100
beq _021eec74
cmp r7,0x0
bne _021eec94
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x100
beq _021eec94
_021eec74:
ldrsh r1,[r9,0x94]
cmp r1,0x0
addge r0,r9,0x200
strgeh r1,[r0,0x94]
bge _021eece8
mov r0,0x45
bl 0x2029bf0
b _021eece8
_021eec94:
add r0,r11,0x9000
ldr r1,[r0,0xbb0]
tst r1,0x30
addne r0,r9,0x200
ldrnesh r1,[r0,0x92]
eorne r1,r1,0x1
strneh r1,[r0,0x92]
bne _021eece8
tst r1,0x40
addne r0,r9,0x200
ldrnesh r1,[r0,0x92]
subne r1,r1,0x2
strneh r1,[r0,0x92]
bne _021eece8
tst r1,0x80
addne r0,r9,0x200
ldrnesh r1,[r0,0x92]
addne r1,r1,0x2
strneh r1,[r0,0x92]
_021eece8:
add r1,r9,0x200
ldrsh r0,[r1,0x92]
cmp r0,r5
bne _021eed04
ldrsh r1,[r1,0x94]
cmp r1,r4
beq _021eee8c
_021eed04:
add r1,r9,0x200
ldrsh r3,[r1,0x94]
cmp r3,r4
beq _021eed64
cmp r0,r3
blt _021eed28
add r1,r3,0x8
cmp r0,r1
blt _021eed3c
_021eed28:
add r0,r9,0x200
ldrsh r2,[r0,0x92]
sub r1,r3,r4
add r1,r2,r1
strh r1,[r0,0x92]
_021eed3c:
add r0,r9,0x200
ldrsh r3,[r0,0x94]
ldrsh r2,[r0,0x92]
cmp r2,r3
strlth r3,[r0,0x92]
blt _021eed64
add r1,r3,0x8
cmp r2,r1
addge r1,r3,0x7
strgeh r1,[r0,0x92]
_021eed64:
add r0,r9,0x200
ldrsh r1,[r0,0x92]
cmp r1,0x0
strlth r5,[r0,0x92]
add r0,r9,0x200
ldrsh r2,[r0,0x90]
ldrsh r1,[r0,0x92]
cmp r1,r2
subge r1,r2,0x1
strgeh r1,[r0,0x92]
add r1,r9,0x200
ldrsh r0,[r1,0x92]
cmp r0,r5
bne _021eeda8
ldrsh r1,[r1,0x94]
cmp r1,r4
beq _021eee84
_021eeda8:
add r2,r9,0x200
ldrsh r1,[r2,0x94]
cmp r0,r1
bge _021eedd8
add r3,r9,0x294
_021eedbc:
ldrsh r0,[r3,0x0]
sub r0,r0,0x2
strh r0,[r3,0x0]
ldrsh r1,[r2,0x94]
ldrsh r0,[r2,0x92]
cmp r0,r1
blt _021eedbc
_021eedd8:
add r2,r1,0x8
cmp r0,r2
blt _021eee0c
add r0,r9,0x294
add r2,r9,0x200
_021eedec:
ldrsh r1,[r0,0x0]
add r1,r1,0x2
strh r1,[r0,0x0]
ldrsh r1,[r2,0x94]
ldrsh r8,[r2,0x92]
add r3,r1,0x8
cmp r8,r3
bge _021eedec
_021eee0c:
cmp r1,r4
beq _021eee3c
mov r4,0x0
add r5,r9,0x200
_021eee1c:
ldrsh r1,[r5,0x94]
mov r0,r9
add r1,r1,r4
bl 0x21ee4dc
add r4,r4,0x1
cmp r4,0x8
blt _021eee1c
b _021eee58
_021eee3c:
mov r0,r9
mov r1,r5
bl 0x21ee4dc
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
bl 0x21ee4dc
_021eee58:
mov r0,r9
bl 0x21ee324
mov r0,r9
bl 0x21ee258
mov r8,r0
mov r0,r9
mov r1,r8
bl 0x21ee2c0
mov r0,0x43
bl 0x2029bf0
b _021eee8c
_021eee84:
mov r0,0x45
bl 0x2029bf0
_021eee8c:
cmp r7,0x1
beq _021eeeb4
cmp r7,0x0
bne _021ef26c
add r0,r11,0x9000
ldr r0,[r0,0xbac]
tst r0,0x1
beq _021ef26c
_021eeeb4:
add r0,r9,0x200
ldrsh r0,[r0,0x96]
cmp r0,0xfe
bne _021eeed0
mov r0,0x45
bl 0x2029bf0
b _021ef324
_021eeed0:
mvn r4,0x0
ldrb r2,[r8,0x8]
add r1,r11,0x36c00
ldrsh r1,[r1,0x3c]
cmp r1,0xb
bne _021eeef8
cmp r2,0x3
moveq r2,0x0
_021eeef8:
cmp r2,0x4
addls r15,r15,r2,lsl 0x2
b _021ef0f8
b _021eef18 ; case 0
b _021eefc0 ; case 1
b _021ef018 ; case 2
b _021ef0a4 ; case 3
b _021ef0f8 ; case 4
_021eef18:
add r1,r11,0x36c00
ldrsh r3,[r1,0x30]
ldrsh r1,[r1,0x32]
cmp r3,r1
bge _021ef0f8
add r0,r11,0x36c00
ldrsh r3,[r0,0x30]
ldrh r1,[r8,0xa]
add r1,r3,r1
strh r1,[r0,0x30]
add r0,r11,0x36c00
ldrsh r2,[r0,0x32]
ldrsh r1,[r0,0x30]
cmp r1,r2
strgth r2,[r0,0x30]
add r0,r9,0x200
ldrsh r0,[r0,0x96]
cmp r0,0x0
beq _021eef80
cmp r0,0x1
beq _021eef80
cmp r0,0x2
bne _021eef88
_021eef80:
mov r4,0x42
b _021eefb4
_021eef88:
ldrh r1,[r8,0xa]
ldr r0,=0x122
cmp r1,r0
blo _021eefb0
mov r0,0x2
bl 0x2012d38
cmp r0,0x0
ldrne r4,=0x5102
ldreq r4,=0x5103
b _021eefb4
_021eefb0:
mov r4,0x42
_021eefb4:
mov r0,r9
bl 0x21ee044
b _021ef0f8
_021eefc0:
add r1,r11,0x36c00
ldrsh r3,[r1,0x34]
ldrsh r1,[r1,0x36]
cmp r3,r1
bge _021ef0f8
mov r4,0x42
add r0,r11,0x36c00
ldrsh r3,[r0,0x34]
ldrh r1,[r8,0xa]
add r1,r3,r1
strh r1,[r0,0x34]
add r0,r11,0x36c00
ldrsh r2,[r0,0x36]
ldrsh r1,[r0,0x34]
cmp r1,r2
strgth r2,[r0,0x34]
mov r0,r9
bl 0x21edfac
b _021ef0f8
_021ef018:
ldrh r2,[r8,0xa]
mvn r1,0x0
cmp r2,0x1
beq _021ef03c
cmp r2,0x2
beq _021ef054
cmp r2,0x4
beq _021ef06c
b _021ef080
_021ef03c:
add r0,r11,0x36c00
ldrh r0,[r0,0x70]
tst r0,0x1
movne r4,0x42
movne r1,0x0
b _021ef080
_021ef054:
add r0,r11,0x36c00
ldrh r0,[r0,0x70]
tst r0,0x2
movne r4,0x42
movne r1,0x1
b _021ef080
_021ef06c:
add r0,r11,0x36c00
ldrh r0,[r0,0x70]
tst r0,0x4
movne r4,0x42
movne r1,0x2
_021ef080:
cmp r1,0x0
blt _021ef0f8
mov r0,0x1
mov r0,r0,lsl r1
bl 0x220026c
mov r0,r9
bl 0x21edf2c
bl 0x21ffca4
b _021ef0f8
_021ef0a4:
add r0,r11,0x36c00
ldrsh r3,[r0,0x30]
cmp r3,0x1
ble _021ef0f8
ldrh r2,[r8,0xa]
sub r2,r3,r2
strh r2,[r0,0x30]
add r0,r11,0x36c00
ldrsh r1,[r0,0x30]
cmp r1,0x1
movlt r1,0x1
strlth r1,[r0,0x30]
mov r0,0x2
bl 0x2012d38
cmp r0,0x0
ldrne r4,=0x50e2
ldreq r4,=0x50e3
mov r0,r9
bl 0x21ee044
_021ef0f8:
cmp r4,0x0
blt _021ef260
mov r0,r4	;mov r0,0x42
bl 0x2029bf0
add r1,r9,0x200
ldrsh r2,[r1,0x92]
mov r2,r2,lsl 0x1
add r3,r2,0x1
ldrb r2,[r6,r3]
sub r2,r2,0x1
strb r2,[r6,r3]
ldrsh r2,[r1,0x92]
ldrsh r1,[r1,0x96]
mov r2,r2,lsl 0x1
add r2,r2,0x1
ldrb r2,[r6,r2]
mov r0,0x2
bl 0x21e78f0
add r4,r9,0x200
ldrsh r1,[r4,0x92]
mov r2,r1,lsl 0x1
add r0,r2,0x1
ldrb r3,[r6,r0]
cmp r3,0x0
beq _021ef170
ldrb r2,[r6,r2]
add r2,r2,0xc
mov r0,r9
bl 0x21ee620
b _021ef324
_021ef170:
ldrsh r3,[r4,0x90]
sub r3,r3,0x1
cmp r1,r3
bge _021ef1b4
_021ef180:
add r1,r1,0x1
ldrb r5,[r6,r1,lsl 0x1]
mov r3,r1,lsl 0x1
add r3,r3,0x1
strb r5,[r6,r2]
ldrb r3,[r6,r3]
add r2,r2,0x2
strb r3,[r6,r0]
ldrsh r3,[r4,0x90]
add r0,r0,0x2
sub r3,r3,0x1
cmp r1,r3
blt _021ef180
_021ef1b4:
add r0,r9,0x200
ldrsh r1,[r0,0x90]
add r2,r9,0x290
sub r1,r1,0x1
strh r1,[r0,0x90]
ldrsh r0,[r0,0x90]
cmp r0,0x0
bne _021ef1f0
mov r0,0xfe
strb r0,[r6,0x0]
mov r0,0xff
strb r0,[r6,0x1]
ldrsh r0,[r2,0x0]
add r0,r0,0x1
strh r0,[r2,0x0]
_021ef1f0:
add r0,r9,0x200
ldrsh r2,[r0,0x90]
ldrsh r1,[r0,0x92]
add r5,r9,0x200
sub r2,r2,0x1
cmp r1,r2
strgth r2,[r0,0x92]
ldrsh r0,[r5,0x94]
ldrsh r4,[r5,0x92]
add r0,r0,0x8
cmp r4,r0
bge _021ef240
_021ef220:
mov r0,r9
mov r1,r4
bl 0x21ee4dc
ldrsh r0,[r5,0x94]
add r0,r0,0x8
add r4,r4,0x1
cmp r4,r0
blt _021ef220
_021ef240:
mov r0,r9
bl 0x21ee324
mov r0,r9
bl 0x21ee258
mov r1,r0
mov r0,r9
bl 0x21ee2c0
b _021ef324
_021ef260:
mov r0,0x45
bl 0x2029bf0
b _021ef324
_021ef26c:
cmp r7,0x0
bne _021ef2c4
add r0,r11,0x9000
ldr r0,[r0,0xbac]
tst r0,0x8
beq _021ef2c4
mov r0,0x44
bl 0x2029bf0
mov r0,0x0
mvn r1,0xf
mov r2,0x8
bl 0x20080dc
mov r2,0x3
strb r2,[r9,0xd]
ldrb r0,[r11,0x8]
cmp r0,0x17
strneb r2,[r11,0xa]
b _021ef324
_021ef2c4:
cmp r7,0x2
beq _021ef2ec
cmp r7,0x0
bne _021ef324
add r0,r11,0x9000
ldr r0,[r0,0xbac]
tst r0,0x2
beq _021ef324
_021ef2ec:
mov r0,0x44
bl 0x2029bf0
mov r0,0x0
mvn r1,0xf
mov r2,0x8
bl 0x20080dc
mov r1,0x0
strb r1,[r9,0xd]
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x3
strneb r0,[r11,0xa]
_021ef324:
mov r0,r9
bl 0x21ee39c
ldr r1,[r9,0x20]
cmp r1,r0
addne r0,r1,r0
movne r0,r0,asr 0x1
strne r0,[r9,0x20]
mov r0,r9
bl 0x21ee37c
ldr r1,[r9,0x24]
cmp r1,r0
addne r0,r1,r0
movne r0,r0,asr 0x1
strne r0,[r9,0x24]
mov r0,r9
bl 0x2029158
mov r0,r9
mov r1,0x0
mov r2,0x1
bl 0x202906c
mov r0,r9
bl 0x21ee3b8
b _021ef3a8
_021ef380:
bl 0x200806c
cmp r0,0x0
bne _021ef3a8
mov r0,r9
bl 0x21ee290
mov r0,r9
bl 0x21ee828
ldrb r0,[r9,0xd]
cmp r0,0x0
subne r10,r0,0x1
_021ef3a8:
mov r0,r10
ldmfd r13!,{r4-r11,r15}
.pool
.endarea
;arm_func_end 0x21eeb4c


.close

