# Montar Assembly Z80 no Windows

Usamos o [SjASMPlus oficial](https://github.com/z00m128/sjasmplus), versao
1.24.0, como ferramenta portatil. Nao precisa de instalador ou alteracao do PATH.

A distribuicao Windows foi extraida localmente em
`.tools/sjasmplus-1.24.0/sjasmplus-1.24.0.win/`. Essa pasta e ignorada pelo Git.
Em outra maquina, baixar `sjasmplus-1.24.0.win.zip` na
[release oficial](https://github.com/z00m128/sjasmplus/releases/tag/v1.24.0)
e extrair com essa estrutura, ou informar outro caminho ao script.

SHA-256 do ZIP oficial consultado:
`7e1f8840842039bdb97e51a59abda2e5c25a9da160097e8f79a62583ab72d0e0`.

## Uso

No PowerShell, na raiz do projeto:

```powershell
.\scripts\montar.ps1
```

Para outro fonte ou outra instalacao:

```powershell
.\scripts\montar.ps1 -Fonte firmware/testes/teste-ram.asm -Montador C:\Ferramentas\sjasmplus.exe
```

Tambem e possivel definir a variavel de ambiente `SJASMPLUS` ou usar o
executavel disponivel no PATH. O script nao altera a politica de execucao
do PowerShell.

## O que e gerado

- `firmware/testes/teste-ram.hex`: imagem Intel HEX, atualizada a partir do
  fonte salvo. Carregar na ROM pelo SimulIDE, com a simulacao parada.
- `build/teste-ram.bin`: os bytes de maquina sem o envelope Intel HEX.
- `build/teste-ram.lst`: fonte, enderecos e bytes lado a lado para estudo.

O script nao carrega o simulador nem faz commit ou push. Depois de cada
alteracao no Assembly: salvar, montar sem erros e recarregar o HEX na ROM.
Editar o ASM sozinho nao atualiza a ROM que ja esta aberta no SimulIDE.

## Como repetir a falha controlada

Alterar a primeira comparacao para `CP 054h`, mantendo `LD A,055h`
na gravacao, montar e recarregar o HEX. Essa versao deve levar a A=FFh e RAM[8001h]=FFh.
Isso e um teste do caminho de falha, nao evidencia de defeito na RAM.
Para retornar ao teste normal, restaurar `CP 055h`, montar e recarregar.
O autor confirmou esse ciclo em 30/10/2026; a versao salva no repositorio
esta restaurada para o teste normal.
