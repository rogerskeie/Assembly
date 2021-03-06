; Hello world random font color pixel draw for Mos 6502 :)

; Constants
define COLOR_BLACK	$00
define COLOR_DARK_GREY	$0b

; Addresses
define randomNumber	$fe

; Program begin

; H
	jsr getRandomColor
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
	jsr getRandomColor
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
	jsr getRandomColor
	sta $208
	sta $228
	sta $248
	sta $268
	sta $288
	sta $289
	sta $28a

; L
	jsr getRandomColor
	sta $20c
	sta $22c
	sta $24c
	sta $26c
	sta $28c
	sta $28d
	sta $28e

; O
	jsr getRandomColor
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
	jsr getRandomColor
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
	jsr getRandomColor
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
	jsr getRandomColor
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
	jsr getRandomColor
	sta $2ce
	sta $2ee
	sta $30e
	sta $32e
	sta $34e
	sta $34f
	sta $350

; D
	jsr getRandomColor
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
	
	jmp exit

getRandomColor:

tryNextRandom:
	lda randomNumber
; ANDing out the most significant bits so we can compare the rest to 0 and $0b
	and #$0f 
	cmp #COLOR_BLACK
	beq tryNextRandom
	cmp #COLOR_DARK_GREY
	beq tryNextRandom
	rts
	
exit:			; End of program
