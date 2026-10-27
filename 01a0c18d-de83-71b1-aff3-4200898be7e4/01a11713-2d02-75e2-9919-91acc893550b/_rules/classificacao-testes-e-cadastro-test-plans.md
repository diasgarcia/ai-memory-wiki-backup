---
kind: rule
tags:
- testing
- smoke
- sanity
- regressao
- llm
- test-plans
pinned: true
tier: procedural
type: Rule
generated:
  by: process:ai-memory/3.0.0
  at: 2026-10-27T16:16:15Z
---
# Classificar os cenários antes de automatizar e limitar novos Test Cases

Preferência expressa de Rafael para suas automações: avaliar a finalidade, o risco e as dependências de cada cenário antes de escolher as tags. Não classificar toda nova cobertura como smoke/sanity nem usar essas tags apenas para entrar na CI ou gerar cadastro no Test Plans.

- Smoke: disponibilidade e jornadas críticas essenciais do sistema.
- Sanity: verificação enxuta da saúde básica da feature após uma mudança.
- Regressão: cobertura ampliada, casos de borda e efeitos colaterais; não precisa entrar toda na CI.
- LLM e integração externa: marcar quando houver dependência real dessas integrações. São características adicionais, não substitutos das classificações de nível.

Nos projetos que utilizam Azure Test Plans, por enquanto criar novos Test Cases somente para smoke e sanity, com título exatamente igual ao teste automatizado e associação real com a automação. Não criar automaticamente casos de regressão ou outras classificações sem novo pedido. Preservar os casos já existentes, inclusive os que forem reclassificados, sem apagar ou duplicar por esse motivo.

Seguir os filtros e as instruções canônicas de cada projeto; não alterar a classificação só para contornar a seleção da pipeline.