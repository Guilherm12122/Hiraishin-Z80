# Componentes e compras no Google Drive

Esta pasta contém a referência para a planilha externa de componentes. Consulte o índice do projeto em `../README.md` para o escopo vigente.

- Pasta: https://drive.google.com/drive/folders/1b4xrnw7_hvnmJILwk8GdOSu_8srhO8-z
- Planilha nativa: https://docs.google.com/spreadsheets/d/18HAv2fX90gUr8blsECXT2otFXQS_czm7yxga7eUtVMo/edit
- Criada em 20/10/2026 dentro da pasta IFSP indicada pelo autor.

Abas: Orientacoes, Minimo, Diferenciais, Bancada e PCB. As abas de itens têm quantidade prevista, compras informadas, estado de definição, função e referências técnicas.

Compras registradas: 1 Z80, 1 SRAM e 2 protoboards; tela HDMI informada como disponível. Compra não significa recebimento ou teste. Os outros itens estão como não informados, não como compras realizadas.

Lista de planejamento, não BOM elétrica final liberada para compra. Driver de clock NMOS, reset, lógica auxiliar, níveis e componentes de interface ainda dependem do esquemático. Não existem preços ou prazos cotados nesta versão.

O arquivo componentes-planejamento-inicial.json preserva o conteúdo inicial. Edições futuras feitas diretamente na planilha não são sincronizadas automaticamente com o Git. Não altera as respostas da proposta nem as permissões de compartilhamento.

## Alinhamento ao mínimo obrigatório

Orientacoes!B2 e B10 e Bancada!J11 foram atualizadas para reforçar o compromisso apenas com o núcleo serial, aplicação simples e fluxo inicial em Assembly Z80 no Linux. Montar, LOAD, enviar e RUN serão etapas separadas; IDE personalizada e deploy automático ficam fora do mínimo. A aba Diferenciais é inventário de possibilidades, não lista de compra obrigatória. Quantidades, compras, demais células e compartilhamento foram preservados. O JSON inicial não foi reescrito como se fosse um retrato atualizado automaticamente.
