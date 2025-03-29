.nds
.relativeinclude on
.erroronwarning on

; by default, all the records are hardcoded to play specific songs
; based on the item ID. this changes the code such that byte 0x5 of
; consumeable item data will tell the game to play the song ID
; held in "Var A" of DSVania (byte 0xA).
; (records will need to be updated with the appropriate song IDs)
; (0xe, 0xa, 0xb, 0xc, 0x24 are the default song IDs, sequentially)
; records should otherwise function as vanilla.

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000
.org 0x203A320
b 0x203A3D0
NewCheckRecords:
ldrh r5,[r0,0xA]
mov r0,0x5B
bl 0x21E4574
cmp r0,0x0
beq NoRecordPlayer
mov r0,0x8F00000
bl 0x205C740
mov r0,r5
mov r1,0x2A
bl 0x205C530
mov r0,0x29
bl 0x204D6B0
b 0x21E3DE0
NoRecordPlayer:
mov r0,0x26
bl 0x204D6B0
b 0x21E3DE0

.close


.open "ftc/overlay9_0", 0x21CDF60
.org 0x21E3B4C
b NewCheckRecords	;0x21E3E34

.close

