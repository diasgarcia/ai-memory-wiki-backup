---
tags:
- sqlite
- release
- kaggle
- pages
- pipeline
tier: semantic
type: Note
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-22T04:20:15Z
---
# Fluxo de dados e publicação

A coleta consulta nove portais três vezes por dia por disparo externo; também aceita execução manual. O fluxo consolida vagas no SQLite local, enriquece descrições, classifica áreas e extrai habilidades. `data/` é ignorada pelo Git: `git pull` atualiza código, não o banco.

A release GitHub `latest` é o snapshot operacional. Ela contém `vagas.db`, `vagas.csv` e `snapshot.json`, que registra hashes e o hash da base anterior. `scripts/release_snapshot.py download` verifica e instala a base; `publish` compara a origem remota antes do upload e confirma o snapshot após publicar. Essa verificação detecta base desatualizada, mas não é trava remota para comandos locais.

O Kaggle recebe Parquet como réplica da release; falha no Kaggle não desfaz a publicação no GitHub, e `publish_kaggle.yml` pode repetir só a réplica. O Pages gera uma API JSON estática e o painel a partir do banco da release. Nas coletas, relatório e gráficos do README mudam na terceira rodada ou em execução manual; os JSONs do painel são atualizados em toda rodada.

Referências verificadas em 22/09/2026: `docs/execucao-rapida.md`, `docs/arquitetura.md` e `.github/workflows/daily_scraper.yml`.