.nds
.relativeinclude on
.erroronwarning on

; Increases maximum bestiary entries by two to allow viewing both
; forms of Dark Lord Soma.

.open "ftc/overlay9_0", 0x219E3E0

.org 0x21ED410 ;highest entry - default 0x74 (menace)
mov r2,0x76

.close

