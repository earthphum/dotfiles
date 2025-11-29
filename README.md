# Dotfiles

My personal collection of dotfiles for Arch Linux with Hyprland, Neovim, Kitty, and Zsh.

## Overview

This repository contains my personal configuration files for a Linux development environment. The setup includes:

- **Window Manager**: Hyprland with custom configurations
- **Shell**: Zsh with Oh My Zsh and Powerlevel10k
- **Terminal**: Kitty with custom fonts and transparency
- **Editor**: Neovim with LazyVim configuration
- **Launcher**: Rofi with multiple themes
- **Other Tools**: Git configuration and custom aliases

## Installation

### Prerequisites

Before installing these dotfiles, make sure you have the following packages installed:

```bash
# Core dependencies
sudo pacman -S git zsh neovim kitty hyprland rofi

# Zsh plugins and dependencies
yay -S zsh-autosuggestions zsh-completions zsh-fast-syntax-highlighting fzf zoxide

# For Neovim
sudo pacman -S nodejs npm ripgrep fd unzip

# Fonts
yay -S jetbrains-mono-nerd
```

### Quick Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Run the installation script:
```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

3. Restart your shell or run:
```bash
source ~/.zshrc
```

### Manual Installation

If you prefer to manually install, create symlinks to the configuration files:

```bash
# Shell configuration
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

# Application configurations
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/kitty ~/.config/kitty
ln -s ~/.dotfiles/.config/hypr ~/.config/hypr
ln -s ~/.dotfiles/.config/rofi ~/.config/rofi
```

## Configuration Details

### Shell (Zsh + Oh My Zsh)

- Uses Powerlevel10k theme with custom configuration
- Plugins: git, zsh-autosuggestions, zsh-completions, fast-syntax-highlighting
- Integrates with fzf and zoxide for improved navigation
- Custom aliases for common commands

### Neovim

- Uses LazyVim as the base configuration
- Lazy.nvim for plugin management
- Check `.config/nvim/lua/plugins/` for custom plugins

### Hyprland

- Tiling window manager with custom keybindings
- Dwindle layout with pseudotiling
- Custom animations and effects
- Integration with Kitty, Rofi, and other tools

### Kitty

- Terminal with transparency support
- JetBrains Mono Nerd Font
- Optimized for Hyprland

### Rofi

- Application launcher with custom themes
- Multiple configurations for different use cases (launcher, powermenu, etc.)

## Custom Keybindings

### Hyprland

| Keybinding | Action |
|------------|--------|
| Super + Enter | Open terminal (Kitty) |
| Super + Space | Open launcher (Rofi) |
| Super + E | Open file manager (Thunar) |
| Super + Q | Close active window |
| Super + Arrow keys | Move focus between windows |
| Super + Shift + Arrow keys | Move active window |
| Super + Number | Switch to workspace |
| Super + Shift + Number | Move window to workspace |

## Maintenance

To update your dotfiles after making changes:

```bash
cd ~/.dotfiles
git add .
git commit -m "Update configurations"
git push
```

## Contributing

Feel free to use this configuration as a starting point for your own setup. If you find any issues or have suggestions, please open an issue or submit a pull request.

## Credits

- [Oh My Zsh](https://ohmyz.sh/) for the Zsh framework
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) for the Zsh theme
- [LazyVim](https://www.lazyvim.org/) for the Neovim configuration
- [Hyprland](https://hyprland.org/) for the window manager
- [Kitty](https://sw.kovidgoyal.net/kitty/) for the terminal emulator
- [Rofi](https://github.com/davatorium/rofi) for the application launcher