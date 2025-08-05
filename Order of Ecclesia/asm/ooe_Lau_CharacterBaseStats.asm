.nds
.relativeinclude on
.erroronwarning on

; This is an editor for the base stats for each character.
; Each stat is labeled on Shanoa for reference.

; by EgalLau37

Overlay86Start equ 0x22EB1A0

.open "ftc/arm9.bin", 0x2000000

.org 0x20EF1F8
CharacterBaseStatsTable:
;shanoa
.dh 0	;attack
.dh 0	;defense
.dh 5	;strength
.dh 4	;constitution
.dh 5	;intelligence
.dh 3	;mind
.dh 2	;luck
.dh 0	;???
.dw 0	;resistances
.dh 0x8002	;???
.dh 0	;???

;arma felix
.dh 0
.dh 0
.dh 15
.dh 10
.dh 12
.dh 8
.dh 3
.dh 0
.dw 0x1
.dh 0x02
.dh 0

;arma chiroptera
.dh 0
.dh 0
.dh 10
.dh 15
.dh 10
.dh 8
.dh 3
.dh 0
.dw 0x40
.dh 0x02
.dh 0

;arma machina
.dh 0
.dh 0
.dh 10
.dh 10
.dh 10
.dh 1
.dh 3
.dh 0
.dw 0x40
.dh 0x02
.dh 0

;albus
.dh 0
.dh 0
.dh 8
.dh 8
.dh 8
.dh 8
.dh 3
.dh 0
.dw 0
.dh 0x8002
.dh 0



.org 0x204FCB8
.dw CharacterBaseStatsTable
.org 0x204FDB8
.dw CharacterBaseStatsTable

.close
