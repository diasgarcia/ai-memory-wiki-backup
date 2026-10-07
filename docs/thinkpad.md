# ThinkPad

O ThinkPad é cliente remoto do ai-memory.

Ele não possui uma segunda base de memória.

```text
ThinkPad
├── Codex
├── ai-memory.exe
├── hooks
├── skills
└── .ai-memory.toml
       |
       | Tailscale / HTTPS
       v
G15
└── servidor central
```

## Atualizar

No PowerShell:

```powershell
ai-memory upgrade
```

Confira:

```powershell
ai-memory --version
```

Isso atualiza somente o cliente local.

## Conexão

O MCP deve apontar para:

```text
https://rafael.taild4f09a.ts.net/mcp
```

Os hooks devem apontar para:

```text
https://rafael.taild4f09a.ts.net
```

Para conferir sem mostrar o token:

```powershell
Select-String `
  -Path "$HOME\.codex\hooks.json" `
  -Pattern 'server-url|rafael.taild4f09a.ts.net'
```

```powershell
Select-String `
  -Path "$HOME\.codex\config.toml" `
  -Pattern 'ai-memory|rafael.taild4f09a.ts.net'
```

## Projetos

Cada clone precisa de um:

```text
.ai-memory.toml
```

O arquivo fica fora do Git:

```bash
echo .ai-memory.toml >> .git/info/exclude
```

Veja os escopos em [projects.md](projects.md).
