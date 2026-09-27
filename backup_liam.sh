#!/usr/bin/env bash

mkdir -p backups
rsync -av \
    "$HOME/.hermes/profiles" \
    "$HOME/.hermes/skills" \
    "$HOME/.hermes/dashboard-themes" \
    "$HOME/.hermes/config.yaml" \
    "$HOME/.hermes/SOUL.md" \
    "$HOME/.hermes/memories/MEMORY.md" \
    "$HOME/.hermes/memories/USER.md" \
    "./backups"


[[ -z "$(git diff)" ]] && exit 0

git add -A

git commit -m "backup_liam.sh $(date)"
git push
