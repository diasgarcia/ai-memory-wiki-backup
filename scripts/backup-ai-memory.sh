#!/bin/bash
set -euo pipefail

BACKUP="$HOME/backups/ai-memory-wiki"
BUNDLE="$HOME/backups/ai-memory-wiki.bundle"

cleanup() {
    rm -f "$BUNDLE"
}

trap cleanup EXIT

# Cria um bundle consistente da wiki real do ai-memory
docker run --rm \
  -v ai-memory-data:/data:ro \
  -v "$HOME/backups:/backup" \
  alpine/git \
  -c safe.directory=/data/wiki \
  -C /data/wiki \
  bundle create /backup/ai-memory-wiki.bundle --all

cd "$BACKUP"

# Atualiza uma referência separada, sem tocar na branch atualmente aberta
git fetch "$BUNDLE" master:refs/remotes/source/master

# Envia diretamente a versão da wiki para a master do GitHub
git push origin refs/remotes/source/master:refs/heads/master

echo "ai-memory backup concluído em $(date)"
