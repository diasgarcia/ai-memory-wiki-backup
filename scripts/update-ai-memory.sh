#!/usr/bin/env bash
set -euo pipefail

DEPLOY="$HOME/deploy/ai-memory"
BACKUPS="$HOME/backups"
STAMP="$(date +%Y%m%d-%H%M%S)"
TMP_BACKUP="/tmp/ai-memory-pre-upgrade-$STAMP.tar.gz"

mkdir -p "$BACKUPS"

echo
echo "==> 1/5 Backup da wiki para GitHub"

if [ -x "$HOME/bin/backup-ai-memory.sh" ]; then
    "$HOME/bin/backup-ai-memory.sh"
else
    echo "Aviso: backup-ai-memory.sh não encontrado."
fi

echo
echo "==> 2/5 Backup completo do ai-memory"

docker exec ai-memory \
    ai-memory backup --to "$TMP_BACKUP"

docker cp \
    "ai-memory:$TMP_BACKUP" \
    "$BACKUPS/"

docker exec ai-memory \
    rm -f "$TMP_BACKUP"

echo
echo "Backup salvo em:"
echo "$BACKUPS/$(basename "$TMP_BACKUP")"

echo
echo "==> 3/5 Baixando versão mais recente"

cd "$DEPLOY"
docker compose pull

echo
echo "==> 4/5 Atualizando container"

docker compose up -d

echo
echo "==> 5/5 Verificando"

sleep 3

docker exec ai-memory ai-memory --version
docker compose ps

echo
echo "======================================"
echo "ai-memory atualizado com sucesso."
echo "Backup: $BACKUPS/$(basename "$TMP_BACKUP")"
echo "======================================"
