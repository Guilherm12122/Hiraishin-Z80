# Primeiro envio Z80 → Arduino → terminal

Estado: o autor confirmou nesta conversa a exibicao da letra A no terminal
em 03/11/2026. Validacao manual no SimulIDE; ainda sem captura versionada.
Nao comprova funcionamento eletrico do hardware fisico.

## Arquivos e reproducao

- Circuito: `simulacao/hiraishin-serial-tx.sim1`.
- Z80: `firmware/testes/teste-serial-tx.asm` e `.hex`.
- Uno: `firmware/arduino/serial-tx/serial-tx.ino` e `.ino.hex`.

Com a simulacao parada, carregar o HEX Z80 como Intel HEX na ROM e o
`serial-tx.ino.hex` como firmware do Uno. A copia versionada do circuito
inclui os 12 bytes do teste na ROM e uma referencia relativa ao firmware.
Conferir a carga do Uno ao abrir em outra maquina.

Usar Z80 em 1 kHz, Uno em 16 MHz e terminal em 9600 baud, 8N1.
Abrir o terminal e iniciar uma nova simulacao. Esperado: uma letra A;
Z80 em HALT com A=41h e PC=000Ah. Reiniciar para repetir.

## Ligacoes

- Z80 A5/A6/A7 → A0/A1/A2 do 74HC138.
- /IORQ → /E1; /WR → /E2; /M1 → E3.
- /Q0 e A0 do Z80 → OR → inversor → IE do latch e D10 do Uno.
- Z80 D0–D7 → entradas 0–7 do latch.
- Saidas 0–7 do latch → D2–D9 do Uno, respectivamente.
- Latch com Trigger=Enable; serial do Uno ligada ao terminal.

O Z80 espera aproximadamente 0,4 s a 1 kHz e executa OUT (00h),A com
A=41h. O latch fica transparente durante IE alto e retem o byte ao terminar
a escrita. O Arduino detecta por polling IE alto seguido de baixo, le o
latch e usa Serial.write para transmitir o byte, exibido como A em ASCII.
A decodificacao parcial tambem aceita outras portas pares da janela 00h–1Fh;
o software deste teste usa somente 00h.

## Compilacao e limites

Uno compilado com Arduino CLI, plataforma arduino:avr 1.8.6 e FQBN
arduino:avr:uno: 1862 bytes de flash e 185 bytes de RAM estatica.

```sh
arduino-cli core install arduino:avr@1.8.6
arduino-cli compile --fqbn arduino:avr:uno --output-dir build/serial-tx firmware/arduino/serial-tx
```

O HEX Z80 foi codificado diretamente a partir das instrucoes do fonte:
`F3 06 20 10 FE 3E 41 D3 00 76 18 FE`. Nao foi gerado por montador nesta
etapa. Checksums e comprimentos dos registros Intel HEX foram conferidos.

Este e um teste isolado de um byte, sem handshake de confirmacao. O polling
pode perder pulsos com clock mais alto ou envio rapido; nao valida mensagens
continuas, recepcao pelo Z80, bootloader ou SO. O eco serial anterior do Uno
foi relatado pelo autor, mas seu firmware original Windows nao foi recuperado.

O teste anterior de copia ROM→RAM tambem foi preservado em
`firmware/testes/teste-copia-ram.asm` e `.hex`. Seus comentarios descrevem a
rotina de oito bytes; nao ha evidencia adicional de execucao anexada aqui.
