---
tags:
- qualidade
- deduplicacao
- skills
- testes
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-22T04:20:15Z
---
# Curadoria, deduplicação e validação

A amostra acompanha anúncios de estágio, aprendiz, trainee e nível júnior em tecnologia; não representa todas as vagas de TI do Brasil. Uma habilidade extraída é menção no anúncio, não prova de contratação. Valores ausentes não são convertidos automaticamente em Júnior, Presencial ou Brasil.

A deduplicação usa primeiro `source + external_id`, URL exata e ID no link. O fallback textual só combina fontes diferentes quando título e empresa são compatíveis, a cidade coincide e as datas de publicação distam até sete dias. IDs diferentes da mesma fonte não são fundidos apenas por texto.

Descrições válidas já salvas são preservadas quando a nova resposta é ausente ou pior. Skills usam título e descrição preservada e taxonomia em `scraper/rules/skills.yml`. A reextração global de skills é manutenção deliberada, não etapa diária. `enrich_encerrada` é legado para item resolvido; não indica necessariamente que a candidatura terminou.

A validação local usa `python -m ruff check .` e `python -m pytest -q`; testes simulam HTTP e usam SQLite temporário. Referências verificadas em 22/09/2026: `README.md`, `docs/arquitetura.md` e `docs/execucao-rapida.md`.