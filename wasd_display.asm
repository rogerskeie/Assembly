; Constants
define KEY_W		$77
define KEY_S		$73
define KEY_A		$61
define KEY_D		$64

; Addresses
define lastKeyPressed	$ff

main:
	lda #0
	sta lastKeyPressed

mainLoop:
	lda lastKeyPressed
	cmp #KEY_W
	beq up
	cmp #KEY_S
	beq down
	cmp #KEY_A
	beq left
	cmp #KEY_D
	beq right
	jmp mainLoop

up:
	lda #1
	sta $201
	jmp main

down:
	lda #2
	sta $221
	jmp main

left:
	lda #3
	sta $220
	jmp main

right:
	lda #4
	sta $222
	jmp main
