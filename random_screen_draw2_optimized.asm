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
	beq DrawRandom
	cpy #KEY_X
	beq DrawBlank
	jmp mainLoop
; Main
	
DrawRandom:

draw1:
	lda randomNumber
	sta upperLeft1,X
	inx
	bne draw1
	
draw2:
	lda randomNumber
	sta upperLeft2,X
	inx
	bne draw2
	
draw3:
	lda randomNumber
	sta upperLeft3,X
	inx
	bne draw3
	
draw4:
	lda randomNumber
	sta upperLeft4,X
	inx
	bne draw4

	jmp Main
; DrawRandom
		
DrawBlank:
	sta upperLeft1,X
	sta upperLeft2,X
	sta upperLeft3,X
	sta upperLeft4,X
	inx
        bne DrawBlank
	beq Main