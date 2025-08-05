.nds
.relativeinclude on
.erroronwarning on

; This patch adds an additional line to the top-screen and bestiary
; informational displays that shows how many attribute points (AP)
; are gained by defeating an enemy.
; Since there is no text for "AP" by default, the text for "MP"
; was used.  Either the text should be changed to say MP or the
; asm "TextUseLiteralPointer.asm" should be used to add an additional
; text table with a new text string for AP.
; This ASM comes with two additional files:
; "bestiary_texts.bin" and "topScreen_texts.bin"
; These need to be manually written to the correct overlay
; files to function correctly.
; Either search "Paste-write" and paste-write the contents over the
; message or go to the respective addresses and paste-write.
; "bestiary_texts.bin" goes in overlay 22 at 0x8D9B8.
; "topScreen_texts.bin" goes in overlay 86 at 0x2FE4.

; by EgalLau37


EnemyDataTable	equ	0x20B6364
MaximumBestiarySize	equ	0x78

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2F00


.open "ftc/arm9.bin", 0x2000000

.org 0x20AF024
ldr r7,=TopScreenTextData
.org 0x20AFA34
.pool
.org 0x20AF03C
cmp r8,0x2F
.org 0x20AF050
b TopScreenText_01
.org 0x20AF104
b TopScreenText_2E
b TopScreenText_2F
mov r3,r3
.org 0x20AF4B0	;end loop
cmp r8,0x30
.org 0x20AF3E4
bl CheckHPEXPAP
mov r3,r3

.org 0x20AFDBC
ldr r6,=TopScreenTextData
.org 0x20AFE38
.pool
.org 0x20AFDF0	;initial draw
cmp r7,0x30

.org 0x20AF368
bl CheckHPEXPAP
mov r3,r3

.close


/*
24 - HP
28 - HP value?
26 - EXP
2A - EXP value?
2E - AP
2F - AP value
*/

.open "ftc/overlay9_22", 0x2223E00


.org 0x22B5200
.dw BestiaryTextsData;0x22B17B8	;0x22B17B8
.dw 0x1B	;0x19

.org 0x22B17B8
;.ascii "Paste-write 'bestiary_texts.bin' on top of this text. ~EgalLau37"
;.fill 0x3F0,0x0
;.import "bestiary_texts.bin"

.org 0x222AFB0
bl LoadEnemyAPDisplay
.dw 0xE59F126C

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

LoadEnemyAPDisplay:
cmp r6,0x0
movlt r0,0x0
ldrgeb r0,[r9,0xD]
mov r3,0x1B
mov r0,r0,lsl 0x10
mov r1,r0,lsr 0x10
ldr r2,[r8,0x6EC]
mov r0,0x1
tst r2,r0,lsl r4
mov r2,0x0
beq APNotDiscovered
mla r0,r3,r7,r5
mov r3,r2
str r2,[r13]
bl 0x2088C44
b APDisplayComplete
APNotDiscovered:
mla r0,r3,r7,r5
ldr r1,=0x401
mov r3,r2
bl 0x2088B88
APDisplayComplete:
ldr r0,[r13,0x4]
b 0x222AFB4
.pool


TopScreenText_01:
bl 0x2087C58
mov r1,r0
b 0x20AF344

TopScreenText_2E:
b 0x20AF4A8
TopScreenText_2F:
bl RetrieveEnemyAP;0x2087FCC
mov r1,r0
ldr r0,[r13,0x10]
ldr r2,[r0,0x6EC]
mov r0,0x1
tst r2,r0,lsl r11
ldreq r1,[r13,0x14]
cmp r6,MaximumBestiarySize+1
movge r9,0x1
movlt r9,0x0
b 0x20AF344

RetrieveEnemyAP:
stmfd r13!,{r3,r14}
bl 0x2087FA0
cmp r0,MaximumBestiarySize+1
mvnge r0,0x0
ldmgefd r13!,{r3,r15}
cmp r0,0x0
movlt r0,0x0
ldmltfd r13!,{r3,r15}
mov r1,0x24
mul r1,r0,r1
ldr r0,=EnemyDataTable
add r0,r0,0xD
ldrb r0,[r0,r1]
ldmfd r13!,{r3,r15}
.pool

CheckHPEXPAP:
cmp r8,0x28
cmpne r8,0x2A
cmpne r8,0x2F
bx r14

TopScreenTextData:
.fill 0xAC0,0x0
.org TopScreenTextData
.ascii "Paste-write 'topScreen_texts.bin' on top of this text. ~EgalLau37"
;.import "topScreen_texts.bin"
.org TopScreenTextData+0x6C0
BestiaryTextsData:
.ascii "Paste-write 'bestiary_texts.bin' on top of this text. ~EgalLau37"
;.import "bestiary_texts.bin"

.close

