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
Main:
	lda #0
	sta lastKeyPressed

mainLoop:
	ldy lastKeyPressed
	cpy #KEY_C
	beq drawRandom
	cpy #KEY_X
	beq drawBlank
	jmp mainLoop

drawRandom:
	lda randomNumber
	sta upperLeft1,X
	lda randomNumber
	sta upperLeft2,X
	lda randomNumber
	sta upperLeft3,X
	lda randomNumber
	sta upperLeft4,X
	inx
	cpx #0
	bne drawRandom
	jmp Main

drawBlank:
	sta upperLeft1,X
	sta upperLeft2,X
	sta upperLeft3,X
	sta upperLeft4,X
	inx
	cpx #0
	bne drawBlank
	jmp Main