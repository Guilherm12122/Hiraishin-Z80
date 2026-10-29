# Primeiro teste pontual de RAM

Estado: preparado, ainda nao carregado nem executado no circuito do autor.

## Arquivos

- Circuito: `../../simulacao/hiraishin-nucleo.sim1`.
- Fonte: `../../firmware/testes/teste-ram.asm`.
- Imagem Intel HEX: `../../firmware/testes/teste-ram.hex`.

O codigo ocupa 65 bytes a partir de 0000h na ROM. A imagem HEX foi
codificada diretamente a partir das instrucoes do fonte; ainda nao foi
comparada com a saida de um montador externo. Os checksums e destinos dos
saltos foram conferidos localmente. Isso nao substitui a execucao no Z80.

## O que faz

Desabilita interrupcoes, grava FEh em 8001h e escreve quatro valores:

| Endereco | Valor |
| --- | --- |
| 8000h | 55h |
| A000h | AAh |
| C000h | 3Ch |
| FFFFh | C3h |

Depois le e compara cada valor. Ao terminar, grava 00h (passou) ou FFh
(falhou) em 8001h, mantendo o mesmo resultado no registrador A, e executa
HALT. Nao usa CALL, PUSH ou pilha. Se sair de HALT, volta a registrar o
resultado e parar.

As cinco posicoes citadas sao sobrescritas. Este teste nao deve rodar junto
com SO ou aplicacao: FFFFh pertence a futura area de pilha.

## Preparacao e execucao manual

1. Abrir o circuito no SimulIDE 1.1.0-SR2 e manter a simulacao parada.
2. Conferir ROM e RAM com 15 bits de endereco e 8 bits de dados; ROM
   persistente, RAM nao persistente. Ambas assincronas, sem Open Drain.
3. Conferir o clock de 5 V em 1 kHz e a fonte de 5 V ativados.
4. Clicar com o botao direito na ROM e escolher Carregar dados.
5. Selecionar `teste-ram.hex` no formato Intel HEX, se houver escolha de formato.
6. Conferir na tabela da ROM os primeiros bytes: `F3 3E FE 32 01 80`.
   Isso evita interpretar o arquivo HEX como texto ou bytes brutos.
7. Iniciar a simulacao e observar CLK, /HALT, /RD e /WR nos quatro primeiros
   canais do analisador. A 1 kHz, aguardar alguns segundos.
8. Quando /HALT ficar baixo, pausar e inspecionar o registrador A no monitor
   da CPU e a posicao 0001h na tabela interna da RAM: ela corresponde ao
   endereco 8001h da CPU, pois a RAM comeca em 8000h.

| Resultado | Interpretacao |
| --- | --- |
| A=00h e RAM[0001h]=00h, depois de HALT | Quatro comparacoes passaram |
| A=FFh, depois de HALT | Pelo menos uma comparacao falhou |
| RAM[0001h]=FEh | Inicio registrado, sem conclusao registrada |

Uma RAM zerada antes da execucao tambem apresenta 00h. Portanto, ler somente
essa posicao nao comprova sucesso. /HALT sozinho tambem nao distingue sucesso
de falha. Se a propria escrita do resultado falhar, conferir A e os sinais.

## Limites e evidencias pendentes

Nao e um teste completo dos 32 KiB, de todas as linhas de endereco ou de
todos os padroes de dados. Nao comprova temporizacao ou niveis dos CIs reais.
Ainda registrar: resultado observado, captura do analisador, valores da RAM,
partida repetida e teste com falha provocada. Nao ha evidencia de aprovacao
do hardware fisico nem do bootloader/SO nesta etapa.
