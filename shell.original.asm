; da65 V2.19 - Git 5ed3108
; Created:    2026-01-11 13:38:46
; Input file: shell.prg
; Page:       1


        .setcpu "6502"

L0000           := $0000
L0053           := $0053
L1800           := $1800
L3032           := $3032
L414F           := $414F
L4420           := $4420
L464F           := $464F
L4946           := $4946
L4E49           := $4E49
L4F46           := $4F46
L4F4E           := $4F4E
L504F           := $504F
L5241           := $5241
L5250           := $5250
L554F           := $554F
LBBA2           := $BBA2
LBDDD           := $BDDD
LFCE2           := $FCE2
LFE72           := $FE72
LFF81           := $FF81
LFF84           := $FF84
LFFB7           := $FFB7
LFFBA           := $FFBA
LFFBD           := $FFBD
LFFC0           := $FFC0
LFFC3           := $FFC3
LFFC6           := $FFC6
LFFC9           := $FFC9
LFFCC           := $FFCC
LFFCF           := $FFCF
LFFD2           := $FFD2
LFFD5           := $FFD5
LFFE1           := $FFE1
        ora     ($08,x)
        .byte   $0C
        php
        asl     a
        brk
        .byte   $9E
        jsr     L3032
        rol     $32,x
        brk
        brk
        brk
        jmp     L0826

        jmp     L0928

        jmp     L0933

        jmp     L0957

        jmp     L0960

        jmp     L0941

        jmp     L0CD4

        jmp     L0926

L0826:  lda     $0318
        sta     L0922
        lda     $0319
        sta     L0923
        tsx
        stx     L0924
        lda     #$0B
        sta     $D020
        lda     #$0C
        sta     $D021
        lda     #$05
        jsr     LFFD2
        lda     #$93
        jsr     LFFD2
        lda     #$0D
        jsr     LFFD2
        lda     #$08
        sta     $17FA
        sta     $17FC
        lda     #$00
        sta     $17FB
        sta     $17FD
        sta     $16C9
        sta     L0925
        sta     $17C8
L0868:  lda     #$B9
        sta     $0318
        lda     #$08
        sta     $0319
        lda     $D018
        ora     #$02
        sta     $D018
L087A:  jsr     L0886
        jsr     L0890
        jsr     L0D34
        jmp     L087A

L0886:  lda     #$24
        jsr     LFFD2
        lda     #$20
        jmp     LFFD2

L0890:  ldy     #$00
L0892:  jsr     LFFCF
        cmp     #$0D
        beq     L089F
        sta     $1678,y
        iny
        bne     L0892
L089F:  jsr     LFFD2
        lda     #$00
        sta     $1678,y
        rts

L08A8:  stx     $2A
        sty     $2B
        ldy     #$00
L08AE:  lda     ($2A),y
        beq     L08B8
        jsr     LFFD2
        iny
        bne     L08AE
L08B8:  rts

        pha
        lda     L0925
        beq     L08C1
        pla
        rti

L08C1:  txa
        pha
        tya
        pha
        lda     #$7F
        sta     $DD0D
        ldy     $DD0D
        bpl     L08D2
        jmp     LFE72

L08D2:  jsr     LFFE1
        beq     L08DA
        jmp     LFE72

L08DA:  inc     L0925
        lda     $01
        ora     #$07
        sta     $01
        lda     #$04
        sta     $0288
        lda     $0286
        pha
        lda     $D020
        pha
        lda     $D021
        pha
        jsr     LFF84
        jsr     LFF81
        pla
        sta     $D021
        pla
        sta     $D020
        pla
        sta     $0286
        ldx     L0924
        txs
        cli
        ldx     #$0F
L090D:  txa
        pha
        jsr     LFFC3
        pla
        tax
        dex
        bne     L090D
        lda     #$0D
        jsr     LFFD2
        dec     L0925
        jmp     L0868

L0922:  brk
L0923:  brk
L0924:  brk
L0925:  brk
L0926:  lda     #$00
L0928:  ldy     #$00
        sta     ($1A),y
        inc     $1A
        bne     L0932
        inc     $1B
L0932:  rts

L0933:  lda     $1A
        bne     L0939
        dec     $1B
L0939:  dec     $1A
        ldy     #$00
        lda     ($1A),y
        tax
        rts

L0941:  jsr     L0933
        lda     $033C,x
        sta     $FB
        inx
        lda     $033C,x
        sta     $FC
        inx
        stx     $4C
        lda     #$00
        jmp     L097F

L0957:  jsr     L0933
        stx     $4C
        lda     #$02
        bne     L096A
L0960:  jsr     L0933
        lda     $033C,x
        inx
        inx
        stx     $4C
L096A:  cmp     #$02
        bne     L0979
        ldx     $17FF
        bne     L0979
        jsr     LFFCC
        jmp     L097D

L0979:  tax
        jsr     LFFC9
L097D:  lda     #$01
L097F:  sta     $4D
        ldx     $4C
        lda     $033C,x
        inx
        sta     $FD
        lda     $033C,x
        inx
        sta     $FE
        stx     $4C
        ldy     #$FF
