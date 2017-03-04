Loop:
  jsr Start
  jmp Loop

Start:
  lda $ff
  cmp #$77
  beq up
  cmp #$73
  beq down
  cmp #$61
  beq left
  cmp #$64
  beq right
  rts

up:
  jsr resetLastKey
  lda #$01
  sta $201
  jmp Start

down:
  jsr resetLastKey
  lda #$02
  sta $221
  jmp Start

left:
  jsr resetLastKey
  lda #$03
  sta $220
  jmp Start

right:
  jsr resetLastKey
  lda #$04
  sta $222
  jmp Start

resetLastKey:
  lda #$00
  sta $ff
  rts