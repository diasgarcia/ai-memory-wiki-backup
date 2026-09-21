# ThinkPad — cliente remoto

O ThinkPad não hospeda memória. Ele acessa a base central do G15.

## Como funciona

- Tailscale ligado no Windows do ThinkPad.
- Codex App usa o MCP remoto do ai-memory hospedado no G15.
- Não há segunda base de memória no ThinkPad.

## Por clone de projeto: recriar `.ai-memory.toml`

Cada clone de projeto precisa ter localmente um `.ai-memory.toml`
na raiz do clone, apontando para o escopo correto da base central.

Para `tech-skills-br`:

```toml
workspace = "pessoal"
project = "tech-skills-br"
```

Para `rocket-web_automation`:

```toml
workspace = "cwi"
project = "rocket-web_automation"
```

Regras:

- Esses arquivos ficam **fora do Git do projeto**, via `.git/info/exclude`
  (não via `.gitignore` versionado).
- Ao clonar o projeto em uma máquina nova, recrie o arquivo manualmente
  com o conteúdo acima, conforme o projeto.
- As skills do ai-memory e as instruções de routing do Codex foram
  instaladas globalmente no usuário, não dentro dos repositórios.
  Nada a copiar por projeto além do `.ai-memory.toml`.

Nenhum token é documentado aqui. O cliente aponta para o servidor remoto
via MCP; não versione credenciais.
