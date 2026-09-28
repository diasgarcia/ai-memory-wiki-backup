---
tags:
- test-plans
- playwright
- formato
- smoke
- sanity
- pipeline
pinned: true
tier: procedural
type: Rule
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-28T14:50:28Z
---
# Padrão dos casos no Azure Test Plans do Rocket Web Automation

Ao entregar casos para cadastro no Test Plans, usar o título exatamente igual ao nome do `test(...)` Playwright quando houver automação, sem prefixos, sufixos ou tags no título. Informar a suíte/pasta do Test Plans separadamente; se a pasta não tiver sido confirmada, indicar que é sugestão, não fato.

Sempre que for criado um teste novo classificado como `@smoke` ou `@sanity`, criar também o Test Case correspondente no Azure Test Plans. O nome do `test(...)` no Playwright e o título do Test Case devem ser exatamente iguais, incluindo acentuação, espaços e capitalização. O teste também precisa estar apto a executar na pipeline automática normal, sem depender de uma classificação ou requisito que o filtro da pipeline exclua. Atualmente essa obrigatoriedade se aplica apenas a testes `@smoke` e `@sanity`.

Informar as tags do domínio e as mesmas classificações relevantes do teste Playwright (por exemplo `api`, `db`, `sanity`, `contrato`, `admin`, `permissao`), usando o nome da tag no campo Tags do Azure DevOps.

No Summary/Description, escrever em português, em linhas curtas: `Como ...`, `Quero ...`, `Para ...`, e `Automação: tests/.../<arquivo>.spec.ts`. Não inventar parâmetros quando o teste não for parametrizado.

Nos Steps, usar uma linha por passo na coluna Action, com palavras-chave Gherkin `Given`, `And`, `When`, `Then`; formular condições e resultados observáveis fielmente ao teste. Não enviar tabela Markdown nem um bloco `.feature` como substituto dos passos. Evitar detalhes internos não verificados e não agrupar cenários diferentes no mesmo Test Case.

Este formato foi confirmado pelo usuário em capturas de um Test Case existente em 2026-09-22. A obrigatoriedade de cadastrar casos novos `@smoke` e `@sanity`, manter o título idêntico e garantir execução na pipeline automática foi confirmada pelo usuário em 2026-09-28.