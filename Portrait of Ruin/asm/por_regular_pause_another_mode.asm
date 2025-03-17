.nds
.relativeinclude on
.erroronwarning on

; allows regular pause while in other modes
; disables Equip, Talk, partner0, partner1 options in other modes
; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

.org 0x2052588	;allows standard pause menu
mov r0,0x0

.org 0x203D0DC
b CheckPauseOption_Equip

.org 0x2034E34
b CheckPauseOption_Talk

.org 0x2034E28
b CheckPauseOption_partner

.close



.open "ftc/overlay9_119", 0x2308EC0

.org 0x2308EC0+0x1080

CheckPauseOption_Talk:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
cmp r0,0x0
beq 0x2034F64
bne 0x2034FB4


CheckPauseOption_Equip:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
cmp r0,0x0
beq 0x203D0FC
bne 0x203D1F0


CheckPauseOption_partner:
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
cmp r0,0x0
beq 0x2034F64
bne 0x2034FB4
.pool

.close