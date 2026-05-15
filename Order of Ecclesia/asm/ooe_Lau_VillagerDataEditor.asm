.nds
.relativeinclude on
.erroronwarning on

; This is an editor for some villager data.
; This also removes some code that causes the game to infintely
; hang when attempting to read out of bounds values quest-related
; values.
; by EgalLau37

Overlay86Start equ 0x22EB1A0

.open "ftc/arm9.bin", 0x2000000

.org 0x20f5700
VillagerDataTable:
.db 0x46,0x8	;???
.db 0xD			;ID?
.db 0x0			;number of quests
.dw 0			;pointer to global quest IDs
.dw 0			;0x0
.dw 0			;0x0

.db 0x30,0x6
.db 0xE
.db 0x1
.dw 0x21DD034
.dw 0
.dw 0

.db 0x1A,0x2
.db 0xF
.db 0x4
.dw 0x20F56F8
.dw 0
.dw 0

.db 0x18,0x1
.db 0x10
.db 0x4
.dw 0x20F56FC
.dw 0
.dw 0

.db 0x32,0x6
.db 0x11
.db 0x3
.dw 0x20F56F0
.dw 0
.dw 0

.db 0x28,0x0
.db 0x12
.db 0x3
.dw 0x20F56EC
.dw 0
.dw 0

.db 0x26,0x0
.db 0x13
.db 0x3
.dw 0x20F56D8
.dw 0
.dw 0

.db 0x22,0x0
.db 0x14
.db 0x3
.dw 0x20F56E4
.dw 0
.dw 0

.db 0xA,0x4
.db 0x15
.db 0x3
.dw 0x20F56D4
.dw 0
.dw 0

.db 0x8,0x5
.db 0x16
.db 0x3
.dw 0x20F56F4
.dw 0
.dw 0

.db 0x11,0x3
.db 0x17
.db 0x3
.dw 0x20F56E8
.dw 0
.dw 0

.db 0x2D,0x7
.db 0x18
.db 0x3
.dw 0x20F56E0
.dw 0
.dw 0

.db 0x55,0x9
.db 0x19
.db 0x3
.dw 0x20F56DC
.dw 0
.dw 0




;r0 = villager ID
;r1 - local quest ID
;retrieves global quest ID
;Originally, attempting to retrieve out-of-bounds values, the
;game would force the game to infinitely hang.
;This removes those lines of code and instead returns dummy values.
.org 0x20a95cc
.area 0x48,0x69
stmfd r13!,{r3,r4,r5,r14}
mov r5,r1
mov r4,0x24
cmp r0,0xd
bge _020a9608
ldr r1,=VillagerDataTable	;0x20f5700
add r4,r1,r0,lsl 0x4
ldrb r0,[r4,0x3]
cmp r0,r5
ble _020a9608
_020a95f8:
ldr r0,[r4,0x4]
ldrb r4,[r0,r5]
_020a9608:
mov r0,r4
ldmfd r13!,{r3,r4,r5,r15}
.pool
.endarea



.close


