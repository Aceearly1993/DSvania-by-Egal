.nds
.relativeinclude on
.erroronwarning on

; in Dawn of Sorrow, if Yoko is at full health, big hearts drop instead
; of small hearts.
; this adds that functionality to Portrait of Ruin.
; by default, this code checks for IDs 0xB, 0x2, 0x3 for Yoko,
; Stella, and Loretta, respectively.
; IDs can be added or removed as desired.

; by EgalLau37

.open "ftc/arm9.bin", 0x2000000
.org 0x206F96C
bl CheckBigHeartDrop
cmp r0,0x1
movge r4,0x1
movlt r4,0x0

.close



.open "ftc/overlay9_119", 0x2308EC0
.org 0x2308EC0+0x2100	;ends ~???
CheckBigHeartDrop:
stmfd r13!,{r14}
bl 0x2207C54
cmp r0,0x1
ldmeqfd r13!,{r15}
ldr r1,=0x20CA580
ldr r1,[r1]
add r1,r1,0x1B000
ldrb r0,[r1,0xCE6]
cmp r0,0xB	;Yoko (EgalLau37-only)
cmpne r0,0x2	;Stella
cmpne r0,0x3	;Loretta
movne r0,0x0
ldmnefd r13!,{r15}
add r1,0xF00
ldrh r0,[r1,-4]
ldrh r1,[r1,-2]
cmp r0,r1
movlt r0,0x0
movge r0,0x1
ldmfd r13!,{r15}

.close

