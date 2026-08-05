.nds
.relativeinclude on
.erroronwarning on

; placeholder description

; by EgalLau37

.open "ftc/overlay9_1", 0x2230A00

;update state 0x2, dark lord soma
.org 0x223836c
func_ov001_0223836c:
stmfd r13!,{r4,r14}
sub r13,r13,0x8
mov r4,r0
bl func_ov001_02238d98
ldrb r0,[r4,0xe]
cmp r0,0x2
addls r15,r15,r0,lsl 0x2
b _02238428
b _0223839c
b _022383e4
b _0223840c
_0223839c:
add r0,r4,0x2c
sub r3,r13,0x8
ldmia r0,{r0,r1,r2}
stmia r3,{r0,r1,r2}
ldr r0,=0x6069
ldr r1,=0x605c
ldmia r3,{r2,r3}
bl func_02029740
ldr r1,[r4,0xd0]
orr r1,r1,0x10000000
str r1,[r4,0xd0]
mov r0,r4
mov r1,0x5
mov r2,0x2
bl func_0200d020
ldrb r0,[r4,0xe]
add r0,r0,0x1
strb r0,[r4,0xe]
_022383e4:
ldrsh r0,[r4,0x9e]
cmp r0,0x4
ble _02238428
mov r0,r4
mov r1,0x18	;great axe armor
bl func_ov001_02238e94
ldrb r0,[r4,0xe]
add r0,r0,0x1
strb r0,[r4,0xe]
b _02238428
_0223840c:
mov r0,r4
bl func_0200cdf4
cmp r0,0x0
movne r0,0x1
addne r13,r13,0x8
ldmnefd r13!,{r4,r15}
_02238428:
mov r0,0x0
add r13,r13,0x8
ldmfd r13!,{r4,r15}
.pool
.endarea
;arm_func_end func_ov001_0223836c