L0993:  iny
        lda     ($FD),y
        bne     L09A1
        ldy     $4D
        bne     L099E
        sta     ($FB),y
L099E:  jmp     LFFCC

L09A1:  cmp     #$25
        bne     L0A08
        jsr     L0C33
        lda     ($FD),y
        cmp     #$44
        bne     L09B4
        jsr     L0A3F
        jmp     L0C9F

L09B4:  cmp     #$55
        bne     L09BE
        jsr     L0A3B
        jmp     L0C9F

L09BE:  cmp     #$58
        bne     L09C8
        jsr     L0B7F
        jmp     L0C9F

L09C8:  cmp     #$4F
        bne     L09D2
        jsr     L0BBE
        jmp     L0C9F

L09D2:  cmp     #$43
        bne     L09DC
        jsr     L0BFB
        jmp     L0C9F

L09DC:  cmp     #$53
        bne     L09E6
        jsr     L0C0A
        jmp     L0C9F

L09E6:  cmp     #$46
        bne     L09F0
        jsr     L0AEA
        jmp     L0C9F

L09F0:  cmp     #$47
        bne     L09FA
        jsr     L0AB2
        jmp     L0C9F

L09FA:  cmp     #$00
        beq     L0A04
        jsr     L0A0E
        jmp     L0993

L0A04:  dey
        jmp     L0993

L0A08:  jsr     L0A0E
        jmp     L0993

L0A0E:  sty     $51
        ldy     $4D
        beq     L0A19
        ldy     $51
        jmp     LFFD2

L0A19:  sta     ($FB),y
        inc     $FB
        bne     L0A21
        inc     $FC
L0A21:  ldy     $51
        rts

L0A24:  sty     $4B
        ldx     $4C
        lda     $033C,x
        sta     $5A
        inx
        lda     $033C,x
        sta     $5B
        inx
        stx     $4C
        lda     #$00
        sta     $58
        rts

L0A3B:  lda     #$01
        bne     L0A41
L0A3F:  lda     #$00
L0A41:  sta     $51
        jsr     L0A24
        sta     $54
        lda     $5B
        bpl     L0A67
        ldy     $51
        bne     L0A67
        eor     #$FF
        sta     $5B
        lda     $5A
        eor     #$FF
        sta     $5A
        inc     $5A
        bne     L0A60
        inc     $5B
L0A60:  lda     #$2D
        sta     $16CA
        inc     $54
L0A67:  ldx     #$04
L0A69:  ldy     #$00
L0A6B:  lda     $5A
        sec
        sbc     L0AA8,x
        sta     $51
        lda     $5B
        sbc     L0AAD,x
        bcc     L0A83
        sta     $5B
        lda     $51
        sta     $5A
        iny
        bne     L0A6B
L0A83:  tya
        beq     L0A88
        sta     $58
L0A88:  lda     $58
        beq     L0A96
        lda     L0BAE,y
        ldy     $54
        sta     $16CA,y
        inc     $54
L0A96:  dex
        bpl     L0A69
        ldx     $54
L0A9B:  ldy     $4B
        lda     $58
        bne     L0AA7
        lda     #$30
        sta     $16CA,x
        inx
L0AA7:  rts

L0AA8:  ora     ($0A,x)
        .byte   $64
        inx
        .byte   $10
L0AAD:  brk
        brk
        brk
        .byte   $03
        .byte   $27
L0AB2:  lda     $01
        pha
        ora     #$01
        sta     $01
        sty     $4B
        clc
        lda     #$3C
        adc     $4C
        ldy     #$03
        jsr     LBBA2
        jsr     LBDDD
        ldy     #$00
        ldx     #$00
L0ACC:  lda     $0100,y
        beq     L0ADD
        cmp     #$20
        beq     L0AD9
        sta     $16CA,x
        inx
L0AD9:  iny
        jmp     L0ACC

L0ADD:  clc
        lda     $4C
        adc     #$05
        sta     $4C
        ldy     $4B
        pla
        sta     $01
        rts

L0AEA:  lda     $01
        pha
        ora     #$01
        sta     $01
        sty     $4B
        clc
        lda     #$3C
        adc     $4C
        ldy     #$03
        jsr     LBBA2
        jsr     LBDDD
        lda     #$00
        sta     $56
        sta     $55
        sta     L0053
        lda     $50
        bne     L0B0E
        inc     $56
L0B0E:  bpl     L0B14
        lda     #$06
        sta     $50
L0B14:  ldy     #$00
        ldx     #$00
L0B18:  lda     $0100,y
        beq     L0B52
        cmp     #$20
        beq     L0B4E
        cmp     #$45
        bne     L0B30
        jsr     L0B5E
        lda     #$00
        sta     $55
        inc     L0053
        lda     #$45
L0B30:  sta     $51
        lda     $55
        beq     L0B3C
        lda     $50
        beq     L0B4E
        dec     $50
L0B3C:  lda     $51
        cmp     #$2E
        bne     L0B48
        lda     $56
        bne     L0B52
        inc     $55
