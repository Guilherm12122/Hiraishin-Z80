# Geração da imagem do mapa de memória

Imagem: `../proposta/mapa-de-memoria-proposta.png`.
Método: ferramenta integrada de geração de imagens; não foi usado CLI.
Conferência visual: cinco faixas, tamanhos, usos e valores de A15 correspondem ao mapa documentado.

## Prompt utilizado

Use case: infographic-diagram. Asset type: high resolution raster table to place in a Portuguese university computer architecture proposal. Generate a brand new clean minimalist landscape image on a pure white background. Title "Hiraishin-Z80 — Mapa de memória". A beautifully typeset, large, perfectly legible table with exactly FIVE columns and FIVE data rows. Navy blue sans serif typography, navy header background with white text, thin light grey grid lines, generous cell padding. Subtle cream backgrounds in first two data rows (EEPROM), subtle pale green backgrounds in last three rows (RAM). No icons or unrelated illustrations. No extra columns, arrows or electronics photographs.
Column headers verbatim: "Endereços" | "Tamanho" | "Memória" | "Uso" | "A15"
Exact row data verbatim:
"0000h–3FFFh" | "16 KiB" | "EEPROM" | "Bootloader, vetores e diagnósticos" | "0"
"4000h–7FFFh" | "16 KiB" | "EEPROM" | "Imagem do sistema operacional" | "0"
"8000h–BFFFh" | "16 KiB" | "RAM" | "SO em execução, dados e buffers" | "1"
"C000h–EFFFh" | "12 KiB" | "RAM" | "Programa carregado e seus dados" | "1"
"F000h–FFFFh" | "4 KiB" | "RAM" | "Pilha e área auxiliar" | "1"
Below table, exactly two concise lines, well spaced, legible:
"Total: 64 KiB — 32 KiB de EEPROM + 32 KiB de RAM"
"São dois chips; as linhas indicam regiões de uso."
Size the Uso column wider so all labels fit without cramping. Ensure the hexadecimal address characters are exact, never confusing 0 with O or 1 with I. Respect the order ascending addresses from top to bottom. Technical accuracy is essential. No additional rows, no watermark, no author/date. Flat professional academic figure matching a simple navy/pastel computer block diagram. All content must fit with generous white margins.
