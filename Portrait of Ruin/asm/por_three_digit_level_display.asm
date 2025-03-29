.nds
.relativeinclude on
.erroronwarning on

; by default, all level displays are only coded to display two digits.
; the top-screen and pause menu level displays start displaying
; other graphics if the tens value exceeds 9.
; this allows most level displays to display up to three digits.
; (file select screen still work-in-progress)
; this also increases certain hardcoded level cap checks from 99 to 255.

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000
.org 0x2054DDC
mov r7,0x0
mov r1,0x30
str r1,[r6,0x60]
mov r12,r2
bl TopScreen_multidigit
TopScreen_multidigit_return:
ldr r0,[r6,0x54]
strh r4,[r0,0x20]
mov r0,r5
ldmfd r13!,{r4-r6,r15}

.org 0x203D724
mov r8,0x8C
.org 0x203D7AC
add r8,0x6
.org 0x203D73C
cmp r9,0x3
b Multidigit_display_pause
.org 0x203D7A8
cmp r9,0x3

.close


.open "ftc/overlay9_0", 0x21CDF60
.org 0x21FD87C
mov r0,0xD8000	;Lv. x-coord
.org 0x21FD8E0
add r1,r1,0x20000	;Level offset from Lv.
.org 0x21FD948	;digit max, bottom-screen level
cmp r7,0x3


.org 0x22078CC	;forced max level for EXP display
cmp r1,0xFF	;0x64

.org 0x21FC808	;removes a check that sets level cap to 99 if greater than 99
cmp r3,0x0
moveq r0,0x63
streqb r0,[r2,0xCEB]
ldrb r0,[r2,0xCE1]
cmp r0,0xFF
addeq r13,r13,0xC
ldmeqfd r13!,{r4-r7,r15}
b 0x21FC850
.close



.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x1E00	;ends ~???
TopScreen_multidigit:;if r9 is used instead of r12, some GUI elements adopt palette of last attacked enemy
level_multidigit_loop:
ldr     r2,=0x66666667
ldr     r3,=0xA
smull   r0,r1,r2,r12
mov     r1,r1,asr 0x2
mov     r0,r12,lsr 0x1F
add     r1,r0,r1
smull   r0,r1,r3,r1
sub     r1,r12,r0
ldr     r0,[r6,0x54]
strh    r1,[r0,0x1C]
ldrb     r1,[r6,0x60]
mov     r2,0x40
mov     r3,0x1
strb r12,[r6,0x50]
bl      0x2016854
ldrb r1,[r6,0x50]
ldr     r2,=0x66666667
smull   r0,r12,r2,r1
mov     r12,r12,asr 0x2
mov     r0,r1,lsr 0x1F
add     r12,r0,r12
ldrb     r1,[r6,0x60]
sub r1,0x8
strb     r1,[r6,0x60]
add     r7,r7,0x1
cmp     r7,0x3
blt     level_multidigit_loop
b TopScreen_multidigit_return


Multidigit_display_pause:
addls r15,r15,r9,lsl 0x2
b 0x203D7B4
b Pause_HundredsDigit
b Pause_TensDigit
b 0x203D744

Pause_HundredsDigit:
ldr r0,[r5]
ldrsh r3,[r0,r11]
ldrsh r0,[r0,r11]
smull   r2,r1,r4,r0
mov     r1,r1,asr 0x2
mov     r2,r3,lsr 0x1F
add     r0,r2,r1
mov r3,r0
smull   r2,r1,r4,r0
mov     r1,r1,asr 0x2
mov     r2,r3,lsr 0x1F
add     r3,r2,r1

smull   r2,r1,r4,r3
mov     r1,r1,asr 0x2
mov     r2,r3,lsr 0x1F
add r1,r2,r1
ldr r2,=0xA
smull r0,r1,r2,r1
sub r1,r3,r0
b 0x203D784

Pause_TensDigit:
ldr r0,[r5]
ldrsh r3,[r0,r11]
ldrsh r0,[r0,r11]
smull   r2,r1,r4,r0
mov     r1,r1,asr 0x2
mov     r2,r3,lsr 0x1F
add     r3,r2,r1

smull   r2,r1,r4,r3
mov     r1,r1,asr 0x2
mov     r2,r3,lsr 0x1F
add r1,r2,r1
ldr r2,=0xA
smull r0,r1,r2,r1
sub r1,r3,r0
b 0x203D784
.pool

.close



