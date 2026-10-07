# Instalação

Guia simples para recriar o setup atual.

## Resultado

```text
ThinkPad / Codex
      |
      | Tailscale / HTTPS
      v
G15 / WSL
ai-memory server
      |
      v
ai-memory-data

G15 / Codex
      |
      | localhost
      ┘
```

O G15 hospeda a única base.

O G15 e o ThinkPad possuem clientes locais do ai-memory para integrar o Codex com essa base.

---

## 1. Pré-requisitos

### G15

Instale:

```text
Windows
WSL2 Debian
Docker
Tailscale
Codex
```

### ThinkPad

Instale:

```text
Windows
Tailscale
Codex
```

Os dois computadores devem estar na mesma tailnet.

---

## 2. Criar servidor no G15

No WSL:

```bash
mkdir -p \
  ~/.config/ai-memory \
  ~/deploy/ai-memory \
  ~/backups \
  ~/bin
```

Crie o volume:

```bash
docker volume create ai-memory-data
```

Gere o token:

```bash
docker run --rm \
  akitaonrails/ai-memory:latest \
  generate-auth-token \
  > ~/.config/ai-memory/auth-token
```

Proteja o arquivo:

```bash
chmod 600 ~/.config/ai-memory/auth-token
```

---

## 3. Criar configuração do servidor

Entre no diretório:

```bash
cd ~/deploy/ai-memory
```

Crie o `.env`:

```bash
TOKEN="$(cat ~/.config/ai-memory/auth-token)"

umask 077

printf 'AI_MEMORY_AUTH_TOKEN=%s\nAI_MEMORY_ALLOWED_HOSTS=%s\n' \
  "$TOKEN" \
  "rafael.taild4f09a.ts.net,localhost,127.0.0.1,host.docker.internal" \
  > .env

unset TOKEN

chmod 600 .env
```

Crie:

```text
~/deploy/ai-memory/docker-compose.yml
```

Conteúdo:

```yaml
services:
  ai-memory:
    image: akitaonrails/ai-memory:latest
    container_name: ai-memory
    restart: unless-stopped

    ports:
      - "127.0.0.1:49374:49374"

    volumes:
      - ai-memory-data:/data

    env_file:
      - .env

volumes:
  ai-memory-data:
    external: true
```

Suba:

```bash
docker compose pull
docker compose up -d
```

Confira:

```bash
docker compose ps
docker exec ai-memory ai-memory --version
```

---

## 4. Publicar pelo Tailscale

No PowerShell do G15:

```powershell
tailscale serve --bg 49374
```

Servidor remoto:

```text
https://rafael.taild4f09a.ts.net
```

MCP:

```text
https://rafael.taild4f09a.ts.net/mcp
```

---

## 5. Instalar cliente Windows

Faça no G15 e no ThinkPad.

Baixe a release Windows mais recente do ai-memory.

Deixe o executável em:

```text
%LOCALAPPDATA%\ai-memory
```

Garanta que esse diretório esteja no `PATH`.

Confira:

```powershell
ai-memory --version
```

---

## 6. Configurar G15 Windows

O G15 usa o servidor local:

```text
http://127.0.0.1:49374
```

No PowerShell:

```powershell
$env:AI_MEMORY_SERVER_URL = "http://127.0.0.1:49374"
$env:AI_MEMORY_AUTH_TOKEN = "<token-local>"
```

Depois:

```powershell
ai-memory install-mcp --client codex --apply
ai-memory install-hooks --agent codex --apply
ai-memory install-skills --scope global --agent agents
ai-memory install-instructions --target "$HOME\.codex\AGENTS.md"
```

Nunca versione o token.

---

## 7. Configurar ThinkPad

O ThinkPad usa:

```text
https://rafael.taild4f09a.ts.net
```

MCP:

```text
https://rafael.taild4f09a.ts.net/mcp
```

Use o mesmo token do servidor somente na configuração local.

No PowerShell:

```powershell
$env:AI_MEMORY_SERVER_URL = "https://rafael.taild4f09a.ts.net"
$env:AI_MEMORY_AUTH_TOKEN = "<token-local>"
```

Depois:

```powershell
ai-memory install-mcp --client codex --apply
ai-memory install-hooks --agent codex --apply
ai-memory install-skills --scope global --agent agents
ai-memory install-instructions --target "$HOME\.codex\AGENTS.md"
```

Nunca versione o token.

---

## 8. Configurar projeto

Na raiz de cada clone crie:

```text
.ai-memory.toml
```

Exemplo:

```toml
workspace = "pessoal"
project = "tech-skills-br"
```

Depois:

```bash
echo .ai-memory.toml >> .git/info/exclude
```

Os valores atuais estão em:

[projects.md](projects.md)

---

## 9. Scripts

No G15:

```text
~/bin/backup-ai-memory.sh
~/bin/update-ai-memory.sh
```

Cópias versionadas:

```text
scripts/backup-ai-memory.sh
scripts/update-ai-memory.sh
```

Permissões:

```bash
chmod +x ~/bin/backup-ai-memory.sh
chmod +x ~/bin/update-ai-memory.sh
```

---

## 10. Backup automático

Abra:

```bash
crontab -e
```

Adicione:

```cron
0 * * * * /home/diasgarcia/bin/backup-ai-memory.sh >> /home/diasgarcia/backups/ai-memory-backup.log 2>&1
```

---

## 11. Testar

Servidor:

```bash
docker compose -f ~/deploy/ai-memory/docker-compose.yml ps
docker exec ai-memory ai-memory --version
```

No Codex:

```text
Use memory_status e informe workspace e project ativos.
```

Para um projeto com `.ai-memory.toml`, confirme que `workspace` e `project` são os esperados.

Depois disso, futuras atualizações estão documentadas em:

[update.md](update.md)
