; Hiraishin-Z80: primeiro teste pontual de RAM.
; Executar na ROM em 0000h. Nao utiliza pilha.
; Resultado em A e 8001h: FE=iniciado, 00=passou, FF=falhou.
; Destrutivo: altera 8000h, 8001h, A000h, C000h e FFFFh.
        ORG 0000h

inicio:
        DI
        LD A,0FEh
        LD (8001h),A

        LD A,055h
        LD (8000h),A
        LD A,0AAh
        LD (0A000h),A
        LD A,03Ch
        LD (0C000h),A
        LD A,0C3h
        LD (0FFFFh),A

        LD A,(8000h)
        CP 055h
        JR NZ,falha
        LD A,(0A000h)
        CP 0AAh
        JR NZ,falha
        LD A,(0C000h)
        CP 03Ch
        JR NZ,falha
        LD A,(0FFFFh)
        CP 0C3h
        JR NZ,falha

sucesso:
        XOR A
        JR terminar
falha:
        LD A,0FFh
terminar:
        LD (8001h),A
        HALT
        JR terminar
