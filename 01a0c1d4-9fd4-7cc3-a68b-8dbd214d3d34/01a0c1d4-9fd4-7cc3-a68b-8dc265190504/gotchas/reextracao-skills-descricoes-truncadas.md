---
abstract: A reextração global substitui os vínculos usando o texto atual. Descrições truncadas ou coladas pelo HTML podem apagar skills válidas; a comparação das remoções permite distinguir perdas de evidência de falsos positivos.
tags:
- skills
- reextracao
- qualidade-dados
tier: semantic
type: Gotcha
generated:
  by: process:ai-memory/2.6.0
  at: 2026-10-08T04:49:20Z
---
# Reextração de skills com descrições incompletas

Observação confirmada na revisão de 08/10/2026, associada aos commits e830fd9 e 8786241.

`scripts/reextract_all_skills.py` recalcula os vínculos a partir do título e da descrição atuais e remove vínculos que não aparecem no novo resultado. Uma skill ausente nessa reextração não prova que o vínculo antigo era falso: a descrição atual pode estar truncada ou com palavras coladas pelo HTML.

Casos confirmados nessa base:

- Vaga interna 8135, AUX. DE SUPORTE T.I: descrição truncada; foram preservados os vínculos anteriores de Windows, Sistemas Operacionais e Montagem e Manutenção de PCs.
- Vaga interna 8145, Assistente de TI - DRSUL Caxias do Sul: o trecho `sistema ERPAcesso remoto` tinha palavras coladas; foram preservados ERP e Suporte Remoto após revisão.

A preservação desses cinco vínculos foi uma manutenção local pontual, não uma proteção nova implementada no reextrator global. Identificadores internos dependem do snapshot; os títulos e trechos ajudam a localizar os casos em outra base.

Na mesma revisão, outras remoções eram corretas: `.NET` em e-mails/domínios, HTML em URLs, Go em slogans e idiomas oferecidos como benefício não eram requisitos. Portanto, manter todos os vínculos antigos indiscriminadamente também conservaria falsos positivos.

A comparação entre o banco original e uma cópia reextraída, com backup e revisão das remoções, permitiu separar esses casos antes de substituir o banco local. Nesse snapshot, com 8.355 vagas, 73 anúncios antes sem skills ganharam vínculos; o total sem skills passou de 594 para 522. Esses números são evidência histórica, não o estado atual permanente da base.