L0B48:  lda     $51
        sta     $16CA,x
        inx
L0B4E:  iny
        jmp     L0B18

L0B52:  clc
        lda     $4C
        adc     #$05
        sta     $4C
        ldy     $4B
        pla
        sta     $01
L0B5E:  lda     $56
        bne     L0B7E
        lda     L0053
        bne     L0B7E
        lda     $55
        bne     L0B70
        lda     #$2E
        sta     $16CA,x
        inx
L0B70:  lda     $50
        beq     L0B7E
        lda     #$30
L0B76:  sta     $16CA,x
        inx
        dec     $50
        bne     L0B76
L0B7E:  rts

L0B7F:  jsr     L0A24
        ldx     #$00
        lda     #$04
        sta     $5C
L0B88:  lda     $5B
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        tay
        bne     L0B95
        lda     $58
        beq     L0B9E
L0B95:  lda     L0BAE,y
        sta     $16CA,x
        inx
        stx     $58
L0B9E:  ldy     #$04
L0BA0:  asl     $5A
        rol     $5B
        dey
        bne     L0BA0
        dec     $5C
        bne     L0B88
        jmp     L0A9B

L0BAE:  bmi     L0BE1
        .byte   $32
        .byte   $33
        .byte   $34
        and     $36,x
        .byte   $37
        sec
        and     $4241,y
        .byte   $43
        .byte   $44
        eor     $46
L0BBE:  jsr     L0A24
        ldx     #$00
        lda     $5B
        bpl     L0BCF
        lda     #$31
        sta     $16CA
        inx
        stx     $58
L0BCF:  lda     #$05
        sta     $5C
L0BD3:  lda     $5B
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        and     #$07
        tay
        bne     L0BE2
        lda     $58
        .byte   $F0
L0BE1:  .byte   $09
L0BE2:  lda     L0BAE,y
        sta     $16CA,x
        inx
        stx     $58
        ldy     #$03
L0BED:  asl     $5A
        rol     $5B
        dey
        bne     L0BED
        dec     $5C
        bne     L0BD3
        jmp     L0A9B

L0BFB:  ldx     $4C
        lda     $033C,x
        sta     $16CA
        inx
        inx
        stx     $4C
        ldx     #$01
        rts

L0C0A:  sty     $4B
        ldx     $4C
        lda     $033C,x
        sta     $20
        inx
        lda     $033C,x
        sta     $21
        inx
        stx     $4C
        ldy     #$00
L0C1E:  lda     $50
        beq     L0C2E
        lda     ($20),y
        beq     L0C2E
        sta     $16CA,y
        iny
        dec     $50
        bne     L0C1E
L0C2E:  tya
        tax
        ldy     $4B
        rts

L0C33:  lda     #$00
        sta     $4E
        iny
        lda     ($FD),y
        cmp     #$2D
        bne     L0C41
        inc     $4E
        iny
L0C41:  lda     ($FD),y
        cmp     #$30
        beq     L0C49
        lda     #$20
L0C49:  sta     $52
        jsr     L0C69
        sta     $4F
        lda     ($FD),y
        cmp     #$2E
        bne     L0C5D
        iny
        jsr     L0C69
        jmp     L0C5F

L0C5D:  lda     #$FF
L0C5F:  sta     $50
        lda     ($FD),y
        cmp     #$4C
        bne     L0C68
        iny
L0C68:  rts

L0C69:  lda     ($FD),y
        cmp     #$2A
        bne     L0C7A
        ldx     $4C
        lda     $033C,x
        inx
        inx
        stx     $4C
        iny
        rts

L0C7A:  lda     #$00
        sta     $5A
L0C7E:  lda     ($FD),y
        cmp     #$3A
        bcs     L0C9C
        cmp     #$30
        bcc     L0C9C
        sbc     #$30
        sta     $5B
        lda     $5A
        asl     $5A
        asl     $5A
        adc     $5A
        asl     a
        adc     $5B
        sta     $5A
        iny
        bne     L0C7E
L0C9C:  lda     $5A
        rts

L0C9F:  stx     $54
        lda     $4E
        bne     L0CA8
        jsr     L0CC1
L0CA8:  ldx     #$00
L0CAA:  cpx     $54
        beq     L0CB7
        lda     $16CA,x
        jsr     L0A0E
        inx
        bne     L0CAA
L0CB7:  lda     $4E
        beq     L0CBE
        jsr     L0CC1
L0CBE:  jmp     L0993

L0CC1:  sec
        lda     $4F
        sbc     $54
        bcc     L0CD3
        tax
        beq     L0CD3
L0CCB:  lda     $52
        jsr     L0A0E
        dex
        bne     L0CCB
L0CD3:  rts

L0CD4:  tay
        dey
        lda     $17E7,y
        beq     L0CDD
        sec
        rts

L0CDD:  lda     $99
        beq     L0CEE
        jsr     LFFCF
        pha
        jsr     LFFB7
        sta     $17E7,y
        pla
        clc
        rts

L0CEE:  ldx     $17F7
        cpx     $17F8
        bne     L0D2B
        sty     L0D33
        tay
