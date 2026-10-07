# Arquitetura

Existe uma única base central do ai-memory.

Ela fica no Dell G15.

```text
ThinkPad / Windows
Codex + ai-memory.exe + hooks
        |
        | Tailscale / HTTPS
        v
Dell G15 / Windows
        |
        v
WSL2 Debian
Docker Compose
ai-memory server
        |
        v
ai-memory-data
├── /data/wiki
└── /data/db/memory.sqlite
```

O próprio G15 também usa o servidor:

```text
G15 / Windows
Codex + ai-memory.exe + hooks
        |
        | http://127.0.0.1:49374
        v
G15 / WSL
ai-memory server
```

## Componentes

- **Servidor:** container `ai-memory` no WSL2 Debian do G15.
- **Persistência:** volume Docker `ai-memory-data`.
- **Wiki:** `/data/wiki`.
- **SQLite:** `/data/db/memory.sqlite`.
- **Rede remota:** Tailscale.
- **Clientes:** `ai-memory.exe` + hooks do Codex no Windows do G15 e do ThinkPad.
- **Backup da wiki:** `~/bin/backup-ai-memory.sh`.
- **Atualização do servidor:** `~/bin/update-ai-memory.sh`.

## Regra principal

O ThinkPad executa o cliente e os hooks localmente, mas não hospeda a base.

Atualizar o servidor não atualiza automaticamente os clientes Windows.

Por isso a rotina completa possui:

```text
G15 / WSL        → update-ai-memory.sh
G15 / Windows    → ai-memory upgrade
ThinkPad         → ai-memory upgrade
```
