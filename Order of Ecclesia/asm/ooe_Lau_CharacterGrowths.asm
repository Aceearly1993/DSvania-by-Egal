.nds
.relativeinclude on
.erroronwarning on

; This allows you to edit the growth rates for each character.
; The calculation is different from Portrait of Ruin.
; Below are some approximations for literal value to growth.
;0x4CC ~ 30%
;0x8CC ~ 56%
;0xFA0 - 0xFC0 ~ 99%
;0xFE0 ~ 100%
;0xFFF ~ 101%
;40 ~ 1%
;0x28 ~ 1%

; 0x7E0 ~ 50%
; At level 101, 0x7E0 will result in +50 in a stat.
; 0xFE0 ~ 100%
; At level 101, 0xFE0 will result in +100 in a stat.

; To calculate the value for a growth rate, multiply the percent
; by 0x28.  So for a 37% growth rate, 37*40 = 1480 or 0x5C8 in
; hexadecimal.  Or 0x25*0x28 = 0x5C8.
; Shanoa's growths have been calculated for additional reference.

; by EgalLau37



Overlay86Start equ 0x22EB1A0


.open "ftc/arm9.bin", 0x2000000

.org 0x20EF194
CharacterGrowthsTable:
;shanoa
.dw 0xB33	;71% (0xB33/0x28 ~ 0x47)
.dw 0x800	;51%
.dw 0x999	;61%
.dw 0x666	;40%
.dw 0x4CC	;30%

;arma felix
.dw 0xCCC
.dw 0xCCC
.dw 0x999
.dw 0x999
.dw 0x4CC

;arma chiroptera
.dw 0xCCC
.dw 0xCCC
.dw 0x999
.dw 0x999
.dw 0x4CC

;arma machina
.dw 0xCCC
.dw 0xCCC
.dw 0x999
.dw 0x999
.dw 0x4CC

;albus
.dw 0xCCC
.dw 0x1000
.dw 0xCCC
.dw 0x999
.dw 0x4CC

.org 0x204FCB4
.dw CharacterGrowthsTable


.close
