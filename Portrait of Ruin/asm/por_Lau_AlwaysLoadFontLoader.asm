.nds
.relativeinclude on
.erroronwarning on

; By default, the font loader object is required to load the
; font; otherwise, the font is not loaded propertly
; This changes it so that the font is always loaded, regardless
; of whether the font loader object is used.

; by EgalLau37

Freespace	equ	0x2308EC0+0x2000
Overlay119Start	equ	0x2308EC0


.open "ftc/overlay9_0", 0x21CDF60

.org 0x21dd000
.area 0x68,0x69
;LoadRoomEntities:
stmfd r13!,{r4,r5,r14}
mov r5,r0
mov r0,0x3
mov r4,r1
bl 0x2011cf8
mov r0,0x0
bl 0x2008f58
mov r0,r5
mov r1,r4
bl 0x21dd190
mov r0,r5
mov r1,r4
bl 0x21dd424
mov r0,0x4
bl 0x2011cf8
mov r0,0x0
bl 0x202cad8
mov r0,r5
mov r1,r4
bl 0x21dd39c
mov r0,r5
mov r1,r4
;bl 0x21dd068
bl 0x202C064	;loads font
ldmfd r13!,{r4,r5,r15}
.endarea
;arm_func_end func_ov000_021dd000

.close