L0CFA:  jsr     LFFCF
        sta     $174A,y
        iny
        cmp     #$0D
        bne     L0CFA
        jsr     LFFD2
        sty     $17F8
        sty     $17F7
        lda     $174A
        cmp     #$2E
        bne     L0D26
        lda     $174B
        cmp     #$0D
        bne     L0D26
        ldy     L0D33
        lda     #$01
        sta     $17E7,y
        sec
        rts

L0D26:  ldx     #$00
        stx     $17F7
L0D2B:  lda     $174A,x
        inc     $17F7
        clc
        rts

L0D33:  brk
L0D34:  ldy     #$00
        sty     $29
        sty     $17FE
        sty     $17FF
        ldx     #$FF
L0D40:  inx
        lda     $1678,x
        .byte   $D0
L0D45:  .byte   $03
        jmp     L0DCE

L0D49:  cmp     #$20
        beq     L0D4F
        cmp     #$A0
L0D4F:  beq     L0D40
        cmp     #$3C
        bne     L0D67
        jsr     L0F7F
        bcc     L0D64
        ldx     #$B1
        ldy     #$0E
        jsr     L08A8
        jmp     L0E8C

L0D64:  jmp     L0D40

L0D67:  cmp     #$3E
        bne     L0D98
        inx
        lda     $1678,x
        cmp     #$3E
        bne     L0D85
        jsr     L1080
        bcc     L0D82
        ldx     #$E0
        ldy     #$0E
        jsr     L08A8
        jmp     L0E8C

L0D82:  jmp     L0D40

L0D85:  dex
        jsr     L0FAA
        bcc     L0D95
        ldx     #$C8
        ldy     #$0E
        jsr     L08A8
        jmp     L0E8C

L0D95:  jmp     L0D40

L0D98:  inc     $29
        cmp     #$22
        bne     L0DB5
        inx
        jsr     L0F6E
        dex
L0DA3:  inx
        lda     $1678,x
        beq     L0DCE
        cmp     #$22
        bne     L0DA3
        lda     #$00
        sta     $1678,x
        jmp     L0D40

L0DB5:  jsr     L0F6E
L0DB8:  inx
        lda     $1678,x
        beq     L0DCE
        cmp     #$20
        beq     L0DC4
        cmp     #$A0
L0DC4:  bne     L0DB8
        lda     #$00
        sta     $1678,x
        jmp     L0D40

L0DCE:  lda     $29
        bne     L0DD5
        jmp     L0E8C

L0DD5:  lda     $179B
        sta     $2A
        lda     $179C
        sta     $2B
        ldy     #$00
L0DE1:  lda     ($2A),y
        beq     L0DF0
        cmp     #$41
        bcc     L0DED
        cmp     #$5B
        bcc     L0DF3
L0DED:  iny
        bne     L0DE1
L0DF0:  jmp     L0E8C

L0DF3:  jsr     L10F3
        jsr     L0E01
        bcs     L0DFE
        jsr     L0E3B
L0DFE:  jmp     L0E8C

L0E01:  lda     #$C8
        sta     $57
        lda     #$17
        sta     $58
        jsr     L118A
        bne     L0E10
        clc
        rts

L0E10:  ldx     $17FC
        ldy     $17FD
        jsr     L0EF5
        bcc     L0E2F
        ldx     $17FA
        ldy     $17FB
        jsr     L0EF5
        bcc     L0E2F
        ldx     #$9E
        ldy     #$0E
        jsr     L08A8
        sec
        rts

L0E2F:  ldy     #$13
L0E31:  lda     ($2A),y
        sta     $17C8,y
        dey
        bpl     L0E31
        clc
        rts

L0E3B:  lda     $29
        sta     $033C
        lda     #$00
        sta     $033D
        lda     #$9B
        sta     $033E
        lda     #$17
        sta     $033F
        lda     $0286
        sta     L0E89
        lda     $D020
        sta     L0E8A
        lda     $D021
        sta     L0E8B
        jsr     L1800
        lda     L0E8A
        sta     $D020
        lda     L0E8B
        sta     $D021
        lda     L0E89
        sta     $0286
        ldx     #$D8
        ldy     #$00
        sty     $2A
L0E7C:  stx     $2B
L0E7E:  sta     ($2A),y
        iny
        bne     L0E7E
        inx
        cpx     #$DC
        bne     L0E7C
        rts

L0E89:  brk
L0E8A:  brk
L0E8B:  brk
L0E8C:  lda     #$01
        jsr     LFFC3
        lda     #$02
        jsr     LFFC3
        lda     #$0F
        jsr     LFFC3
        jmp     LFFCC

        .byte   $43
        .byte   $4F
        eor     $414D
        lsr     $2044
        lsr     $544F
        jsr     L4F46
        eor     $4E,x
        .byte   $44
        ora     $4300
        eor     ($4E,x)
        .byte   $27
        .byte   $54
        jsr     L504F
        eor     $4E
        jsr     L4E49
        bvc     L0F15
        .byte   $54
        jsr     L4946
        jmp     L0D45

        brk
        .byte   $43
        eor     ($4E,x)
        .byte   $27
        .byte   $54
        jsr     L504F
        eor     $4E
        jsr     L554F
        .byte   $54
        bvc     L0F2D
        .byte   $54
        jsr     L4946
        jmp     L0D45

        brk
        bvc     L0F34
        eor     #$4E
        .byte   $54
        eor     $52
        jsr     L4F4E
        .byte   $54
        jsr     L5250
        eor     L0053
        eor     $4E
        .byte   $54
        .byte   $0D
        brk
