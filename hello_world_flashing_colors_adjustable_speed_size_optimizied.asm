; Hello world flashing colors pixel draw for Mos 6502 :)
; Increase speed with W and decrease it with S

; Constants
define COLOR_DARK_GREY	$0b
define KEY_W		$77
define KEY_S		$73

; Addresses
define idleMultiplier	$00
define randomNumber	$fe
define lastKeyPressed	$ff

; Initialize
	lda #$2f
	sta idleMultiplier      ; Set starting speed

; Program begin
Main:
	ldx #0			; Initialize idle loop counter
	ldy #0
	
idleLoop:
	jsr CheckInput
	cpx idleMultiplier	; Check if done looping
	beq draw		; If so, start drawing
	inx			; Increment loop counter
	jmp idleLoop
	
draw:
	jsr GetRandomColor
	jsr H
	jsr NextLetter
	jsr E
	jsr NextLetter
	jsr L
	jsr NextLetter
	jsr L
	jsr NextLetter
	jsr O
	jsr NextLine
	jsr NextLetter
	jsr W
	jsr NextLetter
	jsr O
	jsr NextLetter
	jsr R
	jsr NextLetter
	jsr L
	jsr NextLetter
	jsr D
	jmp Main
; Main
	
H:
	sta $200,Y
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $280,Y
	sta $241,Y
	sta $242,Y
	sta $243,Y
	sta $204,Y
	sta $224,Y
	sta $244,Y
	sta $264,Y
	sta $284,Y
	rts

E:
	sta $200,Y
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $280,Y
	sta $201,Y
	sta $241,Y
	sta $281,Y
	sta $202,Y
	sta $242,Y
	sta $282,Y
	sta $203,Y
	sta $243,Y
	sta $283,Y
	sta $204,Y
	sta $244,Y
	sta $284,Y
	rts

L:
	sta $200,Y
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $280,Y
	sta $281,Y
	sta $282,Y
	sta $283,Y
	sta $284,Y
	rts

O:
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $201,Y
	sta $281,Y
	sta $202,Y
	sta $282,Y
	sta $203,Y
	sta $283,Y
	sta $224,Y
	sta $244,Y
	sta $264,Y
	rts

W:
	sta $200,Y
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $281,Y
	sta $202,Y
	sta $222,Y
	sta $242,Y
	sta $262,Y
	sta $283,Y
	sta $204,Y
	sta $224,Y
	sta $244,Y
	sta $264,Y
	rts

R:
	sta $200,Y
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $280,Y
	sta $201,Y
	sta $241,Y
	sta $202,Y
	sta $242,Y
	sta $262,Y
	sta $203,Y
	sta $243,Y
	sta $283,Y
	sta $224,Y
	sta $284,Y
	rts

D:
	sta $200,Y
	sta $220,Y
	sta $240,Y
	sta $260,Y
	sta $280,Y
	sta $201,Y
	sta $281,Y
	sta $202,Y
	sta $282,Y
	sta $203,Y
	sta $283,Y
	sta $224,Y
	sta $244,Y
	sta $264,Y
	rts
	
GetRandomColor:

tryNextRandom:
	lda randomNumber
	and #$0f		; ANDing out the most significant bits
				; to get a number between $00 and $0F.
	beq tryNextRandom       ; if the zero flag is set after logical AND,
				; the last color was black so try again.
	cmp #COLOR_DARK_GREY
	beq tryNextRandom	; Also avoid dark grey font color.

	rts
; GetRandomColor

CheckInput:
	lda lastKeyPressed
	cmp #KEY_W
	beq increaseSpeed	; Increase speed if W was pressed.
	cmp #KEY_S
	beq decreaseSpeed	; Decrease speed if S was pressed.
	rts

increaseSpeed:
	lda idleMultiplier
	beq afterSpeedChange	; Skip change if idleMultiplier is already 0.
	dec idleMultiplier
	jmp afterSpeedChange

decreaseSpeed:
	lda idleMultiplier
	cmp #$ff
	beq afterSpeedChange	; Skip change if idleMultiplier is already $ff.
	inc idleMultiplier
	
afterSpeedChange:
	lda #0
	sta lastKeyPressed	; Clear last pressed key.

	rts
; CheckInput

NextLetter:
	tya
	clc
	adc #6
	tay
	jsr GetRandomColor
	rts
	
NextLine:
	tya
	clc
	adc #$a2
	tay
	rts