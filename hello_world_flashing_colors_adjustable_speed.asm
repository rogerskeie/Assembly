; Hello world flashing colors pixel draw for Mos 6502 :)
; Increase speed with W and decrease it with S

; Constants
define COLOR_BLACK	$00
define COLOR_DARK_GREY	$0b
define KEY_W		$77
define KEY_S		$73

; Addresses
define idleMultiplier	$00
define randomNumber	$fe
define lastKeyPressed	$ff

; Initialize
	lda #08
	sta idleMultiplier

; Program begin
Main:
	lda lastKeyPressed
	cmp #KEY_W
	beq increaseSpeed
	cmp #KEY_S
	beq decreaseSpeed
	
checkIdle:
	ldy idleMultiplier
	cpy #0
	beq skipIdle
	ldx #0
	
idle:
	ldy #0
	
idleLoop:
	iny
	cpy #20
	bne idleLoop
	inx
	cpx idleMultiplier
	bcs skipIdle
	jmp idle
	
decreaseSpeed:
	ldy idleMultiplier
	cpy #$fe
	beq afterSpeedChange
	iny
	jmp afterSpeedChange
	
increaseSpeed:
	ldy idleMultiplier
	cpy #$00
	beq afterSpeedChange
	dey
	
afterSpeedChange:
	sty idleMultiplier
	lda #0
	sta lastKeyPressed
	jmp checkIdle
	
skipIdle:
	jsr Draw
	jmp Main
	
Draw:
; H
	jsr GetRandomColor
	sta $200
	sta $220
	sta $240
	sta $260
	sta $280
	sta $241
	sta $202
	sta $222
	sta $242
	sta $262
	sta $282

; E
	jsr GetRandomColor
	sta $204
	sta $224
	sta $244
	sta $264
	sta $284
	sta $205
	sta $245
	sta $285
	sta $206
	sta $246
	sta $286

; L
	jsr GetRandomColor
	sta $208
	sta $228
	sta $248
	sta $268
	sta $288
	sta $289
	sta $28a

; L
	jsr GetRandomColor
	sta $20c
	sta $22c
	sta $24c
	sta $26c
	sta $28c
	sta $28d
	sta $28e

; O
	jsr GetRandomColor
	sta $210
	sta $230
	sta $250
	sta $270
	sta $290
	sta $211
	sta $291
	sta $212
	sta $232
	sta $252
	sta $272
	sta $292

; W
	jsr GetRandomColor
	sta $2c0
	sta $2e0
	sta $300
	sta $320
	sta $341
	sta $2c2
	sta $2e2
	sta $302
	sta $322
	sta $343
	sta $2c4
	sta $2e4
	sta $304
	sta $324

; O
	jsr GetRandomColor
	sta $2c6
	sta $2e6
	sta $306
	sta $326
	sta $346
	sta $2c7
	sta $347
	sta $2c8
	sta $2e8
	sta $308
	sta $328
	sta $348

; R
	jsr GetRandomColor
	sta $2ca
	sta $2ea
	sta $30a
	sta $32a
	sta $34a
	sta $2cb
	sta $30b
	sta $32b
	sta $2cc
	sta $2ec
	sta $30c
	sta $34c

; L
	jsr GetRandomColor
	sta $2ce
	sta $2ee
	sta $30e
	sta $32e
	sta $34e
	sta $34f
	sta $350

; D
	jsr GetRandomColor
	sta $2d2
	sta $2f2
	sta $312
	sta $332
	sta $352
	sta $2d3
	sta $353
	sta $2f4
	sta $314
	sta $334
	
	rts
	
GetRandomColor:

tryNextRandom:
	lda randomNumber
; ANDing out the most significant bits so we can compare the rest to 0 and $0b
	and #$0f 
	cmp #COLOR_BLACK
	beq tryNextRandom
	cmp #COLOR_DARK_GREY
	beq tryNextRandom
	rts