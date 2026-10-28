# Hiraishin-Z80

Projeto individual de Guilherme de Oliveira Ribeiro para o Projeto Garagem do IFSP: construir um computador didático de 8 bits baseado no Z80.

## Escopo atual

Prioridade: concluir um computador funcional em protoboard, desenvolver bootloader e sistema operacional próprios, carregar e executar uma aplicação interativa simples pela serial e produzir a PCB do núcleo. O terminal roda no computador Linux de apoio; o SO e a aplicação executam no Z80. Vídeo, som, controle PS2 e jogo de plataforma autoral são diferenciais opcionais, depois de validar o mínimo.

## Comece por aqui

- [Proposta final em PDF](docs/proposta/proposta.pdf)
- [Fonte LaTeX da proposta](docs/proposta/proposta.tex)
- [Respostas e decisões dos campos](docs/proposta/respostas.txt)
- [Guia da arquitetura, mapas e decodificação](docs/arquitetura/guia-arquitetura.html)
- [Diagrama mínimo do núcleo](docs/arquitetura/diagrama-minimo.svg)
- [Guia de estudo do campo 4](docs/estudo/arquitetura-para-estudo.html)
- [Bootloader e sistema operacional](docs/estudo/bootloader-e-sistema-operacional.html)
- [Componentes e compras no Google Drive](docs/componentes/README.md)
- [Escopo mínimo e cronograma de desenvolvimento](docs/README-escopo.md)

## Estrutura

```text
docs/
├── proposta/       # PDF, fonte, respostas e figuras usadas na proposta
├── arquitetura/    # diagramas e documentação técnica do núcleo
├── estudo/         # material didático para compreender e defender o projeto
├── componentes/    # referência para planilha externa de compras
├── arquivo/        # históricos e material de apoio não vigente
└── README-escopo.md
hardware/
└── rascunhos/      # arquivos elétricos ainda não validados
tests/              # verificações automatizadas dos dados de arquitetura
```

## Estado e cuidados

- A arquitetura em blocos e os mapas são conceituais; ainda não são um esquemático elétrico liberado para montagem ou fabricação.
- A primeira opção para E/S serial é uma interface baseada no Arduino Uno/ATmega328P; o Z80 SIO/2 é contingência a avaliar.
- O arquivo em `hardware/rascunhos/` descreve uma tentativa antiga com PC16550D. Ele não representa a decisão serial atual e não deve ser montado sem revisão.
- A planilha do Drive é a referência de compras mais recente; o JSON arquivado é uma cópia inicial e não sincroniza alterações da planilha.
- Compra ou recebimento de componente não significa que foi testado.

As decisões serão registradas no Git à medida que o projeto evoluir. Referências externas e projetos de terceiros devem ser citados.
