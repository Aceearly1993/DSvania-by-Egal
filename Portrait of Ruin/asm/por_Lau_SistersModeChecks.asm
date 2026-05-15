.nds
.relativeinclude on
.erroronwarning on

; By default, the game has a hardcoded checks for Sisters mode (0x01)
; for certain functions.  This allows changing those hardcoded
; checks.
; This also allows configuring of other checks related to the
; sisters.
; To disable, set the mode ID to an unused one, such as 0xFE.

;mode IDs:
;0x0 - Jonathan/Charlotte
;0x1 - Sisters
;0x2 - Richter
;0x3 - Old Axe Armor

; by EgalLau37

.open "ftc/overlay9_0", 0x21CDF60

.org 0x21F4678	;check for L button functionality
cmp r1,0x1
.org 0x21F47E0	;check for whether to toggle diamond upon partner call button
cmp r1,0x1
.org 0x21FB03C	;check for whether can summon/unsummon partner
cmp r1,0x1

;character IDs
.org 0x220A20C	;check for Stella for touch-screen attack type (slash)
cmp r0,0x2
.org 0x220A274	;check for Loretta for touch-screen attack type (frost)
cmp r0,0x3


.org 0x220A1D4
mov r0,0x2	;MP to regen per regeneration

.close


