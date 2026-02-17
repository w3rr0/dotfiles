#!/bin/sh

DOTFILES_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CONFIG_DIR="$HOME/.config"

GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
NC=$(printf '\033[0m')

link_file() {
    src="$1"
    dest="$2"

    dest_dir=$(dirname "$dest")
    if [ ! -d "$dest_dir" ]; then
        mkdir -p "$dest_dir"
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then

        if [ -L "$dest" ]; then
            current_target=$(ls -ld "$dest" | awk '{print $NF}')
            if [ "$current_target" = "$src" ]; then
                printf "${GREEN}Already linked: %s${NC}\n" "$dest"
                return
            fi
        fi

        printf "${YELLOW}Collision found, creating backup: %s.backup${NC}\n" "$dest"
        mv "$dest" "$dest.backup"
    fi

    ln -s "$src" "$dest"
    printf "${GREEN} Symlink created: %s -> %s${NC}\n" "$dest" "$src"
}

# Neovim
link_file "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"

# Ghostty
link_file "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"

# Starship
link_file "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"

# Tmux
link_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# ---Arch only---
if [ "$1" == "--arch" ]; then

    # Hyprland
    link_file "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"

fi

printf "\n${BLUE}${BOLD}All symlinks created${NC}\n"
