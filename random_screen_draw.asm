  define upperLeft1 $200
  define upperLeft2 $300
  define upperLeft3 $400
  define upperLeft4 $500

loop:
  ldx #$ff
  ldy $ff
  cpy #$77
  beq drawRandom
  cpy #$73
  beq drawBlank
  jmp loop

drawRandom:
  jsr reset
  inx
  lda $fe
  jsr draw
  cpx #$ff
  bne drawRandom
  jmp loop

drawBlank:
  inx
  lda #0
  jsr draw
  cpx #$ff
  bne drawBlank
  jmp loop

draw:
  sta upperLeft1,X
  sta upperLeft2,X
  sta upperLeft3,X
  sta upperLeft4,X
  rts

reset:
  lda #0
  sta $ff
  rts