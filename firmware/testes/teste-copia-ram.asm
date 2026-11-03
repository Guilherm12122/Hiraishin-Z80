; Hiraishin-Z80: copiar uma rotina da ROM para a RAM e executa-la.
; Imagem de ROM: inicializacao em 0000h, rotina guardada em 4000h.
; Ainda nao e o bootloader final nem o SO. Nao usa pilha ou interrupcoes.
; Sobrescreve RAM 8000h-8007h e 9000h; executar sem SO/aplicacao carregados.

        ORG 0000h               ; Endereco inicial dos bytes na imagem da ROM.
inicio:
        DI                      ; Desabilita /INT; /NMI deve permanecer alto.

        LD HL,4000h             ; HL guarda o endereco de ORIGEM na ROM.
        LD DE,8000h             ; DE guarda o endereco de DESTINO na RAM.
        LD BC,rotina_fim-rotina  ; BC guarda a quantidade: 8 bytes neste teste.
                                ; O montador calcula a diferenca dos rotulos.
                                ; Estes LD preparam registradores, nao copiam
                                ; o conteudo das memorias ainda.

        LDIR                    ; Le (HL), grava em (DE), incrementa HL e DE
                                ; e decrementa BC. Repete ate BC chegar a 0.
                                ; Copia 4000h-4007h para 8000h-8007h.
                                ; A CPU ainda esta executando codigo da ROM.

        JP 8000h                ; Muda o PC: busca a proxima instrucao na RAM.
                                ; JP nao copia bytes: a copia foi feita acima.

        ORG 4000h               ; Guarda a rotina na segunda regiao da ROM.
                                ; ORG e para o montador, nao para a CPU.
                                ; Ao carregar o HEX, o SimulIDE coloca estes
                                ; bytes em 4000h, antes de iniciar a simulacao.
rotina:
        LD A,042h               ; Na RAM: instrucoes em 8000h e 8001h.
                                ; 42h e uma marca escolhida, sem valor especial.
        LD (9000h),A            ; Na RAM: instrucao em 8002h-8004h.
                                ; Grava a marca fora da area do codigo copiado.
        HALT                    ; Na RAM: instrucao em 8005h; /HALT fica baixo.
                                ; O monitor deve mostrar PC=8006h e A=42h.
        JR $                    ; Na RAM: instrucao em 8006h-8007h.
                                ; $ e o endereco desta instrucao; salta para si.
                                ; Se retomar apos HALT, fica nesse laco.
rotina_fim:

; A rotina usa apenas um endereco absoluto de DADOS (9000h) e um salto
; relativo interno (JR $). Assim, seus bytes podem executar em 8000h sem
; ajuste. Isso nao vale automaticamente para qualquer programa: um JP ou
; CALL absoluto para um rotulo montado em 4000h continuaria apontando a ROM.
; Este teste nao verifica a copia byte a byte antes do salto: faremos essa
; conferencia manual na tabela. A marca sozinha nao prova toda a RAM.
