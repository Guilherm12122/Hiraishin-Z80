; Hiraishin-Z80: primeiro teste pontual de RAM.
;
; O programa fica na ROM, a partir de 0000h, onde a CPU comeca apos reset.
; Ele escreve na RAM (8000h-FFFFh), le de volta e compara os valores.
; Nao e um teste completo: verifica somente quatro enderecos e padroes.
; Sobrescreve 8000h, 8001h, A000h, C000h e FFFFh. Use na simulacao isolada,
; sem SO ou aplicacao. FFFFh sera parte da area de pilha no sistema futuro.
;
; COMO LER ESTE FONTE
; - Tudo depois de ponto e virgula e comentario; nao vira instrucao da CPU.
; - O sufixo h indica hexadecimal: 55h = 85 decimal; FFh = 255 decimal.
; - Um zero inicial, como em 0AAh, deixa claro que se trata de um numero.
; - A e um registrador de 8 bits dentro da CPU: guarda um valor de 0 a 255.
; - Parenteses indicam acesso a memoria: (8000h) e o conteudo desse endereco.
; - LD destino,origem copia um valor; a origem continua com o mesmo valor.
; - Nomes seguidos de dois-pontos sao rotulos: marcam posicoes no codigo.
;   O montador troca esses nomes pelos enderecos/deslocamentos dos saltos.
;
; RESULTADO FINAL: A e a posicao 8001h recebem 00h se passou ou FFh se falhou.
; FEh em 8001h e apenas a marca de inicio, antes da conclusao.
; /HALT baixo indica que a CPU parou, mas nao distingue sucesso de falha.
; Conferir A e a RAM depois da execucao: RAM zerada tambem pode conter 00h
; antes de iniciar, e uma falha de escrita pode impedir registrar o resultado.
;
; ORG e uma diretiva para o montador, nao uma instrucao executada pelo Z80.
; Define a origem do codigo; nao grava a ROM nem faz a CPU saltar sozinho.
        ORG 0000h

inicio:
        DI                      ; Desabilita interrupcoes mascaraveis (/INT).
                                ; NMI nao e bloqueada por DI: manter /NMI alto.
                                ; Nao usamos CALL, PUSH ou pilha neste teste,
                                ; por isso nao precisamos configurar SP ainda.
        LD A,0FEh               ; Coloca a marca FEh no registrador A.
        LD (8001h),A            ; Copia A para a RAM: "teste iniciado".

; ETAPA 1: gravar todos os valores antes de comecar a leitura.
; Valores diferentes ajudam a perceber se algum desses enderecos esta
; acessando indevidamente a mesma posicao fisica. Nao cobrem todos os erros.
        LD A,055h               ; 55h = 01010101 em binario.
        LD (8000h),A            ; Grava no primeiro endereco da RAM.
        LD A,0AAh               ; AAh = 10101010, inverso do padrao anterior.
        LD (0A000h),A           ; Grava em outro ponto da RAM.
        LD A,03Ch               ; 3Ch = 00111100.
        LD (0C000h),A           ; Grava na futura area de aplicacao.
        LD A,0C3h               ; C3h = 11000011.
        LD (0FFFFh),A           ; Grava no ultimo endereco da RAM.

; ETAPA 2: ler e conferir cada valor.
; CP compara A com o valor indicado sem alterar A. Atualiza os flags,
; que sao bits de estado da CPU. O flag Z fica 1 quando os valores sao iguais.
; JR NZ significa "salte se Z=0": neste caso, se os valores forem diferentes.
; JR e um salto relativo curto. Quando a condicao nao vale, a CPU simplesmente
; continua na instrucao seguinte. A primeira diferenca leva direto a falha.
        LD A,(8000h)            ; Le da RAM para A (sentido inverso da gravacao).
        CP 055h                 ; Esperamos o mesmo 55h que foi gravado.
                                ; Para provocar falha, trocar somente por CP 054h.
        JR NZ,falha             ; Se nao for, abandona as demais comparacoes.
        LD A,(0A000h)           ; Le o segundo endereco.
        CP 0AAh                 ; Esperamos AAh.
        JR NZ,falha
        LD A,(0C000h)           ; Le o terceiro endereco.
        CP 03Ch                 ; Esperamos 3Ch.
        JR NZ,falha
        LD A,(0FFFFh)           ; Le o ultimo endereco.
        CP 0C3h                 ; Esperamos C3h.
        JR NZ,falha

; Chegamos aqui em sequencia somente se nenhuma comparacao encontrou erro.
sucesso:
        XOR A                   ; Faz A XOR A: o resultado e sempre zero.
                                ; Agora A=00h significa "passou".
        JR terminar             ; Salto sem condicao: pula o bloco de falha.
                                ; Sem ele, a CPU continuaria e colocaria FFh!
falha:
        LD A,0FFh               ; A=FFh significa "falhou".

; Os dois caminhos se encontram aqui com o resultado ja escolhido em A.
terminar:
        LD (8001h),A            ; Registra o resultado na memoria para consulta.
                                ; Na tabela interna da RAM, indice 0001h
                                ; corresponde ao endereco 8001h da CPU.
        HALT                    ; Entra em espera e coloca /HALT em nivel baixo.
                                ; Clock e refresh podem continuar; nao desliga
                                ; o circuito nem encerra o simulador.
        JR terminar             ; Se a CPU retomar apos HALT sem reset, volta
                                ; a registrar A e parar. Um reset comeca em 0000h.
