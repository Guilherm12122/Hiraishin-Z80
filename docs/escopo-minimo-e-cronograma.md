# Hiraishin-Z80 — compromisso de entrega e plano de trabalho

## Escopo obrigatório

Computador Z80 em protoboard e PCB, com EEPROM, RAM, clock, reset, decodificação e UART. Bootloader e SO próprios; entrada e saída em terminal no computador Linux; carregamento e execução de uma aplicação interativa simples. Testes, Git, proposta, artigo, pôster, demonstração e defesa continuam no escopo.

Não basta imprimir uma mensagem fixa na ROM: o boot deve carregar e iniciar o SO, que deve carregar e iniciar um programa separado com entrada e saída.

## Campos 2, 7 e 8 — texto enxuto da proposta

### 2. Ideia em uma frase

Construir o Hiraishin-Z80, um computador de 8 bits com bootloader e sistema operacional próprios, capaz de carregar e executar uma aplicação interativa simples em texto por terminal serial.

### 7. O que vai rodar

O programa-vitrine será uma aplicação interativa simples em texto, carregada pelo sistema operacional próprio e executada no Z80, com entrada e saída pelo terminal serial. A aplicação específica ainda será escolhida; um jogo de adivinhação é uma possibilidade. O compromisso não inclui animação, Runner, vídeo dedicado, som ou controle de videogame.

### 8. Entrada e saída

- Entrada: teclado do computador de apoio com Linux, por meio do terminal serial.
- Saída: mensagens e respostas da aplicação em uma janela de terminal na tela desse computador.
- Comunicação: UART PC16550D e adaptador USB–serial TTL com níveis compatíveis. O Linux apresenta o terminal e envia binários; o Z80 executa o bootloader, o SO e a aplicação.

## Fluxo de desenvolvimento escolhido

Bootloader, primeira versão do SO e primeira aplicação em Assembly Z80. No Linux, um montador gera os binários. Boot e imagem do SO são gravados na EEPROM com gravador externo. O boot copia o SO para a RAM; o programa é enviado por serial e carregado pelo SO.

Primeiro usar comandos separados: montar, iniciar LOAD, enviar o binário e executar RUN. Não há IDE personalizada, compilador de Python no Z80 nem automação de deploy no caminho obrigatório. A ferramenta de envio necessária ao protocolo continua no escopo; nomes e formato dos comandos serão implementados e testados.

## Cronograma de trabalho — planejamento, não garantia

As janelas abaixo são metas de organização, sujeitas a disponibilidade das peças e validação. Este roteiro é uma base para discutir o campo 11, não uma declaração de que ele já foi aprovado.

| Janela | Meta e evidência |
| --- | --- |
| 20–29/10 | Fechar proposta, esquemático mínimo e BOM; conferir peças e instrumentos. Entregar proposta até 29/10 às 23h59. Preparar montador/emulação em paralelo. |
| 30/10–08/11 | Validar alimentação, clock, reset, ROM e primeira mensagem serial; testar RAM. Guardar logs e medições. |
| 09–16/11 | Copiar/iniciar SO na RAM; prompt, comandos, carga e execução de aplicação simples; repetir testes de erro e reinício. |
| Até 16/11, meta de decisão | Revisar o núcleo validado e decidir a liberação da PCB. Cotar fabricação e entrega desde o início; esta data depende do prazo confirmado pelo fornecedor. Não fabricar esquema não validado para cumprir uma data. |
| 17/11–09/12 | Fabricar, montar e testar PCB; corrigir o necessário. Consolidar esquemáticos, instruções, evidências e rascunho do artigo. Se o fornecedor não atender essa janela, ajustar fabricação com antecedência. |
| 10/12 | Checkpoint obrigatório de protoboard funcionando. Confirmar com o professor se os CIs podem ser transferidos à PCB ou se ambas devem permanecer montadas. |
| 11–13/12 | Estabilizar demonstração e ensaiar defesa. Preparar bancada, pôster e vídeo de contingência, sem iniciar extras. |
| 14/12, 19h30–22h | Mostra: partida após reset, boot, comando do SO, carga e execução da aplicação. Preparar também uma pequena alteração de código e nova carga para a demonstração exigida. |
| Até 17/12, 18h | Entregar artigo e documentação; conferir a extensão final do artigo com o professor. |

## Critério para considerar o mínimo concluído

- Partida repetível após reset, sem injeção manual do SO por depurador.
- Boot carrega o SO da EEPROM e transfere a execução para a RAM.
- Comando do SO recebe um binário, valida a carga e permite executá-lo.
- Aplicação separada lê uma entrada e escreve uma resposta; retorno ao SO definido.
- Protoboard, PCB montada/testada e material acadêmico preparados.
- Autor consegue explicar e defender o fluxo e as decisões.

## Fora do caminho obrigatório

Hiraishin Runner, VDP/VRAM/HDMI, som, GPIO/gamepad PS2, linguagem interpretada e interface de deploy. São ideias futuras, sem compra nem prazo comprometidos neste plano. Só reavaliar após a entrega principal estar concluída e documentada.

O mapa de memória é mantido. A UART usa as portas canônicas 00h–07h; as outras janelas existentes são apenas reservas sem dispositivos na montagem mínima. Os diagramas e imagens completos anteriores são preservados como histórico das expansões, não como lista obrigatória.
