---
tags:
- test-plans
- playwright
- formato
tier: procedural
type: Rule
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-22T14:18:56Z
---
# Padrão dos casos no Azure Test Plans do Rocket Web Automation

Ao entregar casos para cadastro no Test Plans, usar o título exatamente igual ao nome do `test(...)` Playwright quando houver automação, sem prefixos, sufixos ou tags no título. Informar a suíte/pasta do Test Plans separadamente; se a pasta não tiver sido confirmada, indicar que é sugestão, não fato.

Informar as tags do domínio e as mesmas classificações relevantes do teste Playwright (por exemplo `api`, `db`, `sanity`, `contrato`, `admin`, `permissao`), usando o nome da tag no campo Tags do Azure DevOps.

No Summary/Description, escrever em português, em linhas curtas: `Como ...`, `Quero ...`, `Para ...`, e `Automação: tests/.../<arquivo>.spec.ts`. Não inventar parâmetros quando o teste não for parametrizado.

Nos Steps, usar uma linha por passo na coluna Action, com palavras-chave Gherkin `Given`, `And`, `When`, `Then`; formular condições e resultados observáveis fielmente ao teste. Não enviar tabela Markdown nem um bloco `.feature` como substituto dos passos. Evitar detalhes internos não verificados e não agrupar cenários diferentes no mesmo Test Case.

Este formato foi confirmado pelo usuário em capturas de um Test Case existente em 2026-09-22.