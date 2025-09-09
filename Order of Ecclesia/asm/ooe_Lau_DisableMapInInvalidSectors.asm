.nds
.relativeinclude on
.erroronwarning on

; This patch disables the pause menu map command if the current
; sector ID is greater than 0x12 (Monastery).  In effect, this
; disables the map screen in sector 0x13, the miscellaneous sector,
; which contains the starting room for Boss rush.

; (additional information below)
; By default, sector 13 is the miscellaneous sector which holds
; rooms for the non-main mode, such as Practice mode, the epilogue
; room, etc..  The starting room of Boss rush mode is also located
; in sector 0x13, with the room near the top-left.
; In the map menu from the pause menu, each sector is allocated
; five different map markers that can be moved around.  The game
; only has space allocated for 0x12 sectors worth of map markers.
; However, if the map is accessed while in the initial Boss rush
; room, the game will attempt to draw markers; only one marker
; is actually visible due to having on-screen coordinates.  Adjusting
; this marker can cause the game to crash, as the X-coordinate of
; this marker corresponds to the current top-screen, and invalid
; IDs can crash the game.
; (The remaining four markers use character ID, difficulty,
; current partner ID, difficulty, and mode ID for their coordinates)

; by EgalLau37

Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2200


.open "ftc/overlay9_22", 0x2223E00

.org 0x222DF0C	;branch to map check routine
b CheckSector13ToDisableMap

.org 0x20ED030+0x13
.db 0x1B	;changes top-screen area name to blank instead of Dracula's Castle


.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckSector13ToDisableMap:
ldr r0,=0x20FFC58
ldrb r0,[r0,0x61]
cmp r0,0x12
ble 0x222DF64
bgt 0x222DF24
.pool

.close

