#!/usr/bin/env bash
set -euo pipefail

# Builds a standalone executable for every game under games/ using PyInstaller.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GAMES_DIR="$REPO_ROOT/games"
DIST_DIR="$REPO_ROOT/dist"

if ! command -v pyinstaller >/dev/null 2>&1; then
    echo "pyinstaller not found. Install it with: pip install pyinstaller" >&2
    exit 1
fi

for game_dir in "$GAMES_DIR"/*/; do
    game_name="$(basename "$game_dir")"
    main_file="$game_dir/main.py"

    if [[ ! -f "$main_file" ]]; then
        echo "Skipping $game_name (no main.py found)"
        continue
    fi

    echo "Building $game_name..."
    pyinstaller \
        --name "$game_name" \
        --onefile \
        --distpath "$DIST_DIR/$game_name" \
        --workpath "$REPO_ROOT/build/$game_name" \
        --specpath "$REPO_ROOT/build/$game_name" \
        "$main_file"
done

echo "All builds finished. Output in $DIST_DIR"
