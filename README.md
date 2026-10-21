# Hiraishin-Z80

Computador de 8 bits de Guilherme de Oliveira Ribeiro, desenvolvido individualmente para o Projeto Garagem / 2026 Computer Faire & Arcade Expo.

Plataforma escolhida: Z80. Compromisso de entrega: computador funcional em protoboard e PCB, bootloader e sistema operacional próprios, com carregamento e execução de uma aplicação interativa simples em texto pela serial. Computador de apoio com Linux para desenvolvimento e terminal; execução do SO e da aplicação no Z80.

Prioridade definida em 17/10/2026: primeiro concluir o mínimo entregável com Z80, ROM, RAM e terminal serial — boot próprio, SO com comandos e carga/execução de programa interativo. Protoboard, PCB e entregas acadêmicas continuam no escopo. Vídeo, HDMI, som, controle PS2 e jogo gráfico são expansões posteriores, sem bloquear essa primeira entrega. Os critérios de aceite estão no HTML do campo 4.

O Hiraishin Runner também é um diferencial, não a aplicação obrigatória do mínimo. Só será desenvolvido se houver tempo após concluir a entrega principal. O programa mínimo específico ainda será escolhido; adivinhação é uma possibilidade. As respostas dos campos 2, 7 e 8 estão em [docs/respostas.txt](docs/respostas.txt).

Escopo obrigatório consolidado em [escopo mínimo e cronograma](docs/escopo-minimo-e-cronograma.md): Assembly Z80 no Linux para boot, SO inicial e primeira aplicação; montagem e envio por comandos separados. IDE personalizada e deploy automático não são requisitos.

## Documentação

Compras informadas em 17/10/2026: 1 processador Z80, 1 RAM principal e 2 protoboards de 830 pontos. Modelos discutidos e pendências de inspeção estão registrados no HTML. Compra não significa recebimento nem teste concluído.

- [Campo 4: arquitetura definida e guia de estudo](docs/campo-4-arquitetura.html): resposta, mapas, decodificação, exemplos e perguntas de defesa.
- [Campos 5 e 6: bootloader e sistema operacional](docs/campos-5-e-6-bootloader-e-so.html): guia do reset ao programa, perguntas de revisão e respostas sugeridas para a proposta.
- [Diagrama atual da proposta: mínimo obrigatório](docs/diagrama-minimo.svg).
- [Diagrama completo anterior, versão 1.0](docs/diagrama-oficial.svg): histórico das possibilidades de expansão, fora da entrega obrigatória.
- [Diagrama de blocos e guia de estudo do campo 4](docs/arquitetura-para-estudo.html): abrir o arquivo em um navegador.

O arquivo `campo-4-arquitetura.html` usa o diagrama mínimo atual. Os guias e as imagens completos anteriores são mantidos como histórico. Diagramas de blocos não são esquemáticos elétricos validados nem listas liberadas para compra. Testes e revisão elétrica precedem a fabricação.

Este é um repositório independente, com histórico próprio. Referências externas utilizadas serão citadas, preservando a autoria dos respectivos projetos.