L0EF5:  stx     L0F6D
        tya
        clc
        adc     #$30
        sta     $17AF
        lda     #$3A
        sta     $17B0
        ldy     #$00
        ldx     #$02
L0F08:  lda     ($2A),y
        beq     L0F13
        sta     $17AF,x
        iny
        inx
        bne     L0F08
L0F13:  lda     #$2E
L0F15:  sta     $17AF,x
        inx
        lda     #$53
        sta     $17AF,x
        inx
        lda     #$48
        sta     $17AF,x
        inx
        txa
        ldx     #$AF
        ldy     #$17
        jsr     LFFBD
L0F2D:  ldx     L0F6D
        lda     #$04
        tay
        .byte   $20
L0F34:  tsx
        .byte   $FF
        lda     #$00
        jsr     LFFD5
        bcc     L0F6C
        cmp     #$05
        bne     L0F42
        rts

L0F42:  lda     #$0F
        ldx     L0F6D
        tay
        jsr     LFFBA
        lda     #$00
        jsr     LFFBD
        jsr     LFFC0
        bcs     L0F63
        ldx     #$0F
        jsr     LFFC6
        bcs     L0F63
L0F5C:  jsr     LFFCF
        cmp     #$0D
        bne     L0F5C
L0F63:  lda     #$0F
        jsr     LFFC3
        jsr     LFFCC
        sec
L0F6C:  rts

L0F6D:  brk
L0F6E:  clc
        txa
        adc     #$78
        sta     $179B,y
        iny
        lda     #$00
        adc     #$16
        sta     $179B,y
        iny
        rts

L0F7F:  lda     #$01
        sta     $17FE
        sty     $2B
        jsr     L1047
        bcc     L0F8C
        rts

L0F8C:  tya
        ldx     #$AF
        ldy     #$17
        jsr     LFFBD
        lda     #$01
        ldx     $17FC
        ldy     #$02
        jsr     LFFBA
        jsr     LFFC0
        bcc     L0FA4
        rts

L0FA4:  lda     $17FC
        jmp     L0FF5

L0FAA:  lda     #$01
        sta     $17FF
        sty     $2B
        jsr     L1047
        bcc     L0FB7
        rts

L0FB7:  dey
        dey
        lda     $17AF,y
        iny
        iny
        cmp     #$2C
        beq     L0FCE
        lda     #$2C
        sta     $17AF,y
        iny
        lda     #$53
        sta     $17AF,y
        iny
L0FCE:  lda     #$2C
        sta     $17AF,y
        iny
        lda     #$57
        sta     $17AF,y
        iny
        tya
        ldx     #$AF
        ldy     #$17
        jsr     LFFBD
        lda     #$02
        ldx     $17FC
        ldy     #$03
        jsr     LFFBA
        jsr     LFFC0
        bcc     L0FF2
        rts

L0FF2:  lda     $17FC
L0FF5:  pha
        lda     #$00
        jsr     LFFBD
        pla
        tax
        lda     #$0F
        tay
        jsr     LFFBA
        jsr     LFFC0
        ldx     #$0F
        jsr     LFFC6
        ldy     #$00
L100D:  jsr     LFFCF
        sta     $17DC,y
        iny
        cmp     #$0D
        bne     L100D
        jsr     LFFCC
        lda     $17DC
        cmp     #$30
        bne     L102F
        lda     $17DD
        cmp     #$30
        bne     L102F
        clc
        ldx     $2A
        ldy     $2B
        rts

L102F:  ldy     #$00
L1031:  lda     $17DC,y
        cmp     #$0D
        beq     L103E
        jsr     LFFD2
        iny
        bne     L1031
L103E:  jsr     LFFD2
        sec
        ldx     $2A
        ldy     $2B
        rts

L1047:  clc
        lda     $17FD
        adc     #$30
        sta     $17AF
        lda     #$3A
        sta     $17B0
L1055:  inx
        lda     $1678,x
        bne     L105D
        sec
        rts

L105D:  cmp     #$20
        beq     L1063
        cmp     #$A0
L1063:  beq     L1055
        ldy     #$02
L1067:  lda     $1678,x
        beq     L107B
        cmp     #$20
        beq     L107B
        cmp     #$A0
        beq     L107B
        sta     $17AF,y
        iny
        inx
        bne     L1067
L107B:  dex
        stx     $2A
        clc
        rts

L1080:  stx     $2A
        sty     $2B
        lda     #$01
        sta     $17FF
        lda     #$02
        ldx     #$04
        ldy     #$07
        jsr     LFFBA
        lda     #$00
        jsr     LFFBD
        jsr     LFFC0
        bcs     L10A1
        ldx     #$02
        jsr     LFFC9
