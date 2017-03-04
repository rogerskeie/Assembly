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

ldx #$ff ; Prepare X for first iteration

main:
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
	ldy #1
	
drawRandomLoop:
	inx
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
	cpx #$ff
	bne drawRandomLoop
	iny
	cpy #5
	beq main
	jmp drawRandomLoop
	
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
; drawRandom
		
drawBlank:
	inx
	sta upperLeft1,X
	sta upperLeft2,X
	sta upperLeft3,X
	sta upperLeft4,X
	cpx #$ff
	bne drawBlank
	jmp main