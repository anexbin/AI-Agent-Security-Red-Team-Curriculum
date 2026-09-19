#!/usr/bin/env bash
set -e

CANDIDATES=(
    "$HOME/the repo folder"
    "$HOME/ai"
)

DIR=""
for c in "${CANDIDATES[@]}"; do
    [ -d "$c/.git" ] && DIR="$c" && break
done

[ -z "$DIR" ] && { echo "No repo found."; exit 1; }

cd "$DIR"
echo "Hard-resetting $DIR to match origin..."
git fetch origin
git reset --hard origin/main
git clean -fd          # delete untracked files/dirs
echo "Done. Now at: $(git log -1 --oneline)"
