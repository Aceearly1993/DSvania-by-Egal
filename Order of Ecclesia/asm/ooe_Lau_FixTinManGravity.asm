.nds
.relativeinclude on
.erroronwarning on

; By default, the Tin Man can be set to fall off ledges if Var A
; is set to 0x1.  However, this causes it to hang the game due to
; the rotation calculation infinitely looping.
; This fixes that by checking if the Tin Man is falling and to
; skip the rotation subroutine if it is.

; by EgalLau37


Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x4000


.open "ftc/overlay9_19", 0x21FFFC0

.org 0x220FCCC	;rotation subroutine?
bl CheckSkipRotation

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

CheckSkipRotation:
stmfd r13!,{r14}
mov r10,r0
ldr r0,[r10,0x30]
ldr r1,[r10,0x34]
ldr r2,[r10,0x40]
add r1,r1,r2
bl 0x2033838
cmp r0,0x0
ldmeqfd r13!,{r3}
ldmeqfd r13!,{r3-r11,r15}
ldmnefd r13!,{r14}

.close
