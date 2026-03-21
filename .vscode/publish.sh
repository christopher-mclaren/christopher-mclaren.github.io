#!/usr/bin/env bash
set -e
MSG="${1:-blog: publish update $(date +'%Y-%m-%d')}"
git add -A
if git diff --cached --quiet; then
  echo "Nothing new to publish — working tree is clean."
else
  git commit -m "$MSG"
  git push origin main
  echo ""
  echo "Published! GitHub Actions will deploy in ~1 minute."
fi
