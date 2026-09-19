#!/data/data/com.termux/files/usr/bin/bash
# push.sh — commit all changes and push to GitHub
# usage: ./push.sh "your commit message"

set -e

MSG="${1:-update from termux}"

echo "==> Status before commit:"
git status -sb

echo "==> Staging all changes..."
git add -A

if git diff --cached --quiet; then
  echo "==> Nothing to commit. Pushing any existing commits..."
else
  echo "==> Committing: $MSG"
  git commit -m "$MSG"
fi

echo "==> Pushing to origin..."
git push

echo "==> Done. Latest commits:"
git log --oneline -5
