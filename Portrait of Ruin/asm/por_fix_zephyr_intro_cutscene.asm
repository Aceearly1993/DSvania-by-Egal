.nds
.relativeinclude on
.erroronwarning on

; after the special boss intro for Zephyr, no music plays.
; this fixes that.
; this also adds Zephyr's voice clips during his intro animation,
; similar to Dawn of Sorrow JP.
; untested with JP voices currently.
; todo: add the candles

; by EgalLau37

.open "ftc/overlay9_0", 0x21CDF60
.org 0x221B11C
stmfd r13!,{r0-r4,r14}
mov r0,0x19 ;- Nest of Evil boss theme
;mov r0,0x25 ; - Or some other song ID if desired
bl 0x205C798 ;PlaySongWithVariableUpdatesExceptInBossRush
ldmfd r13!,{r0-r4,r15}

.close


.open "ftc/overlay9_49", 0x22D7900
.org 0x22D98EC
bl PlayZephyrIntroClip
.org 0x22DA678
bl PlayZephyrIntroClip_2
;688 - zephyr "Hah!"
;68A - zephyr "Time, stay still!"

.org 0x22D7A5C
add r1,r1,0x1B000
ldr r3,[r1,0x4DC]
orr r2,r3,r2
str r2,[r1,0x4DC]
add r0,r4,0x100
ldrh r0,[r0,0x3C]
cmp r0,0x1
beq SilenceMusic_NestOfEvil
mvnne r0,0xFF
bl 0x204D374
add r13,r13,0x8
ldmfd r13!,{r4,r15}
SilenceMusic_NestOfEvil:
mov r0,0x19
bl 0x204D374
b 0x22D7AA8

.close


.open "ftc/overlay9_119", 0x2308EC0

.org 0x2308EC0+0x3500
PlayZephyrIntroClip:
stmfd r13!,{r14}
add r0,r5,0x30
ldmia r0,{r1-r3}
ldr r0,=0x68A
bl 0x204D5FC
mov r0,0x4000
ldmfd r13!,{r15}

PlayZephyrIntroClip_2:
stmfd r13!,{r14}
add r0,r5,0x30
ldmia r0,{r1-r3}
ldr r0,=0x688
bl 0x204D5FC
ldmfd r13!,{r15}
.pool

.close
