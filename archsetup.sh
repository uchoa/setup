#!/bin/sh

# Install yay AUR helper
pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinu.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -Rf yay

# HARDWARE
yay -S --noconfirm xorg-xinput bluez bluez-utils

# TERMINAL
yay -S --noconfirm wezterm zsh zsh-syntax-highlighting zsh-autosuggestions starship tmux xclip fzf bat yazi

# DESKTOP
yay -S --noconfirm picom feh xss-lock redshift dmenu-bluetooth networkmanager-dmenu-git

# UTILITIES
yay -S --noconfirm man-db man-pages fastfetch ripgrep udisks2 udiskie brightnessctl zk task vit
yay -S --noconfirm 1password 1password-cli zathura zathura-pdf-mupdf rclone fuse3 openssh gnupg keychain

# FONTS
yay -S --noconfirm ttf-inconsolata-go-nerd ttf-jetbrains-mono-nerd

# DEV TOOLS
yay -S --noconfirm neovim go gopls luarocks lua51 jq hq yq lazygit
yay -S --noconfirm podman podman-compose podman-desktop podman-tui
# -- `NodeJS` MUST be installed after `podman-desktop` due to a build conflict
# -- `with nodejs-lts-iron`.
yay -R --noconfirm nodejs-lts-iron  # remove if it is still in the system
yay -S --noconfirm nodejs npm
yay -S --noconfirm bruno

# -- Install tree-sitter executable for neovim
sudo npm install -g tree-sitter-cli

# GUI APPLICATIONS
yay -S --noconfirm firefox google-chrome slack-desktop 

#####
## SETUP DOTFILES AND OTHER SYSTEM CONFIGURATIONS
## 

# Set zsh as the default shell
chsh -s /usr/bin/zsh


