.nds
.relativeinclude on
.erroronwarning on

; This patch forces the map markers on the map screen to be drawn
; off-screen if the sector ID is greater than 0x12 and also disallows
; the markers to update their coordinates if the sector ID is
; greater than 0x12.

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


.open "ftc/arm9.bin", 0x2000000

.org 0x20448F8
b CheckInvalidSectorsForMarkerMovement

.org 0x2044C10
b CheckInvalidSectorsForMarkerDraw

.org 0x20ED030+0x13
.db 0x1B	;changes top-screen area name to blank instead of Dracula's Castle

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace
CheckInvalidSectorsForMarkerMovement:
beq 0x2044A7C
ldrb r1,[r8,0x20]
cmp r1,0x12
ble 0x20448FC
bgt 0x2044C04

CheckInvalidSectorsForMarkerDraw:
ldrb r1,[r9,0x20]
cmp r1,0x12
ble 0x2044CE0
mov r1,0xA
mov r2,0xA
mov r3,r9
mov r6,r9
DrawMarkersOffScreen_loop:
ldrb r8,[r6,0x20]
mov r7,0x0
strb r7,[r9,0xC]
ldrb r8,[r3,0x20]
mov r7,0x0
strb r7,[r9,0x11]
add r0,r0,0x1
cmp r0,0x5
blt DrawMarkersOffScreen_loop
b 0x2044D2C

.close

