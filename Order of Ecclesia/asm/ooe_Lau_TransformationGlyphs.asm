.nds
.relativeinclude on
.erroronwarning on

; This patch allows the user to set the main and sub glyphs for each
; of the transformations.  The back glyph could also technically be
; set, but that would require some additional freespace.
; by EgalLau37

.open "ftc/arm9.bin", 0x2000000

.org 0x207D228
.fill 0x58,0x69
.org 0x207D228
ldr r0,=0x2100258
cmp r6,0x4
addls r15,r15,r6,lsl 0x2
b 0x207D284
b 0x207D284
b SetGlyphs_felix
b SetGlyphs_chirop
b SetGlyphs_machina
b 0x207D284
SetGlyphs_felix:
mov r1,0x33
strh r1,[r0,0x68]
mov r1,0x34
strh r1,[r0,0x6A]
b 0x207D284
SetGlyphs_chirop:
mov r1,0x35
strh r1,[r0,0x68]
mov r1,0x36
strh r1,[r0,0x6A]
b 0x207D284
SetGlyphs_machina:
mov r1,0x33
strh r1,[r0,0x68]
mov r1,0x34
strh r1,[r0,0x6A]
mov r3,r3

.org 0x207D404
.pool


;.org 0x20473D4	;check for whether to enable ally flag?
.org 0x207D298	;sets ally flag for transformations
;mov r3,r3	;uncomment to enable


.close
