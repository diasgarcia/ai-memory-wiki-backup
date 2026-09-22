---
tags:
- linkedin
- modalidade
- classificacao
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-22T04:18:14Z
---
# Classificação de modalidade das vagas do LinkedIn

Em 22/09/2026, a busca guest e a página pública do LinkedIn sem login quase nunca expunham a etiqueta oficial de modalidade: no snapshot examinado, apenas 1 de 3.926 vagas LinkedIn tinha `workplace_declared=1`. Um teste com Chrome/Playwright sem login também não exibiu a etiqueta. Isso não diz se a interface autenticada a disponibiliza.

O código em `scraper/models.py` preserva a etiqueta oficial quando capturada. Para vagas sem ela, a descrição enriquecida pode trazer metadados do portal de origem (`work model onsiteonsite` ou `hybridhybrid`), escala com dias presenciais e home office, ou declaração explícita de trabalho presencial. O ajuste está no commit `3757517`.

A varredura do snapshot de 22/09/2026 analisou todas as 2.075 vagas LinkedIn então marcadas como `Não informado`. A reclassificação local corrigiu 58 para Presencial e 14 para Híbrido; uma vaga marcada Remoto voltou a `Não informado`, pois `home office para mamães` era apenas um benefício. As 2.004 restantes não tinham evidência suficiente para inferência segura. Menções a suporte remoto, atendimento presencial, visitas a clientes, benefícios de escritório ou presença em 2–3 dias sem informação dos demais dias não determinam sozinhas a modalidade. Cidade isolada também não prova presencialidade.

A correção foi publicada na release `latest`, no Kaggle (versão 74) e no GitHub Pages em 22/09/2026. Não houve alteração de skills nem necessidade de reextraí-las.