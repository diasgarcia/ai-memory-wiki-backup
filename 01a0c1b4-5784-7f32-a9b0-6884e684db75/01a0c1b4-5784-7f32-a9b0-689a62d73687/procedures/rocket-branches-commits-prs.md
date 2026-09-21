---
tags:
- rocket
- git
- branches
- commits
- pull-requests
tier: procedural
type: Procedure
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-21T14:23:30Z
---
# Padrão de branches, commits e PRs no Rocket

Nos trabalhos dos repositórios Rocket (automação, API e site), Rafael usa a branch `feature-dev/<id-da-us>_rafael.garcia` para suas alterações. Organize commits por mudança lógica, com título claro no estilo `feat(escopo): ...` ou `fix(escopo): ...` e corpo que explique o que mudou e por quê quando isso ajudar na revisão. Separe responsabilidades distintas, mas não crie commits artificiais para uma alteração única e coesa.

Quando o pedido incluir publicação, faça push dessa branch e abra PR para a branch `feature/...` correspondente no repositório correto. Escreva uma descrição clara e vincule a US com `AB#<id>`. Confira branch, destino e diff antes de publicar. Este registro descreve o formato de trabalho; não autoriza por si só commit, push, criação ou merge de PR sem solicitação do usuário.