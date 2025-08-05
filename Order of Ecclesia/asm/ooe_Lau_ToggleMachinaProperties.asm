.nds
.relativeinclude on
.erroronwarning on

; This patch allows changing of various abilities tied to flag
; 0x800000 located at 0x20FFE14.
; By default, these properties are tied to character ID 0x3,
; Machina.
; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

.org 0x207D35C	;character ID to set flag 0x800000 at 0x20FFE14
cmp r6,0x3

.org 0x207D380	;whether MP can regenerate naturally
;mov r3,r3	;enable MP regeneration
strh r2,[r1,0x68]	;disable MP regeneration

.org 0x207D388	;check for whether should revert at 0 MP
;cmp r14,0x0	;never revert
cmp r0,0x0	;normal
;cmp r0,r14	;always/immediately revert



.org 0x2050120	;check for flag 0x800000 for HP to MP damage
;cmp r3,r3	;always false
;cmp r13,r14	;always true
tst r0,0x800000	;default check

.close



.open "ftc/overlay9_22", 0x2223E00

.org 0x229FC24	;check for spikebreaker
bl 0x2051D04
cmp r0,0x0	;default
;cmp r0,0x1	;inverted check (flag off to break spikes)
;cmp r3,r3	;always false
;cmp 13,r14	;always true

.close
