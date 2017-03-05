; Constants
define KEY_C		$63
define KEY_X		$78

; Addresses
define randomNumber	$fe
define lastKeyPressed	$ff
define upperLeft1	$200
define upperLeft2	$300
define upperLeft3	$400
define upperLeft4	$500

; Program begin
	ldx #$ff ; Prepare X for first iteration
	
mainLoop:
	ldy lastKeyPressed
	cpy #KEY_C
	beq drawRandom
	cpy #KEY_X
	beq drawBlank
	jmp mainLoop

drawRandom:
	jsr reset
	inx
	lda randomNumber
	jsr draw
	cpx #$ff
	bne drawRandom
	jmp mainLoop

drawBlank:
	inx
	lda #0
	jsr draw
	cpx #$ff
	bne drawBlank
	jmp mainLoop

draw:
	sta upperLeft1,X
	sta upperLeft2,X
	sta upperLeft3,X
	sta upperLeft4,X
	rts

reset:
	lda #0
	sta lastKeyPressed
	rts