L10A1:  php
        jsr     LFFCC
        plp
        ldx     $2A
        ldy     $2B
        rts

L10AB:  brk
L10AC:  stx     L1313
        ldx     L10AB
        sta     $033C,x
        inc     L10AB
        cmp     #$0D
        beq     L10C0
        ldx     L1313
        rts

L10C0:  lda     $17FF
        beq     L10CD
        jsr     LFFCC
        ldx     #$02
        jsr     LFFC9
L10CD:  ldx     #$00
L10CF:  cpx     L10AB
        beq     L10DD
        lda     $033C,x
        jsr     LFFD2
        inx
        bne     L10CF
L10DD:  lda     $17FF
        beq     L10EA
        jsr     LFFCC
        ldx     #$04
        jsr     LFFC6
L10EA:  ldx     L1313
L10ED:  lda     #$00
        sta     L10AB
        rts

L10F3:  lda     #$99
        sta     $57
        lda     #$11
        sta     $58
        lda     #$00
        sta     $59
L10FF:  ldy     #$00
        lda     ($57),y
        bne     L1106
        rts

L1106:  jsr     L118A
        beq     L111A
        clc
        lda     $57
        adc     #$05
        sta     $57
        bcc     L1116
        inc     $58
L1116:  inc     $59
        bne     L10FF
L111A:  pla
        pla
        ldx     $59
        bne     L1132
        jsr     L0E8C
        lda     L0922
        sta     $0318
        lda     L0923
        sta     $0319
        jmp     LFCE2

L1132:  dex
        bne     L114E
        lda     $29
        cmp     #$02
        bne     L114B
        lda     $179D
        sta     $2A
        lda     $179E
        sta     $2B
        jsr     L0E01
        jmp     L0E8C

L114B:  jmp     L1572

L114E:  dex
        bne     L115A
        ldx     $17FA
        ldy     $17FB
        jmp     L11CB

L115A:  dex
        bne     L1166
        ldx     $17FC
        ldy     $17FD
        jmp     L11CB

L1166:  dex
        bne     L116C
        jmp     L1373

L116C:  dex
        bne     L1172
        jmp     L13DD

L1172:  dex
        bne     L1178
        jmp     L1484

L1178:  dex
        bne     L117E
        jmp     L1330

L117E:  dex
        bne     L1184
        jmp     L152A

L1184:  dex
        bne     L118A
        jmp     L154E

L118A:  ldy     #$00
L118C:  lda     ($2A),y
        cmp     ($57),y
        beq     L1193
        rts

L1193:  iny
        cmp     #$00
        bne     L118C
        rts

        .byte   $42
        eor     $45,y
        brk
        jmp     L414F

        .byte   $44
        brk
        jmp     L0053

        brk
        brk
        jmp     L0000

        brk
        brk
        .byte   $52
        eor     a:L0000
        brk
        eor     a:$56
        brk
        brk
        bvc     L120B
        brk
        brk
        brk
        .byte   $44
        eor     #$53
        .byte   $4B
        brk
        .byte   $57
        .byte   $4F
        .byte   $52
        .byte   $4B
        brk
        .byte   $53
        eor     L0053,y
        brk
L11CB:  txa
        pha
        tya
        clc
        adc     #$30
        sta     L12A2
        ldx     #$03
        lda     $29
        cmp     #$02
        bne     L11F6
        lda     $179D
        sta     $2A
        lda     $179E
        sta     $2B
        ldy     #$00
L11E8:  lda     ($2A),y
        beq     L11F3
        sta     L12A1,x
        iny
        inx
        bne     L11E8
L11F3:  jmp     L1204

L11F6:  cmp     #$01
        beq     L11FE
        pla
        jmp     L1572

L11FE:  lda     #$2A
        sta     L12A1,x
        inx
L1204:  txa
        ldx     #$A1
        ldy     #$12
        .byte   $20
        .byte   $BD
L120B:  .byte   $FF
        pla
        pha
        tax
        lda     #$04
        ldy     #$00
        jsr     LFFBA
        jsr     LFFC0
        bcc     L121F
        pla
        jmp     L1507

L121F:  pla
        jsr     L0FF5
        bcc     L122D
        lda     #$04
        jsr     LFFC3
        jmp     L0E8C

L122D:  jsr     L10ED
        ldx     #$04
        jsr     LFFC6
        jsr     LFFCF
        jsr     LFFCF
        lda     #$0D
        jsr     L10AC
        lda     #$00
        sta     L132F
L1245:  jsr     L1319
        bcs     L1294
        jsr     L1319
        bcs     L1294
        jsr     L1319
        bcs     L1294
        pha
        jsr     L1319
        tay
        pla
        tax
        jsr     L12B4
        ldx     #$00
L1260:  lda     L1315,x
        cmp     #$20
        beq     L126F
        jsr     L10AC
        inx
        cpx     #$03
        bne     L1260
L126F:  lda     #$20
        jsr     L10AC
