.nds
.relativeinclude on
.erroronwarning on

; this adds code to allow unique pause menu GFX depending on the current
; mode. this includes the main pause screen partner boxes, the equip
; menu GFX, and support for the use item screen.
; by default, the use item screen currently all points to Jonathan's
; graphics since the only GFX on that page seems to be the cursor.

; by default, the new GFX entries overwrite entries starting from 0x678
; and is intended to be used in conjuction with
; "por_separate_player_GFX_table.asm" to free those entries.
; (0x678+ are the entries for Charlotte and Jonathan's GFX)

; DSVania seems to have issues importing the table automatically, so it
; should be done manually by the user.
; write contents of "PauseMenuGFXTable_por.bin" to 0xDA9FC in arm9.bin.

; by EgalLau37

.open "ftc/overlay9_0", 0x21CDF60

.org 0x21DCC24
b CheckUniquePauseGraphics

.close



.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x1C00	;ends ~0x1D80

CheckUniquePauseGraphics:
cmp r1,0x2
ldreq r1,=0x20E19DC
ldreq r1,[r1,r0,lsl 0x2]
movne r1,0x0
bxne r14
cmp r0,0x7
cmpne r0,0x8
cmpne r0,0x9
bne NotPauseMenu
sub r0,r0,0x7
ldr r1,=PauseMenuIDTable
ldr r1,[r1,r0,lsl 0x2]
ldr r0,=0x20CA580
ldr r0,[r0]
add r0,r0,0x1B000
ldrb r0,[r0,0xCE2]
cmp r0,0x4	;change this to the highest valid mode ID+1, 03 = Old Axe Armor
movge r0,0x0
ldr r1,[r1,r0,lsl 0x2]
NotPauseMenu:
mov r0,r1
bx r14
.pool

PauseMenuIDTable:
.dw PauseMenu_main
.dw PauseMenu_equip
.dw PauseMenu_item

PauseMenu_main:
.dw PauseGFXMain_Jonathan
.dw PauseGFXMain_Sisters
.dw PauseGFXMain_Richiter
.dw PauseGFXMain_OldAxeArmor

PauseMenu_equip:
.dw PauseGFXEquip_Jonathan
.dw PauseGFXEquip_Sisters
.dw PauseGFXEquip_Richiter
.dw PauseGFXEquip_OldAxeArmor


; the use item screen seems to only have a cursor;
; if you want a unique cursor, just create unique entries here.
PauseMenu_item:	
.dw PauseGFXItem_Jonathan
.dw PauseGFXItem_Jonathan
.dw PauseGFXItem_Jonathan
.dw PauseGFXItem_Jonathan


PauseGFXMain_Jonathan:
.dw 0x51A
.dw 0x1
.dw 0x7DB
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXEquip_Jonathan:
.dw 0x3E9
.dw 0x1
.dw 0x77C
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXMain_Sisters:
.dw 0x678
.dw 0x1
.dw 0x7DB
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXEquip_Sisters:
.dw 0x679
.dw 0x1
.dw 0x77C
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXMain_Richiter:
.dw 0x67C
.dw 0x1
.dw 0x7DB
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXEquip_Richiter:
.dw 0x67D
.dw 0x1
.dw 0x77C
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXMain_OldAxeArmor:
.dw 0x67F
.dw 0x1
.dw 0x7DB
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXEquip_OldAxeArmor:
.dw 0x680
.dw 0x1
.dw 0x77C
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

PauseGFXItem_Jonathan:
.dw 0x5CB
.dw 0x1
.dw 0x84F
.dw 0x2
.dw 0xFFFFFFFF
.dw 0

.close

