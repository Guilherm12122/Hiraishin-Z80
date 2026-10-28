# Imagem do mapa de E/S

Arquivo: `../proposta/mapa-de-es-proposta.png`.
Método: geração integrada de imagens, sem CLI.
Conferência visual: seis linhas, três colunas; códigos e portas canônicas compatíveis com o HTML e o diagrama. Sem indicação de etapas, conforme solicitado. Espelhos de decodificação não listados; explicação permanece no HTML. Espaço de E/S separado da memória.

## Prompt utilizado

Use case: infographic-diagram.
Asset: a brand new high-resolution raster table image for the Portuguese Hiraishin-Z80 university proposal, visually matching a clean navy/pastel memory-map table.
Style: pure white background, landscape, large navy sans-serif typography, navy blue table header with white labels, very thin light grey grid lines, generous margins and cell padding, subtle pale blue row fills. Flat professional academic figure, no icons, gradients, photographs or decorative illustrations. Perfectly readable.
Title verbatim: "Hiraishin-Z80 — Mapa de E/S"
Exactly THREE columns with headers verbatim: "Endereços" | "Componente" | "Função"
Exactly SIX data rows, in the following ascending order. Render all text verbatim and accurately:
"00h–07h" | "Serial · PC16550D" | "Comunicação serial"
"20h" | "Vídeo · TMS9918A" | "Leitura e escrita de dados gráficos"
"21h" | "Vídeo · TMS9918A" | "Escrita de controle / leitura de status"
"40h" | "Som · SN76489AN" | "Escrita de comandos de som"
"60h–62h" | "GPIO · 82C55A" | "Entrada e saída pelas portas A, B e C"
"63h" | "GPIO · 82C55A" | "Configuração das portas"
Make Função column the widest; allow natural line breaks within long cells if needed, without overflowing or overlapping any text. Endereços column should be wide enough for 00h–07h and 60h–62h. Technical chip codes must be exact: PC16550D, TMS9918A, SN76489AN, 82C55A. Hexadecimal addresses use zero digits, never letter O. Address ranges above are the canonical software ports of a separate I/O address space and are NOT RAM addresses.
No extra columns, no stage indicators, no minimum-delivery indicators, no expansion labels, no legend, no footnotes, no author/date, no explanatory paragraphs, no reserved/unused rows, no watermark. Only title and the specified table. Do not insert other ports or change the component models.
