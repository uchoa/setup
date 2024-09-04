#!/bin/sh

# Install yay AUR helper
pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinu.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -Rf yay

# HARDWARE CONFIGURATION UTILITIES
yay -S --noconfirm xorg-xinput

# TERMINAL
yay -S --noconfirm wezterm zsh zsh-syntax-highlighting zsh-autosuggestions starship tmux xclip fzf bat

# DESKTOP
yay -S --noconfirm picom

# UTILITIES
yay -S --noconfirm man-db man-pages fastfetch ripgrep udisks2 udiskie
yay -S --noconfirm 1password 1password-cli zathura zathura-pdf-mupdf

# FONTS
yay -S --noconfirm ttf-inconsolata-go-nerd ttf-jetbrains-mono-nerd

# DEV TOOLS
yay -S --noconfirm neovim go gopls luarocks lua51 nodejs npm jq hq yq

# -- Install tree-sitter executable for neovim
sudo npm install -g tree-sitter-cli

# GUI APPLICATIONS
yay -S --noconfirm firefox google-chrome slack-desktop

#####
## SETUP DOTFILES AND OTHER SYSTEM CONFIGURATIONS
## 

# Set zsh as the default shell
chsh -s /usr/bin/zsh

