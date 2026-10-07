# Projetos e escopos

A memória é separada por:

```text
workspace
project
```

Cada clone possui um `.ai-memory.toml`.

## tech-skills-br

```toml
workspace = "pessoal"
project = "tech-skills-br"
```

## rocket_web_automation

```toml
workspace = "cwi"
project = "rocket_web_automation"
```

## Regras

- O `.ai-memory.toml` fica local.
- Ele não deve ser commitado.
- Use `.git/info/exclude`.
- Dois computadores usando o mesmo `workspace/project` acessam a mesma memória central.
- O ThinkPad não possui uma base separada.
- Skills e instruções do Codex são globais por usuário.
