# Gera Intel HEX para a ROM, binario bruto e listagem do Assembly.
# Exemplo, na raiz do projeto: .\scripts\montar.ps1
[CmdletBinding()]
param(
    [string]$Fonte = 'firmware/testes/teste-ram.asm',
    [string]$Montador = $env:SJASMPLUS
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
if (-not [System.IO.Path]::IsPathRooted($Fonte)) {
    $Fonte = Join-Path $projectRoot $Fonte
}
$sourcePath = (Resolve-Path -LiteralPath $Fonte).Path

# Um caminho informado ou SJASMPLUS permite usar outra instalacao.
if (-not $Montador) {
    $localAssembler = Join-Path $projectRoot '.tools/sjasmplus-1.24.0/sjasmplus-1.24.0.win/sjasmplus.exe'
    if (Test-Path -LiteralPath $localAssembler) {
        $Montador = $localAssembler
    } else {
        $assemblerCommand = Get-Command sjasmplus -ErrorAction SilentlyContinue
        if ($assemblerCommand) { $Montador = $assemblerCommand.Source }
    }
}
if (-not $Montador) {
    throw 'SjASMPlus nao encontrado. Consulte docs/testes/montador.md ou informe -Montador CAMINHO.'
}

$buildDirectory = Join-Path $projectRoot 'build'
New-Item -ItemType Directory -Path $buildDirectory -Force | Out-Null
$baseName = [System.IO.Path]::GetFileNameWithoutExtension($sourcePath)
$hexPath = [System.IO.Path]::ChangeExtension($sourcePath, '.hex')
$binaryPath = Join-Path $buildDirectory ($baseName + '.bin')
$listingPath = Join-Path $buildDirectory ($baseName + '.lst')

# O HEX ao lado do fonte e atualizado; BIN e LST ficam fora do versionamento.
& $Montador --cleanonerror "--hex=$($hexPath.Replace('\', '/'))" "--raw=$($binaryPath.Replace('\', '/'))" "--lst=$($listingPath.Replace('\', '/'))" $sourcePath.Replace('\', '/')
if ($LASTEXITCODE -ne 0) { throw "Montagem falhou (codigo $LASTEXITCODE). Nao carregue um HEX antigo." }
Write-Host "HEX para carregar na ROM: $hexPath"
Write-Host "Listagem com enderecos e bytes: $listingPath"
Write-Host "Binario bruto: $binaryPath"
