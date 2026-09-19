#!/usr/bin/env bash
set -e

# Try these paths in order, use the first one that's a git repo
CANDIDATES=(
    "$HOME/the repo folder"
    "$HOME/ai"
    "$HOME/AI-Agent-Security-Red-Team-Curriculum"
)

DIR=""
for c in "${CANDIDATES[@]}"; do
    if [ -d "$c/.git" ]; then
        DIR="$c"
        break
    fi
done

if [ -z "$DIR" ]; then
    echo "No repo found. Looked in:"
    printf '  %s\n' "${CANDIDATES[@]}"
    exit 1
fi

echo "Pulling in: $DIR"
cd "$DIR"
git pull
echo "Done. Now at: $(git log -1 --oneline)"
