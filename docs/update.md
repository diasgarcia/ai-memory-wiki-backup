# Atualização

A atualização normal é simples.

## G15 — servidor

Abra o WSL/Debian:

```bash
update-ai-memory.sh
```

O script faz:

```text
backup da wiki
backup completo
docker compose pull
docker compose up -d
verificação da versão
```

Confira:

```bash
docker exec ai-memory ai-memory --version
```

## G15 — cliente Windows

Abra o PowerShell:

```powershell
ai-memory upgrade
```

Confira:

```powershell
ai-memory --version
```

## ThinkPad

Abra o PowerShell:

```powershell
ai-memory upgrade
```

Confira:

```powershell
ai-memory --version
```

## Resumo

```text
G15 / WSL
→ update-ai-memory.sh

G15 / PowerShell
→ ai-memory upgrade

ThinkPad / PowerShell
→ ai-memory upgrade
```

Não é necessário recriar:

```text
Docker Compose
ai-memory-data
token
Tailscale
MCP
.ai-memory.toml
```

## Skills e instruções

Se uma atualização precisar atualizar manualmente as instruções globais:

```powershell
ai-memory install-instructions --target "$HOME\.codex\AGENTS.md"
```

Para atualizar as skills:

```powershell
ai-memory install-skills --scope global --agent agents
```
