#!/bin/bash
set -e

echo ">>> SYSTEM UPDATE"
sudo pacman -Syu --noconfirm

echo ">>> ENABLE MULTILIB (for steam + wine + games)"
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm

echo ">>> INSTALL CORE SYSTEM PACKAGES"
sudo pacman -S --noconfirm \
  git base-devel curl wget zip unzip tree \
  networkmanager network-manager-applet \
  pipewire pipewire-pulse wireplumber pipewire-jack \
  pavucontrol \
  xdg-desktop-portal xdg-desktop-portal-hyprland \
  wl-clipboard cliphist \
  polkit polkit-gnome \
  bluez bluez-utils \
  gvfs gvfs-mtp \
  fastfetch btop htop \
  neovim kitty \
  zsh starship zoxide fzf ripgrep fd \
  flameshot \
  firefox \
  hyprland hyprpaper waybar swaybg dunst libnotify \
  mesa vulkan-icd-loader lib32-mesa lib32-vulkan-icd-loader \
  yazi zed \
  ntfs-3g exfatprogs dosfstools \
  caddy wlsunset ncdu trash-cli \
  rust-analyzer tmux net-tools bat imv gwenview

echo ">>> INSTALL MULTIMEDIA (FFmpeg + Players)"
sudo pacman -S --noconfirm \
  ffmpeg \
  vlc \
  mpv
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji --noconfirm

echo ">>> INSTALL GODOT + BLENDER"
sudo pacman -S --noconfirm \
  godot \
  blender

echo ">>> INSTALL DEV LANGUAGES & TOOLCHAINS"
sudo pacman -S --noconfirm \
  nodejs npm \
  python python-pip python-virtualenv \
  go \
  jq yq httpie \
  p7zip unrar \
  clang llvm lld mold \
  github-cli

echo ">>> INSTALL PNPM"
sudo npm install -g pnpm

echo ">>> INSTALL DOCKER"
sudo pacman -S --noconfirm docker docker-compose
sudo systemctl enable --now docker
sudo groupadd -f docker
sudo usermod -aG docker $USER

echo ">>> INSTALL RUST"
if ! command -v rustup &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

source $HOME/.cargo/env
rustup default stable
rustup component add rustfmt clippy
rustup target add x86_64-unknown-linux-musl
rustup target add aarch64-unknown-linux-gnu

echo ">>> INSTALL YAY (AUR HELPER)"
if ! command -v yay &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
fi

echo ">>> INSTALL AUR APPS"
yay -S --noconfirm \
  postman-bin \
  telegram-desktop-bin \
  discord \
  ashell \
  ttf-jetbrains-mono-nerd \
  ttf-sarabun \
  bibata-cursor-theme-bin \
  brave-bin google-chrome \
  zen-browser-bin \
  nwg-bar

echo ">>> INSTALL OH-MY-ZSH NON-INTERACTIVE"
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ">>> INSTALL POWERLEVEL10K THEME"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  $HOME/.oh-my-zsh/custom/themes/powerlevel10k

echo ">>> INSTALL ZSH PLUGINS"
git clone https://github.com/zsh-users/zsh-autosuggestions \
  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions \
  $HOME/.oh-my-zsh/custom/plugins/zsh-completions

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting \
  $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

echo ">>> SET DEFAULT SHELL TO ZSH"
chsh -s /bin/zsh

echo ">>> ALL DONE!"
echo ">>> REBOOT NOW."
