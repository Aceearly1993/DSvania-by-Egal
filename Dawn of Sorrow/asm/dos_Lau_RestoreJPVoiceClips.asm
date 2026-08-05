.nds
.relativeinclude on
.erroronwarning on

; This patch restores some JP voices into the US ROM.
; Includes some of Soma's voice clips, some voice clips for the
; Julius mode characters, and some enemy voice clips.
; by EgalLau37

; Separate patches have been made for other voice clips
; This includes the Hammer shop voice clips, the soul-specific
; voice clips, and certain enemies, such as Abaddon.


;222E1F0 - US block start (8FE10 to 901FF, file)
;??? - JP block start (8EE40 to 8F22F, file)
;(credit masked_dedede)


.open "ftc/arm9.bin", 0x2000000

;run by magic seal update code
;Copied the JP version of this routine.
;The US version has an additional negative check on r1 that
;seems to be present in the JP version, though that might just
;be a failsafe instead.
;JP - 2029774
.org 0x2029740
.area 0x84,0x69
PlaySFX4:	;(not labeled by DSVedit)
stmfd r13!,{r0-r3}
stmfd r13!,{r14}
;sub r13,r13,0x4
ldr r1,=0x208ac20
ldr r1,[r1,0x0]
add r1,r1,0x36000
ldr r3,[r1,0x890]
ldr r1,[r1,0x894]
ldr r12,[r13,0x10-4]
ldr r2,[r13,0x14-4]
sub r12,r12,r3
sub r3,r2,r1
mov r1,r12,asr 0xb
mov r2,r3,asr 0xb
add r1,r12,r1,lsr 0x14
add r2,r3,r2,lsr 0x14
mov r3,r1,asr 0xc
mov r1,r2,asr 0xc
sub r2,r3,0x80
sub r3,r1,0x60
mov r1,0x0
bl 0x204f4d8	;0x204f4d4 - JP routine
;add r13,r13,0x4
ldmfd r13!,{r14}
add r13,r13,0x10
bx r14
.pool

;2029C78 - JP
PlaySFXJP:
mov r0,r1
b 0x2029BF0

.endarea
;arm_func_end 0x2029774

.org 0x202973C
;dummied out in the US version
PlaySfxAtPosJp:	;called by Hammer/Yoko actors?, as well as Dmitrii
b 0x2029B38	;PlaySfxAtPos2

.org 0x2035718	;called by Yoko's shop
b PlaySFXJP	;bx r14

.close


.open "ftc/overlay9_0", 0x219E3E0

;probably a table of various voice clips?
;replaces some -1 in the US version with non--1 values from the
;JP version
.org 0x222E2CC
.dw 0x50D2,0x50D6,-1,-1,0x50DE,0x50DF,0x50E0,0x50E1,0x50DB,0x50F5,0x50F1,0x50ED,0x50F0,0x5126,0x5127,0x5128,0x5129,0x512F,0x5130,0x5131,0x5132,0x512C,0x5139,0x5138,0x5139,0x512B,0x5109,0x510A,0x510C,0x510B,0x5115,0x5116,0x5117,0x5114,0x5113,0x5123,0x510D,0x5111,0x5112,0x50B3,0x50B4,0x50B5,0x50B6,0x50B9,0x50BB,0x50BB,0x50BC,0x50C2,0x50BD,0x50B7,0x50BD,0x50B8

.org 0x222E5D0
.dw 0x4B1


;magic seal-related?
.org 0x2216318


.close



;boss overlay - abaddon
.open "ftc/overlay9_36", 0x22FF9C0
.org 0x22FF9C0
;see separate patch
.close


