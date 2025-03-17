.nds
.relativeinclude on
.erroronwarning on

; this adds code to read player GFX from an external table rather than
; the universal GFX table, effectively freeing those slots to be used by
; other assets.
; a vanilla table is automatically installed but can be swapped out with a
; custom one if desired.
; GFX asset IDs in player data will need to be updated to match the new IDs
; from the new table.

; DSVania seems to have issues importing the table automatically, so it
; should be done manually by the user.
; write contents of "playerGFXtable_por.bin" to 0x1120 in overlay_0119.
; by EgalLau37

/*
For GFX asset index:
16 - Jonathan
07 - Charlotte
2D - Stella
32 - Loretta
36 - Richter
4D - Maria
52 - Old Axe Armor

For sprite asset index:
01 - Jonathan
00 - Charlotte
02 - Stella
03 - Loretta
04 - Richiter
05 - Maria
06 - Old Axe Armor
*/

.open "ftc/overlay9_0", 0x21CDF60

.org 0x21FC740	;gfx
bl AssetGetName_player
.org 0x21FC6E4	;sprite
bl AssetGetName_player

.close

.open "ftc/overlay9_119", 0x2308EC0

.org 0x2308EC0+0x1100
AssetGetName_player:
ldr r1,=PlayerAssetsTable
add r0,r1,r0,lsl 0x5
add r0,r0,0x6
bx r14
.pool


.org 0x2308EC0+0x1120
PlayerAssetsTable:
;.import "playerGFXTable_por.bin"


.close

