.nds
.relativeinclude on
.erroronwarning on

; By default, the glyph background color is hardcoded based on
; hardcoded glyph ranges based on the type of glyph.
; This changes that to instead allow custom palette index based on
; glyph IDs on an individual basis instead.

; by EgalLau37


Overlay86Start equ 0x22EB1A0
FreeSpace equ Overlay86Start+0x2400

palette_rune	equ	0x20C9854	;palette for glyph colors


.open "ftc/arm9.bin", 0x2000000

.org 0x206DD28
bl RetrieveGlyphColor
mov r3,r3
mov r3,r3
mov r3,r3

.org 0x206DDE0
.dw palette_rune	;0x20C9854
.org 0x206E9FC
.dw palette_rune

.close



.open "ftc/overlay9_86", Overlay86Start

.org FreeSpace

RetrieveGlyphColor:
stmfd r13!,{r3-r6,r14}
mov r4,r0
bl 0x206A664
mov r5,r0
mov r1,r4
bl 0x206A694
mov r1,r5
bl RetrieveFinalGlyphColor
ldmfd r13!,{r3-r6,r15}


RetrieveFinalGlyphColor:
ldr r2,=GlyphColorTableByType
ldr r1,[r2,r1,lsl 0x2]
ldrb r0,[r1,r0]
bx r14
.pool

GlyphColorTableByType:
.dw ArmGlyphColors
.dw BackGlyphColors
.dw GlyphUnionColors

ArmGlyphColors:
.db 0x0	;unarmed
.db 0x2	;confodere
.db 0x2
.db 0x2
.db 0x2	;secare
.db 0x2
.db 0x2
.db 0x2	;hasta
.db 0x2
.db 0x2
.db 0x2	;macir
.db 0x2
.db 0x2
.db 0x2	;arcus
.db 0x2
.db 0x2
.db 0x2	;ascia
.db 0x2
.db 0x2
.db 0x2	;falcis
.db 0x2
.db 0x2
.db 0x2	;culter
.db 0x2
.db 0x2
.db 0x2	;scutum
.db 0x2
.db 0x2
.db 0x2	;redire
.db 0x2	;cubus
.db 0x2	;torpor
.db 0x2	;lapiste
.db 0x2	;pneuma
.db 0x2	;ignis
.db 0x2
.db 0x2	;grando
.db 0x2
.db 0x2	;fulgur
.db 0x2
.db 0x2	;luminatio
.db 0x2
.db 0x2	;umbra
.db 0x2
.db 0x2	;morbus
.db 0x2	;nitesco
.db 0x2	;acerbatus
.db 0x2	;globus
.db 0x2	;dextro
.db 0x2	;sinestro
.db 0x2	;dominus hatred
.db 0x2	;dominus anger
.db 0x2	;cat tackle
.db 0x2	;cat tail
.db 0x2	;bat flying
.db 0x2	;bat kick


BackGlyphColors:
.db 0x0	;unarmed
.db 0x1	;magnes
.db 0x1	;paries
.db 0x1	;volaticus
.db 0x1	;rapidus fio
.db 0x1	;vis fio
.db 0x1	;fortis fio
.db 0x1	;sapiens fio
.db 0x1	;fides fio
.db 0x1	;felicum fio
.db 0x1	;inire pecunia
.db 0x1	;arma felix
.db 0x1	;arma chiroptera
.db 0x1	;arma machina
.db 0x1	;refectio
.db 0x1	;arma custos
.db 0x1	;fidelis caries
.db 0x1	;fidelis alate
.db 0x1	;fidelis polkir
.db 0x1	;fidelis noctua
.db 0x1	;fidelis medusa
.db 0x1	;fidelis aranea
.db 0x1	;fidelis mortus
.db 0x1	;dominus agony
.db 0x3	;agartha

GlyphUnionColors:
.db 0x0	;none
.db 0x4	;sword
.db 0x4	;axe
.db 0x4	;sickle
.db 0x4	;hammer
.db 0x4	;wind
.db 0x4	;stone
.db 0x4	;ignition
.db 0x4	;diamond dust
.db 0x4	;thor
.db 0x4	;metro
.db 0x4	;holy
.db 0x4	;dark matter
.db 0x4	;big bang
.db 0x4	;weapon fire
.db 0x4	;weapon ice
.db 0x4	;thunder lance
.db 0x4	;valmanway
.db 0x4	;weapon stone
.db 0x4	;weapon holy
.db 0x4	;weapon dark
.db 0x4	;normal
.db 0x4	;double laser
.db 0x4	;laser blade
.db 0x4	;dominus union
.db 0x4	;aegis
.db 0x3	;optical shot
.db 0x4	;lance
.db 0x4	;knife
.db 0x4	;rapier
.db 0x4	;arrow

.close

