.nds
.relativeinclude on
.erroronwarning on

; This contains the entirety of an optimized version of
; the main Hammer shop update code.
; The part of the JP code that played specific voice clips
; for not having enough gold have been re-added in.

; by EgalLau37


.open "ftc/arm9.bin", 0x2000000

.org 0x2037580
.area 0xA74,0x69
HammerShopUpdate:
stmfd r13!,{r4-r11,r14}
sub r13,r13,0x18
mov r9,r0
mov r8,r1
ldr r11,=0x208ac20
ldr r11,[r11]
add r2,r9,0x200
add r7,r9,0xd0
ldr r6,[r7,0xe0]
ldrsh r10,[r2,0x94]
ldrsh r5,[r2,0x92]
bl 0x203852c
mov r4,r0
ldrb r0,[r11,0xa]
cmp r0,0x5
addls r15,r15,r0,lsl 0x2
b _02037fd4
b _020375dc ; 0x0 - transition to sell menu
b _020375dc ; 0x1 - 
b _02037770 ; 0x2 - sell menu screen
b _020377a0 ; 0x3 - buy menu screen
b _02037c50 ; 0x4 - confirm buy dialogue
b _02037f6c ; 0x5 - main menu
_020375dc:
mov r0,r9
bl 0x2042aa4
mov r0,0x1
mov r1,0x0
bl 0x200a8b0
mov r0,r9
bl 0x2036df4
mov r0,0x0
mov r1,0x50
mov r2,0x90
mov r3,0x20
bl 0x2040434
mov r0,0x0
mov r1,0x50
mov r2,0x90
mov r3,0x20
bl 0x20402f0
mov r0,0x0
bl 0x20148c4
cmp r6,0x0
mvnne r0,0x15
strne r0,[r6,0x2c]
mvnne r0,0xf
strne r0,[r6,0x30]
mov r0,r9
mov r1,r8
bl 0x203707c
mov r0,r9
bl 0x2036e38
mov r0,0x1
mov r1,0x0
bl 0x2008f68
mov r0,0x7
mov r1,0x0
bl 0x200b13c
mov r0,0x0
str r0,[r13,0x0]
str r0,[r13,0x4]
mov r0,0x3e4
str r0,[r13,0x8]
mov r0,0x40
mov r1,0x68
mov r2,0x40
mov r3,0x8
bl 0x204278c
mov r0,0x10
str r0,[r13,0x0]
mov r0,0xb
str r0,[r13,0x4]
ldr r1,=0x3ca
str r1,[r13,0x8]
mov r0,0x8
mov r1,0xe
mov r2,0x1
mov r3,0x1
bl 0x20428e4
mov r4,0x0
str r4,[r13,0x0]
str r4,[r13,0x4]
add r2,r11,0x36000
ldr r3,[r2,0xc6c]
str r3,[r13,0x8]
str r4,[r13,0xc]
str r4,[r13,0x10]
mov r0,0x9
mov r1,0xe
mov r2,0x7
mov r3,0x1
bl 0x2009d8c
mov r0,0x1
mov r1,r4
bl 0x200b13c
mov r0,r9
bl 0x2036278
mov r0,r9
bl 0x2036240
str r0,[r9,0x20]
mov r0,r9
bl 0x2036224
str r0,[r9,0x24]
mov r0,0x1
str r0,[r9,0x28]
mov r1,r8
mov r0,r9
bl 0x2035a14
mov r0,r9
bl 0x2042ae0
mov r2,r4
mov r0,r9
mvn r1,0xf
mov r3,r2
bl 0x203604c
ldr r0,=0x208ac20
ldr r1,[r0,0x0]
ldrb r0,[r1,0x8]
cmp r0,0x17
movne r0,0x2
strneb r0,[r1,0xa]
b _02037fd4
_02037770:
mov r0,r9
bl 0x2035fe8
cmp r0,0x0
beq _02037fd4
ldrb r0,[r11,0x8]
cmp r0,0x17
ldrneb r0,[r11,0xa]
addne r0,r0,0x1
strneb r0,[r11,0xa]
b _02037fd4
_020377a0:
mov r0,r9
bl 0x20372e0
add r1,r9,0x200
mov r4,r0
ldrsh r1,[r1,0x92]
mov r0,r9
bl 0x20372b8
mov r6,r0
cmp r4,0x200
beq _020377e8
cmp r4,0x0
bne _02037808
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x200
beq _02037808
_020377e8:
ldrsh r1,[r9,0x92]
cmp r1,0x0
addge r0,r9,0x200
strgeh r1,[r0,0x94]
bge _0203784c
mov r0,0x45
bl 0x2029bf0
b _0203784c
_02037808:
cmp r4,0x100
beq _02037830
cmp r4,0x0
bne _0203784c
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x100
beq _0203784c
_02037830:
ldrsh r1,[r9,0x94]
cmp r1,0x0
addge r0,r9,0x200
strgeh r1,[r0,0x94]
bge _0203784c
mov r0,0x45
bl 0x2029bf0
_0203784c:
add r0,r9,0x200
ldrsh r1,[r0,0x94]
cmp r1,r10
beq _020378bc
ldrsh r2,[r0,0x92]
sub r1,r1,r10
add r1,r2,r1
strh r1,[r0,0x92]
ldrsh r2,[r0,0x92]
cmp r2,0x0
movlt r1,0x0
strlth r1,[r0,0x92]
blt _02037890
ldrsh r1,[r0,0x90]
sub r1,r1,0x1
cmp r2,r1
strgth r1,[r0,0x92]
_02037890:
mov r0,r9
bl 0x2036758
mov r0,r9
bl 0x2036e38
mov r0,r9
bl 0x2036a04
mov r0,r9
bl 0x2036888
mov r0,0x43
bl 0x2029bf0
b _02037c3c
_020378bc:
ldrsh r0,[r0,0x92]
cmp r0,r5
bne _0203796c
ldr r0,[r7,0xf8]
cmp r0,0x0
beq _020378fc
cmp r4,0x20
beq _0203796c
cmp r4,0x0
bne _020378fc
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x20
bne _0203796c
_020378fc:
ldr r0,[r7,0xfc]
cmp r0,0x0
beq _02037930
cmp r4,0x10
beq _0203796c
cmp r4,0x0
bne _02037930
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x10
bne _0203796c
_02037930:
add r0,r11,0x9000
ldr r1,[r0,0xbb0]
tst r1,0x40
addne r0,r9,0x200
ldrnesh r1,[r0,0x92]
subne r1,r1,0x1
strneh r1,[r0,0x92]
bne _0203796c
tst r1,0x80
addne r0,r9,0x200
ldrnesh r1,[r0,0x92]
addne r1,r1,0x1
strneh r1,[r0,0x92]
_0203796c:
add r1,r9,0x200
ldrsh r2,[r1,0x92]
cmp r2,r5
beq _02037a28
cmp r2,0x0
blt _02037994
ldrsh r0,[r1,0x90]
sub r0,r0,0x1
cmp r2,r0
ble _020379a8
_02037994:
strh r5,[r1,0x92]
mov r0,0x45
add r1,r9,0x200
bl 0x2029bf0
b _02037a28
_020379a8:
ldrsh r0,[r1,0x94]
cmp r2,r0
bge _020379c4
mov r0,r9
strh r2,[r1,0x94]
bl 0x2036e38
b _020379e0
_020379c4:
add r0,r0,0x4
cmp r2,r0
blt _020379e0
sub r2,r2,0x3
mov r0,r9
strh r2,[r1,0x94]
bl 0x2036e38
_020379e0:
mov r0,r9
bl 0x2036758
mov r0,r9
mov r1,r5
bl 0x2036a38
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
bl 0x2036a38
mov r0,r9
bl 0x2036888
mov r0,0x43
bl 0x2029bf0
mov r0,r9
add r1,r9,0x200
ldrsh r1,[r1,0x92]
bl 0x20372b8
mov r6,r0
_02037a28:
ldr r0,[r7,0xf8]
cmp r0,0x0
beq _02037a98
cmp r4,0x20
beq _02037a5c
cmp r4,0x0
bne _02037a98
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x20
beq _02037a98
_02037a5c:
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
sub r2,r6,0x1
bl 0x2037270
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
sub r2,r6,0x1
bl 0x2036ccc
mov r0,r9
bl 0x2036758
mov r0,0x43
bl 0x2029bf0
b _02037c3c
_02037a98:
ldr r0,[r7,0xfc]
cmp r0,0x0
beq _02037b08
cmp r4,0x10
beq _02037acc
cmp r4,0x0
bne _02037b08
add r0,r11,0x9000
ldr r0,[r0,0xbb0]
tst r0,0x10
beq _02037b08
_02037acc:
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
add r2,r6,0x1
bl 0x2037270
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
add r2,r6,0x1
bl 0x2036ccc
mov r0,r9
bl 0x2036758
mov r0,0x43
bl 0x2029bf0
b _02037c3c
_02037b08:
cmp r4,0x1
beq _02037b30
cmp r4,0x0
bne _02037be0
add r0,r11,0x9000
ldr r0,[r0,0xbac]
tst r0,0x1
beq _02037be0
_02037b30:
cmp r8,0x0
beq _02037b48
add r0,r9,0x200
ldrsh r0,[r0,0x90]
cmp r0,0x0
bne _02037b78
_02037b48:
cmp r8,0x0
bne _02037ba4
ldr r0,[r7,0xf0]
cmp r0,0x9
beq _02037ba4
add r0,r11,0x36000
ldr r0,[r0,0xc6c]
ldr r1,[r7,0xf4]
cmp r0,r1
blo _02037ba4
_02037b78:
mov r0,r9
bl 0x2036404
mov r0,0x42
bl 0x2029bf0
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x4
strneb r0,[r11,0xa]
b _02037c3c
_02037ba4:
cmp r8,0x0
bne _02037bd4
add r0,r11,0x36000
ldr r0,[r0,0xc6c]
ldr r1,[r7,0xf4]
cmp r0,r1
bhs _02037bd4
;mov r0,0x45
;bl 0x2029bf0
;b _02037c3c
;copied from JP code:
ldr r0,=0x186a0	;if item costs more than 100,000
cmp r1,r0
bge _0x2037c88
mov r0,r9
ldr r1,=0x50c9
bl SubmitVoiceClip	;0x20357b0
b _02037c3c	;_0x2037d00
_0x2037c88:
mov r0,r9
ldr r1,=0x5106
bl SubmitVoiceClip	;0x20357b0
b _02037c3c	;_0x2037d00
;end of JP code
_02037bd4:
mov r0,0x45
bl 0x2029bf0
b _02037c3c
_02037be0:
cmp r4,0x2
beq _02037c08
cmp r4,0x0
bne _02037c3c
add r0,r11,0x9000
ldr r0,[r0,0xbac]
tst r0,0x2
beq _02037c3c
_02037c08:
mov r0,r9
mov r1,0x0
mvn r2,0xf
mov r3,0x0
bl 0x203604c
mov r0,0x44
bl 0x2029bf0
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x5
strneb r0,[r11,0xa]
_02037c3c:
mov r0,r9
bl 0x20365d4
mov r0,r9
bl 0x203571c
b _02037fd4
_02037c50:
ldr r0,[r7,0x50]
bl 0x20405d0
ldr r0,[r7,0x50]
bl 0x20405c0
cmp r0,0x0
beq _02037c7c
cmp r0,0x1
beq _02037efc
cmp r0,0x2
beq _02037efc
b _02037f14
_02037c7c:
cmp r8,0x0
beq _02037dd8
ldr r0,[r7,0xf4]
bl 0x21e76d4
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
bl 0x20372b8
mov r3,r0
add r1,r9,0x200
ldr r2,[r7,0xf0]
ldrsh r0,[r1,0x96]
sub r1,r2,r3
bl 0x21e78bc
add r0,r9,0x200
ldrsh r0,[r0,0x96]
bl 0x21e7998
cmp r0,0x0
bne _02037da4
add r0,r9,0x200
ldrsh r1,[r0,0x96]
mov r0,r9
mov r2,0x0
bl 0x2035770
add r6,r9,0x200
ldrsh r0,[r6,0x90]
sub r0,r0,0x1
strh r0,[r6,0x90]
ldrsh r2,[r6,0x90]
cmp r2,0x0
beq _02037d80
ldrsh r5,[r6,0x92]
cmp r5,r2
bge _02037d3c
_02037d04:
mov r0,r9
add r1,r5,0x1
bl 0x20372b8
mov r2,r0
mov r0,r9
mov r1,r5
bl 0x2037270
add r1,r5,0x1
ldrb r0,[r4,r1]
strb r0,[r4,r5]
ldrsh r2,[r6,0x90]
mov r5,r1
cmp r1,r2
blt _02037d04
_02037d3c:
add r0,r9,0x200
ldrsh r1,[r0,0x92]
cmp r1,r2
subeq r1,r2,0x1
streqh r1,[r0,0x92]
add r0,r9,0x200
ldrsh r2,[r0,0x92]
ldrsh r1,[r0,0x94]
cmp r2,r1
bge _02037d88
sub r1,r2,0x3
strh r1,[r0,0x94]
ldrsh r1,[r0,0x94]
cmp r1,0x0
movlt r1,0x0
strlth r1,[r0,0x94]
b _02037d88
_02037d80:
mov r0,0x0
strh r0,[r6,0x92]
_02037d88:
mov r0,r9
bl 0x2036758
mov r0,r9
bl 0x2036888
mov r0,r9
bl 0x2036a04
b _02037ed8
_02037da4:
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
mov r2,0x1
bl 0x2037270
mov r0,r9
bl 0x2036758
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
mov r2,0x1
bl 0x2036ccc
b _02037ed8
_02037dd8:
ldr r0,[r7,0xf4]
rsb r0,r0,0x0
bl 0x21e76d4
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
bl 0x20372b8
mov r3,r0
add r1,r9,0x200
ldr r2,[r7,0xf0]
ldrsh r0,[r1,0x96]
add r1,r2,r3
bl 0x21e78bc
add r0,r9,0x200
ldrsh r1,[r0,0x92]
mov r0,r9
mov r2,0x1
bl 0x2037270
mov r0,r9
bl 0x2036758
mov r0,r9
add r1,r9,0x200
ldrsh r1,[r1,0x92]
mov r2,0x1
bl 0x2036ccc
add r0,r9,0x200
ldrsh r0,[r0,0x96]
cmp r0,0x2c
bne _02037e70
add r0,r11,0x36000
ldr r1,[r0,0x84c]
tst r1,0x1
bne _02037e70
orr r1,r1,0x1
str r1,[r0,0x84c]
bl 0x2022000
_02037e70:
add r0,r9,0x200
ldrsh r0,[r0,0x96]
cmp r0,0x2d
bne _02037ea4
add r0,r11,0x36000
ldr r1,[r0,0x84c]
tst r1,0x4
bne _02037ea4
orr r1,r1,0x4
str r1,[r0,0x84c]
bl 0x2022000
_02037ea4:
add r0,r9,0x200
ldrsh r0,[r0,0x96]
cmp r0,0x2e
bne _02037ed8
add r0,r11,0x36000
ldr r1,[r0,0x84c]
tst r1,0x8
bne _02037ed8
orr r1,r1,0x8
str r1,[r0,0x84c]
bl 0x2022000
_02037ed8:
mov r0,r9
bl 0x2036278
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x3
strneb r0,[r11,0xa]
b _02037f14
_02037efc:
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x3
strneb r0,[r11,0xa]
_02037f14:
mov r0,r9
bl 0x203571c
ldrb r0,[r11,0xa]
cmp r0,0x3
bne _02037fd4
ldr r0,[r7,0x50]
bl 0x2040544
mov r0,0x0
str r0,[r7,0x50]
add r0,r9,0x200
ldrsh r1,[r0,0x90]
cmp r1,0x0
beq _02037f60
ldrsh r1,[r0,0x92]
mov r0,r9
bl 0x2036a38
b _02037fd4
_02037f60:
mov r0,r9
bl 0x20363bc
b _02037fd4
_02037f6c:
mov r0,r9
bl 0x2035fe8
cmp r0,0x0
beq _02037fd4
mov r0,r9
bl 0x2036540
cmp r8,0x0
movne r2,0x1
moveq r2,0x0
add r0,r9,0x200
strh r2,[r0,0x92]
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x1
strneb r0,[r11,0x9]
movne r1,0x0
strneb r1,[r11,0xa]
ldrb r0,[r11,0x8]
cmp r0,0x17
movne r0,0x1
strneb r0,[r11,0xa]
_02037fd4:
mov r0,r9
bl 0x2035940
mvn r0,0x0
add r13,r13,0x18
ldmfd r13!,{r4-r11,r15}
.pool

SubmitVoiceClip:
mov r0,r1
b 0x2029BF0

.endarea
;arm_func_end 0x2037580

.close

