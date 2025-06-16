.nds
.relativeinclude on
.erroronwarning on

; pressing R in Julius mode toggles the currently equipped subweapon.
; this adds a check to scroll through the list backwards instead if up
; on the D-pad is held.

; by EgalLau37

@Overlay41Start equ 0x02308920

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21FC524
b CheckToggleBackwards

.org 0x21FC548
bl CheckSubweaponBoundsExtended
mov r3,r3

.close



.open "ftc/overlay9_41", @Overlay41Start

.org @Overlay41Start+0x2100
CheckToggleBackwards:
stmfd r13!,{r0-r2}
ldr r1,=0x208AC20
ldr r2,[r1]
ldr r0,=0x36A48
add r1,r2,r0
ldrh r0,[r1]
ldrh r1,[r1,0x2]
add r2,r2,0x9000
ldr r2,[r2,0xBBC]
ands r0,r2,0x40
ldmfd r13!,{r0-r2}
addeq r1,r1,0x1
subne r1,r1,0x1
b 0x21FC528

CheckSubweaponBoundsExtended:
movge r1,0x0
strgeb r1,[r3]
cmp r2,0x0
sublt r1,r1,0x1
strltb r1,[r3]
bx r14

.pool

.close


