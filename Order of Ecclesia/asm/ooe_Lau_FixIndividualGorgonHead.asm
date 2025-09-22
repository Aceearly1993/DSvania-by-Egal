.nds
.relativeinclude on
.erroronwarning on

; By default, if a single Gorgon head is placed, it will use the
; regular/blue medusa head palette.  This changes the Gorgon head
; create routine to increment the palette and removes it from the
; spawner routine so that individual Gorgon heads will use the
; gray palette also.

; by EgalLau37


Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x4100



.open "ftc/overlay9_22", 0x2223E00

.org 0x2261F64
bl SetGorgonHeadPalette

.org 0x2261DA0	;gorgon head spawner routine
mov r3,r3
mov r3,r3
mov r3,r3

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

SetGorgonHeadPalette:
ldrsh r0,[r4,0x86]
add r0,r0,0x2
strh r0,[r4,0x86]
ldmfd r13!,{r4,r15}

.close