L1274:  jsr     L1319
        bcs     L1294
        cmp     #$00
        beq     L1283
        jsr     L10AC
        jmp     L1274

L1283:  lda     #$0D
        jsr     L10AC
L1288:  lda     $CB
        eor     #$40
        .byte   $0D
L128D:  sta     $D002
        .byte   $F7
        jmp     L1245

L1294:  lda     #$0D
        jsr     L10AC
        lda     #$04
        jsr     LFFC3
        jmp     L0E8C

L12A1:  .byte   $24
L12A2:  bmi     L12DE
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L12B4:  stx     L1311
        sty     L1312
        ldx     #$03
        lda     #$20
L12BE:  sta     L1315,x
        dex
        bpl     L12BE
        ldx     #$00
        ldy     #$03
L12C8:  lda     #$00
        sta     L1314
L12CD:  sec
        lda     L1311
        sbc     L1309,y
        sta     L1313
        lda     L1312
        sbc     L130D,y
        .byte   $90
L12DE:  asl     L128D
        .byte   $13
        lda     L1313
        sta     L1311
        inc     L1314
        bne     L12CD
        lda     L1314
        bne     L12F6
        cpx     #$00
        beq     L12FD
L12F6:  clc
        adc     #$30
        sta     L1315,x
        inx
L12FD:  dey
        bpl     L12C8
        txa
        bne     L1308
        lda     #$30
        sta     L1315
L1308:  rts

L1309:  ora     ($0A,x)
        .byte   $64
        inx
L130D:  brk
        brk
        brk
        .byte   $03
L1311:  brk
L1312:  brk
L1313:  brk
L1314:  brk
L1315:  brk
        brk
        brk
        brk
L1319:  lda     L132F
        cmp     #$00
        beq     L1322
        sec
        rts

L1322:  jsr     LFFCF
        pha
        jsr     LFFB7
        sta     L132F
        pla
        clc
        rts

L132F:  brk
L1330:  lda     $29
        cmp     #$02
        beq     L1339
        jmp     L1572

L1339:  lda     $179D
        sta     $2A
        lda     $179E
        sta     $2B
        lda     #$0F
        ldx     $17FC
        tay
        jsr     LFFBA
        lda     #$00
        jsr     LFFBD
        jsr     LFFC0
        ldx     #$0F
        jsr     LFFC9
        ldy     #$00
L135B:  lda     ($2A),y
        beq     L1365
        jsr     LFFD2
        iny
        bne     L135B
L1365:  lda     #$0D
        jsr     LFFD2
        lda     $17FC
        jsr     L0FF5
        jmp     L0E8C

L1373:  lda     $29
        cmp     #$02
        beq     L137C
        jmp     L1572

L137C:  clc
        lda     $17FD
        adc     #$30
        sta     L13C7
        lda     $179D
        sta     $2A
        lda     $179E
        sta     $2B
        ldx     #$03
        ldy     #$00
L1393:  lda     ($2A),y
        beq     L139E
        sta     L13C6,x
        iny
        inx
        bne     L1393
L139E:  lda     #$0D
        sta     L13C6,x
        inx
        txa
        ldx     #$C6
        ldy     #$13
        jsr     LFFBD
        lda     #$0F
        tay
        ldx     $17FC
        jsr     LFFBA
        jsr     LFFC0
        bcc     L13BD
        jmp     L1507

L13BD:  lda     $17FC
        jsr     L0FF5
        jmp     L0E8C

L13C6:  .byte   $53
L13C7:  bmi     L1403
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L13DD:  lda     $29
        cmp     #$03
        beq     L13E6
        jmp     L1572

L13E6:  clc
        lda     $17FD
        adc     #$30
        sta     L145A
        pha
        lda     $179F
        sta     $2A
        lda     $17A0
        sta     $2B
        ldx     #$03
        ldy     #$00
L13FE:  lda     ($2A),y
        beq     L1409
        .byte   $9D
L1403:  eor     $C814,y
        inx
        bne     L13FE
L1409:  lda     #$3D
        sta     L1459,x
        inx
        pla
        sta     L1459,x
        inx
        lda     #$3A
        sta     L1459,x
        inx
        lda     $179D
        sta     $2A
        lda     $179E
        sta     $2B
        ldy     #$00
L1426:  lda     ($2A),y
        beq     L1431
        sta     L1459,x
        iny
        inx
        bne     L1426
L1431:  lda     #$0D
        sta     L1459,x
        inx
        txa
        ldx     #$59
        ldy     #$14
        jsr     LFFBD
        lda     #$0F
        tay
        ldx     $17FC
        jsr     LFFBA
        jsr     LFFC0
        bcc     L1450
        jmp     L1507

L1450:  lda     $17FC
        jsr     L0FF5
        jmp     L0E8C

L1459:  .byte   $52
L145A:  bmi     L1496
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
L1484:  lda     $29
        cmp     #$02
        beq     L148D
        jmp     L1572

L148D:  lda     $179D
        sta     $2A
        lda     $179E
        .byte   $85
L1496:  .byte   $2B
        ldy     #$00
