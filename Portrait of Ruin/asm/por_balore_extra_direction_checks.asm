.nds
.relativeinclude on
.erroronwarning on

; by default, Balore only has three variants: one that faces left,
; one that faces right and waits until the player approaches to
; become active and has a door, and the cutscene version that
; shoots the laser in its intro.
; this patch adds the other variants not also present.
; the list of variants are as follows:
; 00 - left-facing
; 01 - left-facing w/ door (this is different from vanilla)
; 02 - cutscene, right-face
; 03 - right-face
; 04 - right-face w/ door
; 05 - cutscene, left-face
; these go into Var A in DSVania.
; only variants 00 and 03 will play music automatically upon entering
; the room; the door variants have been fixed to play music when
; approached, and the laser versions will not play music aside
; from silencing the currently playing song.
; this also sets up the cutscene triggers properly for the laser
; variants so that scripted movement is correct for both directions.
; this also adjusts the door positioning and camera scroll/lock when
; approaching the door-variants of Balore to be correct.
; note that the door positioning for the left-facing variant is set for
; two-screen wide rooms; if the room is wider, the door/camera lock
; will be further left than it should be.  the door positioning is
; under the "CheckBaloreDirection_doorX" label; 0xF8000 is for
; right-facing Balore.

; by EgalLau37

.open "ftc/overlay9_43", 0x22D7900
.org 0x22D7DE0
bl CheckBalore_cutscene
.org 0x22D7F8C
bl CheckBalore_direction

.org 0x22D8110
bl CheckBalore_initialState	;determines starting state

.org 0x22D7B90
bl CheckBaloreDirection_doorX

.org 0x22D8220
bl CheckBaloreDirection_camera
.org 0x22D826C
bl CheckBaloreDirection_cameralock
mov r1,r0
mov r2,r0
mov r3,r0


.org 0x22D832C	;required distance before locking controls
cmp r0,0xE0000

.org 0x22D8394	;distance before Balore fires
cmp r0,0xB8000

.org 0x22D835C
bl CheckBalore_MoveDirection	;set player state to walk
.org 0x22D8378
bl CheckBalore_MoveDirection	;set player state to walk
/*
;todo: also make the partner character crouch 
.org 0x22D83F4
bl Balore_SetPartnerState
mov r1,0x80
bl SetPartnerState
*/

.org 0x22D8038
add r2,r2,0x1B000
ldr r0,[r2,0x4DC]
orr r1,r0,r1
str r1,[r2,0x4DC]
bl Balore_CheckShouldPlayIntro
bl 0x205C798
add r13,r13,0xC

.org 0x22D8318
bl Balore_PlayBossBGMAfterIntro

.close



.open "ftc/overlay9_119", 0x2308EC0

.org 0x2308EC0+0x3000
CheckBalore_initialState:	;check if should start hidden or active
cmp r0,0x0
cmpne r0,0x3
bxeq r14
bne 0x22D8120

CheckBalore_cutscene:	;checks if cutscene variant
cmp r0,0x2
cmpne r0,0x5
bne 0x22D7E60
cmp r0,0x2
beq 0x22D7DE8
ldr r0,[r5,0x74]
orr r0,r0,0x80
str r0,[r5,0x74]
b 0x22D7DE8

CheckBalore_direction:	;checks which direction to face
cmp r0,0x0
cmpne r0,0x1
cmpne r0,0x5
bx r14

CheckBaloreDirection_doorX:	;checks where door should spawn
ldr r0,[r5,0x74]
ands r0,0x80
ldrne r0,=0x108800
ldreq r0,=0xF8000
bx r14
.pool

CheckBaloreDirection_camera:	;checks which way to scroll camera
mov r3,0x0
ldr r0,[r5,0x74]
ands r0,0x80
ldr r0,[r5,0x5C]
beq CheckBaloreRight
cmp r0,0x0
subgt r0,0x1000
strgt r0,[r5,0x5C]
b 0x22D8234
CheckBaloreRight:
cmp r0,0xA000
addlt r0,0x1000
strlt r0,[r5,0x5C]
b 0x22D8234

CheckBaloreDirection_cameralock:	;checks where to lock camera
ldr r0,[r5,0x74]
ands r0,0x80
moveq r0,0x100
movne r0,0x0
bx r14


CheckBalore_MoveDirection:
ldr r1,[r5,0x74]
ands r1,0x80
moveq r1,0x10
movne r1,0x20
bx r14

/*
Balore_SetPartnerState:
stmfd r13!,{r14}
mov r0,0x3
mov r1,0x80
bl 0x20124D0
mov r0,0x3
ldmfd r13!,{r15}

SetPartnerState:
ldr r3,=0x20CA580
ldr r2,=0x621C
ldr r3,[r3]
add r3,r3,r2
ldrh r2,[r3,0xC]
cmp r2,0x0
beq NoStateActive
cmp r0,r2
bge SkipStateSet
NoStateActive:
strh r0,[r3,0xC]
ldrh r2,[r3,0x10]
mov r0,0x1
eor r2,r1,r2
and r2,r1,r2
strh r2,[r3,0x12]
strh r1,[r3,0x10]
bx r14
*/

Balore_CheckShouldPlayIntro:
cmp r3,0x1
cmpne r3,0x2
cmpne r3,0x4
cmpne r3,0x5
addeq r15,r14,0x4
movne r0,0x19
bx r14

Balore_PlayBossBGMAfterIntro:
mov r0,0x19
bl 0x205C798
b 0x22D8928


.close

