#!/bin/bash
set -euo pipefail

BACKUP="$HOME/backups/ai-memory-wiki"
BUNDLE="$HOME/backups/ai-memory-wiki.bundle"

# Usa um container temporário com Git para ler a wiki do volume Docker
docker run --rm \
  -v ai-memory-data:/data:ro \
  -v "$HOME/backups:/backup" \
  alpine/git \
  -c safe.directory=/data/wiki \
  -C /data/wiki \
  bundle create /backup/ai-memory-wiki.bundle --all

cd "$BACKUP"

git fetch "$BUNDLE" master
git reset --hard FETCH_HEAD
git push origin master

rm -f "$BUNDLE"

echo "ai-memory backup concluído em $(date)"
