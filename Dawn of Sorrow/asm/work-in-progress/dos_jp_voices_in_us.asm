.nds
.relativeinclude on
.erroronwarning on



.open "/ftc/overlay9_0", 0x2230A00
.org 0x219E3E0	;yoko blue splash
mov r1,r0
.org 0x2202564	;yoko holy lightning
mov r1,r0

.close

.open "/ftc/overlay9_1", 0x2230A00
.org 0x225D2F0
.dw 0x600E	;dario fire pillar attack voice

.close


;zephry
.open "/ftc/overlay9_33", 0x22FF9C0
.org 0x2301A28
bl PlayVoiceOpen_Zephyr
ldmia r1,{r1-r3}

.org 0x23029AC	;end of intro animation
.dw 0x606B

.close

;death
.open "/ftc/overlay9_34", 0x22FF9C0
.org 0x22FFB70
;bl PlayVoiceOpen_Death
ldmfd r13!,{r4,r5,r15}


.close


;abaddon
.open "/ftc/overlay9_39", 0x22FF9C0

.org 0x22FFB50
bl PlayVoiceOpen_Abaddon
ldmfd r13!,{r4,r15}

.org 0x22FFFA8
bl AttackVoice_Abaddon1

.org 0x22FFFCC
bl AttackVoice_Abaddon3



; 00 - -
; 01 left-down: line 1, shimo
; 02 - U
; 03 - C line 3 kanedeyo


.close


Overlay41Start equ 0x2308920
.open "ftc/overlay9_41", Overlay41Start

.org Overlay41Start+0x2000
PlayVoiceOpen_Abaddon:
stmfd r13!,{r14}
ldr r0,=0x6002
bl 0x2029BF0
ldmfd r13!,{r15}
.pool

AttackVoice_Abaddon1:
stmfd r13!,{r14}
ldr r0,=0x6000
bl 0x2029BF0
add r1,r5,0x2C
ldmfd r13!,{r15}
.pool

AttackVoice_Abaddon3:
stmfd r13!,{r14}
ldr r0,=0x6003
bl 0x2029BF0
add r1,r5,0x2C
ldmfd r13!,{r15}
.pool


PlayVoiceOpen_Death:
stmfd r13!,{r14}
ldr r0,=0x601E
bl 0x2029BF0
add r1,r5,0x2C
ldmfd r13!,{r15}
.pool


PlayVoiceOpen_Zephyr:
stmfd r13!,{r14}
ldr r0,=0x6075
bl 0x2029BF0
add r1,r5,0x2C
ldmfd r13!,{r15}
.pool


.close

