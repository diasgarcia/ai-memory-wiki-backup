---
tags:
- playwright
- frontend
- padrões
tier: procedural
type: Procedure
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-21T14:48:58Z
---
# Padrões de automação Playwright do Rocket

Referência canônica: `AGENTS.md` do repositório `rocket-web_automation` e o skill `.opencode/skills/rocket-playwright-test-authoring/SKILL.md`; consultar a versão atual antes de editar testes.

- Specs em `tests/front` espelham a rota; `pages` concentra ações/assertivas de tela e usa `.section.ts` para partes internas, `fixtures` injeta dependências, `data` fornece massas e `services/mocks/api` espelha endpoints simulados.
- A spec apenas orquestra passos observáveis. Não declarar `const` nela, salvo variável de iteração em `for`; não usar `if` na spec. Variações de comportamento ficam em cenários separados; dados e lógica de suporte ficam fora da spec.
- Para teste funcional de UI sem credenciais Microsoft Entra, mockar o contrato HTTP necessário e validar a reação da tela; não confundir essa cobertura com teste da integração real com a Microsoft.
- Preservar tags existentes, não usar sleeps forçados, não versionar `playwright/.auth/` nem cache; rodar checagem de tipos e teste focal antes de entregar quando o ambiente permitir.