L1499:  lda     ($2A),y
        beq     L14A0
        iny
        bne     L1499
L14A0:  tya
        ldx     $2A
        ldy     $2B
        jsr     LFFBD
        lda     #$04
        ldx     $17FC
        tay
        jsr     LFFBA
        jsr     LFFC0
        bcc     L14B9
        jmp     L1507

L14B9:  lda     $17FC
        jsr     L0FF5
        bcc     L14C9
        lda     #$04
        jsr     LFFC3
        jmp     L0E8C

L14C9:  jsr     L10ED
        ldx     #$04
        jsr     LFFC6
L14D1:  jsr     LFFCF
        tax
        jsr     LFFB7
        pha
        txa
        jsr     L10AC
        pla
        beq     L14D1
        jsr     L10C0
        lda     #$04
        jsr     LFFC3
        jmp     L0E8C

        ldx     #$F5
        ldy     #$14
        jsr     L08A8
        jmp     L0E8C

        .byte   $43
        eor     ($4E,x)
        .byte   $27
        .byte   $54
        jsr     L504F
        eor     $4E
        jsr     L4946
        jmp     L0D45

        .byte   $0D
        brk
L1507:  lda     #$04
        jsr     LFFC3
        ldx     #$16
        ldy     #$15
        jsr     L08A8
        jmp     L0E8C

        .byte   $44
        eor     $56
        eor     #$43
        eor     $20
        lsr     $544F
        jsr     L5250
        eor     L0053
        eor     $4E
        .byte   $54
        .byte   $0D
        brk
L152A:  lda     $29
        cmp     #$01
        bne     L1539
        ldx     $17FC
        ldy     $17FD
        jmp     L1598

L1539:  cmp     #$03
        beq     L1540
        jmp     L1572

L1540:  jsr     L15DD
        bcs     L154B
        stx     $17FC
        sty     $17FD
L154B:  jmp     L0E8C

L154E:  lda     $29
        cmp     #$01
        bne     L155D
        ldx     $17FA
        ldy     $17FB
        jmp     L1598

L155D:  cmp     #$03
        beq     L1564
        jmp     L1572

L1564:  jsr     L15DD
        bcs     L156F
        stx     $17FA
        sty     $17FB
L156F:  jmp     L0E8C

L1572:  ldx     #$7C
        ldy     #$15
        jsr     L08A8
        jmp     L0E8C

        .byte   $57
        .byte   $52
        .byte   $4F
        lsr     $2047
        lsr     $4D55
        .byte   $42
        eor     $52
        jsr     L464F
        jsr     L5241
        .byte   $47
        eor     $4D,x
        eor     $4E
        .byte   $54
        .byte   $53
        ora     a:$0D
L1598:  lda     #$20
        sta     L15CF
        txa
        ldx     #$00
        cmp     #$0A
        bcc     L15AF
        pha
        lda     #$31
        sta     L15CE
        pla
        sec
        sbc     #$0A
        inx
L15AF:  clc
        adc     #$30
        sta     L15CE,x
        clc
        tya
        adc     #$30
        sta     L15D9
        ldx     #$C6
        ldy     #$15
        jsr     L08A8
        jmp     L0E8C

        .byte   $44
        eor     $56
        eor     #$43
        eor     $3A
        .byte   $20
L15CE:  brk
L15CF:  brk
        jsr     L4420
        .byte   $52
        eor     #$56
        eor     $3A
        .byte   $20
L15D9:  brk
        ora     a:$0D
L15DD:  lda     $179D
        sta     $2A
        lda     $179E
        sta     $2B
        ldx     #$00
        ldy     #$00
        lda     ($2A),y
        cmp     #$31
        bne     L15FB
        ldx     #$0A
        iny
        lda     ($2A),y
        bne     L15FB
        jmp     L1658

L15FB:  txa
        clc
        adc     ($2A),y
        sec
        sbc     #$30
        sta     L15CE
        iny
        lda     ($2A),y
        beq     L160D
        jmp     L1658

L160D:  lda     $179F
        sta     $2A
        lda     $17A0
        sta     $2B
        ldy     #$00
        lda     ($2A),y
        cmp     #$30
        bcc     L1629
        cmp     #$32
        bcs     L1629
        tax
        iny
        lda     ($2A),y
        beq     L162C
L1629:  jmp     L1658

L162C:  txa
        sec
        sbc     #$30
        sta     L15D9
        lda     #$0F
        ldx     L15CE
        tay
        jsr     LFFBA
        ldx     #$75
        ldy     #$16
        lda     #$03
        jsr     LFFBD
        jsr     LFFC0
        php
        lda     #$0F
        jsr     LFFC3
        plp
        bcs     L1658
        ldx     L15CE
        ldy     L15D9
        rts

L1658:  ldx     #$61
        ldy     #$16
        jsr     L08A8
        sec
        rts

        .byte   $44
        .byte   $52
        eor     #$56
        eor     $20
        lsr     $544F
        jsr     L5250
        eor     L0053
        eor     $4E
        .byte   $54
        ora     a:$0D
        eor     $522D
