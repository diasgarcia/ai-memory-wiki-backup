# ai-memory-wiki-backup

Repositório de backup + documentação da infraestrutura do ai-memory.

## Branches

- **`master` = espelho automático da wiki.**
  Atualizada exclusivamente pelo script `scripts/backup-ai-memory.sh`
  (cópia versionada do `~/bin/backup-ai-memory.sh`), que faz:
  `git fetch <bundle> master` + `git reset --hard FETCH_HEAD` + `git push origin master`.
  O cron executa esse script periodicamente enquanto o WSL está ligado.

- **`setup` = documentação da infraestrutura (esta branch).**
  Contém `docs/` e `scripts/` com a descrição do servidor (Dell G15),
  do cliente (ThinkPad/Codex), dos escopos e do backup.
  É aqui que a documentação humana vive.

## Regras

1. **Nunca faça alterações manuais em `master`.**
   Qualquer commit manual será descartado no próximo backup
   por causa do `git reset --hard`.
2. **Nunca versione secrets.**
   Nenhum token, `AI_MEMORY_AUTH_TOKEN`, chave SSH privada,
   senha ou credencial deve ser commitado em qualquer branch.
   O script versionado em `scripts/` foi conferido e não contém secrets.
3. Não modifique por aqui o servidor ai-memory, Docker, Tailscale ou cron.
   Esta branch é só documentação.

## Estrutura da branch `setup`

```text
README.md
docs/
  architecture.md
  g15.md
  thinkpad.md
  projects.md
scripts/
  backup-ai-memory.sh
```

## Links

- `docs/architecture.md` — visão do fluxo ponta a ponta.
- `docs/g15.md` — servidor central (Dell G15 + WSL2 + Docker).
- `docs/thinkpad.md` — cliente remoto (ThinkPad + Codex App).
- `docs/projects.md` — escopos `workspace/project` atuais.
- `scripts/backup-ai-memory.sh` — cópia do script real de backup.
