.nds
.relativeinclude on
.erroronwarning on

; by default, the game scales damage based on level cap for
; hard difficulty.
; the lower the level cap, the more extra damage enemies deal.
; this allows changing the formula to something different based on
; user-set parameters explained below.

; normalModeDamageBonus
; "true" allows the hard mode bonus to also apply in normal difficulty.
; "false" disables the hard mode bonus for normal difficulty.

; difficultyAdjustment
; "default" keeps the default damage scaling.
; "half" sets bonus damage to half the level cap, rounded down.
; "fourth" sets bonus damage to 25% the level cap, rounded down.
; "eighth" sets bonus damage to 1/8th the level cap, rounded down.
; "max" amplifies the default damage scaling from 100 to 255.
; "flat" sets the bonus to always be the exact amount set
;   in parameter "uniformDamageValue".
; "custom" allows the user to write a custom routine
;   the default custom routine is: damage bonus =
;   50 OR (level cap/2), whichever is greater.
; invalid inputs will result in the bonus being equal to the level cap.

; uniformDamageValue
; values can range from 0 to 255. only used if "flat" is set.

; by EgalLau37


normalModeDamageBonus	equ	"false"
difficultyAdjustment	equ	"half"
uniformDamageValue	equ "50"


.open "ftc/overlay9_0", 0x21CDF60
.if normalModeDamageBonus == "true"
.org 0x220A088
mov r0,0x1
.endif
.org 0x220A0B4
bl HardModeDifficultyAdjustment	;rsb r0,r0,0x64
.close



.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x2450	;ends ~???
.if difficultyAdjustment == "default"
rsb r0,r0,0x64
.endif
.if difficultyAdjustment == "half"
mov r0,r0,lsr 0x1
.endif
.if difficultyAdjustment == "fourth"
mov r0,r0,lsr 0x2
.endif
.if difficultyAdjustment == "eighth"
mov r0,r0,lsr 0x3
.endif
.if difficultyAdjustment == "max"
rsb r0,r0,0xFF
.endif
.if difficultyAdjustment == "flat"
mov r0,uniformDamageValue
.endif

.if difficultyAdjustment == "custom"
mov r0,r0,lsr 0x1	;add custom routine here
cmp r0,0x32
movle r0,0x32
.endif
bx r14

.close

