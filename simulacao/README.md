# Simulação no SimulIDE

## Núcleo do Hiraishin-Z80

`hiraishin-nucleo.sim1` é o circuito montado pelo autor com componentes
genéricos: Z80, ROM e RAM de 32 KiB, decodificação por portas e analisador
lógico. Ele ainda está em preparação e não representa um esquemático físico
validado. O clock inicial de estudo está em 1 kHz.

O [primeiro teste pontual de RAM](../docs/testes/teste-ram.md) tem
[fonte Assembly](../firmware/testes/teste-ram.asm) e
[imagem Intel HEX](../firmware/testes/teste-ram.hex). O teste ainda não foi
carregado nem executado nesse circuito.

## Exemplo Z80 do SimulIDE — correção local

Origem: examples/Micro/Z80/z80-mini.sim1, distribuído com SimulIDE 1.1.0-SR2 Win64.
Este circuito é um exemplo de diagnóstico com LCD, não o núcleo final do Hiraishin-Z80.

Arquivo de uso: z80-mini-corrigido.sim1.

Alterações:
- Conectados PORT A bit 0 ao RS e bit 2 ao Enable do LCD.
- Seleção de PORT A: /IORQ ativo e A0=0; PORT B: /IORQ ativo e A0=1.
- Memórias configuradas para operação assíncrona e saídas sem coletor aberto.
- Textos copiados para 0130h, 0140h e 0150h, endereços usados pelo código original.
- Barramento de endereços ampliado para incluir A15 nas portas que usam A8–A15 durante OUT. A tentativa de usar diretamente o barramento de dados não foi mantida nesta cópia.
- Clock mantido em 1 MHz; programa original preservado, exceto o preenchimento dos textos nesses endereços.

A mensagem Testing sound.. é apenas texto do programa: esta cópia não possui hardware de áudio.
A simulação não valida as características elétricas do Z80 NMOS ou a interface serial do projeto.

z80-mini-diagnostico.sim1 preserva um ensaio intermediário sem resultado funcional e não deve ser usado como referência.

## Resultado observado

Em 28/10/2026, no SimulIDE instalado, foi observada a mensagem Hello Z80! no LCD a 1 MHz. As demais mensagens não apareceram durante a observação; a sequência completa do programa original ainda requer diagnóstico. Isso comprova a primeira saída, não a validação integral do exemplo, da RAM ou do projeto Hiraishin.
