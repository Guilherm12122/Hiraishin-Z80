; Teste isolado Z80 -> latch -> Arduino -> terminal.
; Carregar na ROM em 0000h. Clock de simulacao: 1 kHz.
; Substitui temporariamente o teste de copia para RAM.
; Nao usa RAM, pilha ou interrupcoes. Manter /NMI alto.
        ORG 0000h
        DI
        LD B,20h        ; Espera cerca de 0,4 s a 1 kHz pelo inicio do Uno.
espera:
        DJNZ espera
        LD A,41h        ; ASCII da letra A.
        OUT (00h),A     ; Escrita de E/S: latch captura o byte.
        HALT            ; Esperado A=41h e PC=000Ah.
parado:
        JR parado
