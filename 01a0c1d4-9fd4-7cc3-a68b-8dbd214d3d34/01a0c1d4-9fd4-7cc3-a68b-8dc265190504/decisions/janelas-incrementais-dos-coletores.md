---
tags:
- coleta
- linkedin
- infojobs
- github-actions
- performance
pinned: true
tier: semantic
type: Decision
generated:
  by: process:ai-memory/2.3.2
  at: 2026-09-23T17:50:22Z
---
# Janelas incrementais dos coletores LinkedIn e InfoJobs

**Status:** accepted

## Context
A coleta roda três vezes por dia. O LinkedIn consultava até 100 páginas para cada um dos 49 termos e fazia cerca de 4.300 a 4.600 requests por rodada. O tempo normal era próximo de 1h30, mas a latência variável do endpoint guest fez algumas execuções ultrapassarem o limite de 3 horas do GitHub Actions. Uma repetição imediata com o mesmo commit terminou normalmente, o que confirmou que o volume fixo de requests amplificava a lentidão externa.

O InfoJobs também oferece filtro nativo por data. O valor `Antiguedad=1` significa “Hoje” e usa o dia do calendário, por isso pode criar uma lacuna na virada da meia-noite. O valor `Antiguedad=2` cobre os últimos 3 dias.

## Decision
As rodadas regulares usam coleta incremental:

- LinkedIn: `f_TPR=r86400` e `sortBy=DD`, ou seja, janela móvel das últimas 24 horas com as vagas mais recentes primeiro. O teto de 100 páginas por termo permanece apenas como proteção.
- InfoJobs: `Antiguedad=2` em todas as páginas, tanto nas buscas textuais quanto nos filtros nativos. A janela cobre os últimos 3 dias.
- O banco consolidado preserva as vagas das rodadas anteriores. As janelas limitam somente a descoberta de anúncios novos.

O endpoint do LinkedIn aceitou `f_TPR=r259200` para três dias, mas essa opção não foi adotada nas rodadas regulares. A janela maior aumentaria novamente a paginação. Como há três coletas por dia, 24 horas já fornecem sobreposição suficiente para falhas isoladas.

## Consequences
A coleta faz menos requests e fica menos vulnerável à variação de latência dos portais. O InfoJobs mantém uma margem de três dias entre execuções.

Se nenhuma coleta do LinkedIn terminar com sucesso por mais de 24 horas, anúncios publicados no intervalo podem não ser descobertos. Não existe fallback automático para esse caso. Uma recuperação deve usar temporariamente uma janela maior e deve ser validada antes da próxima publicação.

Foram rejeitadas duas alternativas: continuar relendo todo o histórico em cada rodada, por causa do custo de milhares de requests; e usar três dias no LinkedIn em todas as rodadas, porque isso reduziria o ganho de desempenho.