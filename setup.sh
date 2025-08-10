#!/bin/bash

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

NVIM_SRC="$REPO_DIR/nvim"
NVIM_DST="$HOME/.config/nvim"

if [ ! -d "$NVIM_SRC" ]; then
    printf "\033[1;31mxx\033[0m Could not find '$NVIM_SRC'\n" >&2
    exit 1
fi

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Backup nvim config dir if it exists already
if [ -L "$NVIM_DST" ]; then
    if [ "$(readlink "$NVIM_DST")" = "$NVIM_SRC" ]; then
        echo "Symlink already in place: $NVIM_DST -> $NVIM_SRC"
        exit 0
    else
        echo "Replacing existing symlink: $NVIM_DST"
        rm "$NVIM_DST"
    fi
elif [ -e "$NVIM_DST" ]; then
    ts="$(date +%Y%m%d-%H%M%S)"
    backup="$NVIM_DST.bak.$ts"
    echo "Backing up existing $NVIM_DST to $backup"
    mv "$NVIM_DST" "$backup"
fi

ln -s "$NVIM_SRC" "$NVIM_DST"
