# Arquitetura

Fluxo ponta a ponta da base central de memória:

```text
ThinkPad / Codex App (MCP remoto)
  → Tailscale (rede privada entre dispositivos)
  → Dell G15 (Windows 11, Tailscale ligado)
  → WSL2 Debian
  → Docker, container `ai-memory` (ai-memory 2.3.2)
  → /data/wiki (Git da wiki) + /data/db/memory.sqlite (SQLite)
```

## Papéis

- **Dell G15:** único servidor. Detém o volume Docker `ai-memory-data`,
  o Git da wiki em `/data/wiki` e o banco em `/data/db/memory.sqlite`.
  Fica acessível aos outros dispositivos pelo Tailscale.
- **ThinkPad:** apenas cliente. O Codex App usa o MCP remoto do ai-memory
  hospedado no G15. Não possui segunda base de memória.
- **Backup:** clone em `~/backups/ai-memory-wiki` (WSL do G15).
  `origin` = `git@github.com:diasgarcia/ai-memory-wiki-backup.git`,
  `source` = `/var/lib/docker/volumes/ai-memory-data/_data/wiki`.
  O script gera um Git bundle via `alpine/git` com o volume montado
  como somente leitura, atualiza o clone com `reset --hard` e envia
  `master` ao GitHub. O cron executa periodicamente enquanto o WSL está ligado.

## Dados persistentes (no container)

- Volume Docker: `ai-memory-data`
- Wiki Git: `/data/wiki`
- Banco SQLite: `/data/db/memory.sqlite`
