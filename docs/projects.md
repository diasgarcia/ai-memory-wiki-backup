# Projetos / escopos

A memória central (G15) separa conteúdo por `workspace/project`,
definidos pelo `.ai-memory.toml` de cada clone.

## Escopos atuais

| Projeto | `workspace` | `project` | `.ai-memory.toml` |
|---|---|---|---|
| tech-skills-br | `pessoal` | `tech-skills-br` | `workspace = "pessoal"` + `project = "tech-skills-br"` |
| rocket-web_automation | `cwi` | `rocket-web_automation` | `workspace = "cwi"` + `project = "rocket-web_automation"` |

Conteúdo exato dos arquivos:

`tech-skills-br`:

```toml
workspace = "pessoal"
project = "tech-skills-br"
```

`rocket-web_automation`:

```toml
workspace = "cwi"
project = "rocket-web_automation"
```

## Regras

- Máquinas diferentes usando os mesmos `workspace/project`
  acessam a **mesma memória central** no G15.
  Não existe base secundária no ThinkPad.
- Cada clone precisa recriar seu `.ai-memory.toml` local.
- O arquivo fica fora do Git do projeto via `.git/info/exclude`.
- Skills e routing do Codex são globais por usuário, não por repositório.
