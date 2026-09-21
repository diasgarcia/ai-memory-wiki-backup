---
tags:
- rocket
- git
- branches
- commits
- pull-requests
- playwright
tier: procedural
type: Procedure
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-21T18:31:58Z
---
# Padrão de branches, commits e PRs no Rocket

Nos trabalhos dos repositórios Rocket (automação, API e site), Rafael usa a branch `feature-dev/<id-da-us>_rafael.garcia` para suas alterações. Organize commits por mudança lógica, com título claro no estilo `test(escopo): ...`, `feat(escopo): ...` ou `fix(escopo): ...`; corpo explicativo quando ajudar na revisão. Separe responsabilidades distintas, sem criar commits artificiais para uma alteração única.

Para automatizar uma PR de produto: identificar repositório, branch, US e diff reais; evitar duplicar cobertura de uma PR já tratada; trocar para a branch correta e atualizar o Docker quando a validação integrada exigir; implementar cenários observáveis segundo o `AGENTS.md` e skill de Playwright atuais; rodar typecheck e testes focais quando possível. Em mudanças sequenciais, verificar a ancestralidade das branches para manter cada entrega isolada e revisar o diff da PR resultante.

Quando o pedido incluir publicação, fazer push de `feature-dev/<id-da-us>_rafael.garcia` e abrir PR para a branch `feature/...` correspondente no repositório de automação. Descrição clara e vínculo `AB#<id>`. Conferir branch, destino e diff antes de publicar. O `AGENTS.md` exige apresentar plano de arquivos/commits antes de staging ou commit e não commitar automaticamente. Este registro descreve o formato de trabalho; não autoriza por si só commit, push, criação ou merge de PR sem pedido do usuário.