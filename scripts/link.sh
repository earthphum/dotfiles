#!/bin/bash
set -e

DOTFILES_DIR="$HOME"
CONFIG_DIR="$HOME/.config"

link() {
    local src=$1
    local dst=$2

    # ถ้ามีไฟล์อยู่แล้วและไม่ใช่ symlink → ย้ายไป backup ก่อน
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo ">>> Backing up $dst"
        mv "$dst" "$dst.bak"
    fi

    # ลบ symlink เก่า ถ้ามี
    if [ -L "$dst" ]; then
        rm "$dst"
    fi

    echo ">>> Linking $src -> $dst"
    ln -s "$src" "$dst"
}

echo ">>> Creating .config subdirs if missing"
mkdir -p "$CONFIG_DIR/hypr"
mkdir -p "$CONFIG_DIR/kitty"
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/rofi"
mkdir -p "$CONFIG_DIR/ashell"

echo ">>> Linking dotfiles"

# Shell
link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

# Bash
[ -f "$DOTFILES_DIR/.bashrc" ] && link "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

# Git
link "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/.gitignore" "$HOME/.gitignore"

# Hyprland
link "$DOTFILES_DIR/.config/hypr/hyprland.conf" "$CONFIG_DIR/hypr/hyprland.conf"
link "$DOTFILES_DIR/.config/hypr/hyprpaper.conf" "$CONFIG_DIR/hypr/hyprpaper.conf"

# Kitty
link "$DOTFILES_DIR/.config/kitty/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"

# Neovim (LazyVim)
link "$DOTFILES_DIR/.config/nvim" "$CONFIG_DIR/nvim"

# Rofi
link "$DOTFILES_DIR/.config/rofi" "$CONFIG_DIR/rofi"

# aShell
link "$DOTFILES_DIR/.config/ashell/config.toml" "$CONFIG_DIR/ashell/config.toml"

echo ">>> All symlinks created successfully!"
