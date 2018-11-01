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
	ldy #1
	
drawRandomLoop:
	lda randomNumber
	cpy #1
	beq draw1
	cpy #2
	beq draw2
	cpy #3
	beq draw3
	cpy #4
	beq draw4
	
afterDraw:
	inx
	cpx #0
	bne drawRandomLoop
	iny
	cpy #5
	bne drawRandomLoop
	jmp Main
	
draw1:
	sta upperLeft1,X
	jmp afterDraw
	
draw2:
	sta upperLeft2,X
	jmp afterDraw
	
draw3:
	sta upperLeft3,X
	jmp afterDraw
	
draw4:
	sta upperLeft4,X
	jmp afterDraw
; DrawRandom
		
DrawBlank:
	sta upperLeft1,X
	sta upperLeft2,X
	sta upperLeft3,X
	sta upperLeft4,X
	inx
	cpx #0
	bne DrawBlank
	jmp Main