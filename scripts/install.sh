#!/bin/bash
set -e

echo ">>> SYSTEM UPDATE"
sudo pacman -Syu --noconfirm

echo ">>> ENABLE MULTILIB"
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm

echo ">>> INSTALLING CORE PACKAGES"
sudo pacman -S --noconfirm \
    git base-devel curl wget zip unzip tree \
    fastfetch btop htop \
    networkmanager network-manager-applet \
    pipewire pipewire-pulse wireplumber pipewire-jack \
    pavucontrol \
    xdg-desktop-portal xdg-desktop-portal-hyprland \
    wl-clipboard cliphist \
    polkit polkit-gnome \
    bluez bluez-utils \
    gvfs gvfs-mtp \
    neovim kitty \
    zsh starship zoxide fzf ripgrep fd \
    hyprland hyprpaper waybar swaybg dunst libnotify \
    flameshot firefox ffmpeg \
    libreoffice-fresh evince \
    vlc mpv \
    obs-studio blender godot \
    yazi

echo ">>> INSTALLING DEV LANGUAGES & TOOLCHAINS"
sudo pacman -S --noconfirm \
    nodejs npm \
    python python-pip python-virtualenv \
    github-cli \
    jq yq httpie \
    p7zip unrar \
    clang llvm lld mold \
    go

echo ">>> INSTALLING PNPM"
sudo npm install -g pnpm

echo ">>> INSTALLING STEAM + MULTILIB"
sudo pacman -S --noconfirm \
    steam steam-native-runtime \
    lib32-mesa lib32-vulkan-icd-loader \
    mesa vulkan-icd-loader

echo ">>> INSTALLING DOCKER"
sudo pacman -S --noconfirm docker docker-compose
sudo systemctl enable --now docker
sudo groupadd -f docker
sudo usermod -aG docker $USER

echo ">>> INSTALLING RUST"
if ! command -v rustup &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

source $HOME/.cargo/env
rustup default stable
rustup component add rustfmt clippy
rustup target add x86_64-unknown-linux-musl
rustup target add aarch64-unknown-linux-gnu

echo ">>> INSTALLING YAY (AUR HELPER)"
if ! command -v yay &> /dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/yay-git.git
  cd yay-git
  makepkg -si --noconfirm
fi

echo ">>> INSTALLING AUR APPS"
yay -S --noconfirm \
    zed-editor-bin \
    postman-bin \
    telegram-desktop-bin \
    discord \
    ashell \
    ttf-jetbrains-mono-nerd \
    ttf-sarabun \
    bibata-cursor-theme-bin

echo ">>> INSTALLING OH-MY-ZSH (non-interactive)"
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ">>> INSTALLING POWERLEVEL10K"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  $HOME/.oh-my-zsh/custom/themes/powerlevel10k

echo ">>> INSTALLING ZSH PLUGINS"
git clone https://github.com/zsh-users/zsh-autosuggestions \
  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions \
  $HOME/.oh-my-zsh/custom/plugins/zsh-completions

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
  $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

echo ">>> SETTING DEFAULT SHELL TO ZSH"
chsh -s /bin/zsh

echo ">>> DONE! ULTIMATE DEVELOPER MACHINE INSTALLED SUCCESSFULLY."
echo ">>> Reboot now to apply everything."
