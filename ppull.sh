#!/data/data/com.termux/files/usr/bin/bash
set -e

DIR="$HOME/AI-Agent-Security-Red-Team-Curriculum"

if [ ! -d "$DIR/.git" ]; then
    echo "No repo at $DIR — cloning fresh..."
    git clone git@github.com:anexbin/AI-Agent-Security-Red-Team-Curriculum.git "$DIR"
else
    cd "$DIR"
    echo "Fetching..."
    git fetch origin
    git reset --hard origin/main
    git clean -fd
fi

cd "$DIR"
echo "Done. Now at: $(git log -1 --oneline)"
