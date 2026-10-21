---
kind: procedure
abstract: "Referências e arquitetura atuais: .agents, Test Plans, Playwright nativo, Compose único, isolamento por teste e bootstrap real separado."
tags:
- playwright
- frontend
- api
- runtime
- agents
- ci
tier: procedural
type: Procedure
generated:
  by: process:ai-memory/3.0.0
  at: 2026-10-21T17:16:07Z
---
# Padrões de automação Playwright do Rocket

Referências canônicas: `AGENTS.md`, `README.md` e as skills em `.agents/skills/` do repositório `rocket-web_automation`. `CLAUDE.md` importa `AGENTS.md`. Conferido na master em 2026-10-21; a migração das skills está no commit `b822f4e` e a revisão do README em `47317a3`. Consulte os arquivos atuais antes de implementar; esta página é um resumo, não outra fonte de regras.

## Cenários e implementação

- Azure Test Plans é a fonte dos cenários novos. Os arquivos Cucumber `.feature` em `specs/web`, `specs/api` e `specs/db` são legado mantido por tempo indeterminado; novos testes Playwright não exigem criar ou alterar esse legado.
- `tests/api` espelha o endpoint depois de `/api`; `tests/front` e `pages` espelham rotas da interface; `tests/db` cobre persistência observável e `tests/e2e` jornadas completas. Partes internas de páginas usam `.section.ts`.
- As três entradas de fixtures são `api.fixture.ts`, `frontend.fixture.ts` e `database.fixture.ts`. Services concentram lógica de suporte; data concentra massas. Cada teste cria identidades e recursos próprios e limpa somente o que criou.
- Specs orquestram passos observáveis, sem helpers, `if` ou `const` internos, exceto variável de iteração em `for`. As convenções completas de seletores e camadas ficam no AGENTS e na skill `rocket-playwright-test-authoring`.

## Execução local e CI

- Um Compose na raiz prepara API, site, banco e fronteiras simuladas compartilhadas. Local e CI usam a mesma configuração Playwright e os mesmos mocks; tags `@sandbox-*` são filtros de domínio, não stacks adicionais.
- `test:all` inclui os funcionais e dependências reais `@llm`, excluindo `@carga` e `@slo`. LLM exige o perfil `llm`, integrações reais e cotações preparadas; preços comerciais não são fixados pelos testes.
- `test:ci:api` e `test:ci:frontend` selecionam somente smoke/sanity e excluem `@llm`, `@carga` e `@slo`.
- Para reproduzir as opções de CI no runner: `docker compose exec -T -e CI=true playwright-runner npm run test:ci:api` ou o equivalente `test:ci:frontend`. `CI=true` define por padrão um worker, dois retries e `forbidOnly`; não transforma `test:all` em seleção smoke/sanity.
- Os projetos normais `api`, `db`, `frontend` e `e2e` são paralelos. Os projetos finais `api-configuracao` e `frontend-configuracao` executam sequencialmente os casos de flags: recriam/restauram a mesma API, não outra stack por cenário.
- No host, os padrões do Compose são API 18080, PostgreSQL 18081 e site 18082; `.env.example` contém os endpoints dos mocks. API/site manuais em 3001/3000 não substituem esse ambiente para all/CI.
- Real LLM tem retry nativo de cenário completo com fixtures novas. Carga/capacidade usam comandos próprios. `--list`, unitários de runtime e typecheck não comprovam aprovação funcional nem execução real no Azure.

## Autenticação e referências

Identidades sintéticas são exclusivas por teste, com roles `admin`/`default`; a API real continua validando assinatura, tenant, audience e autorização. O emissor de teste não valida MFA ou Conditional Access corporativo.

Bootstrap Microsoft pessoal é reservado a cenários que exigem conta real em ambiente autorizado. É preciso remover `MOCK_ENTRA_TOKEN_URL` do .env e do terminal, apontar API/WEB/PG e identificadores Azure ao mesmo ambiente e usar `E2E_AUTH_MODE=bootstrap`; a fixture principal exige admin. Sessões pessoais não entram em Git, imagens, relatórios ou CI.

Para instruções completas, consulte as skills `rocket-playwright-auth`, `rocket-playwright-config`, `rocket-playwright-test-authoring`, `rocket-test-plans` e `rocket-spec-authoring` (esta última apenas para manutenção explicitamente solicitada do legado).
O formato e a associação dos casos são resumidos em [[_rules/azure-test-plans-case-format.md]].
