#!/bin/zsh

### INSTALL HOMEBREW BEFORE ANYTHING

### SECURITY
#-- Install GNU PGP and set it up to store gpg passphrases in keychain
brew install gnupg pinentry-mac
mkdir -m 0700 ~/.gnupg
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" | tee ~/.gnupg/gpg-agent.conf
pkill -TERM gpg-agent

# TERMINAL UTILITIES
brew install zsh-syntax-highlighting zsh-autosuggestions starship fzf bat
brew install zk task vit
brew install --cask font-inconsolata-go-nerd-font
brew install --cask font-jetbrains-mono-nerd-font

# DEVELOPMENT ENVIRONMENT
brew install wezterm tmux gh neovim go gopls luarocks jq hq lazygit mitmproxy podman podman-compose podman-tui

brew install node

### SETUP DOTFILES AND OTHER SYSTEM CONFIGURATIONS
#

#-- Download dotfiles
git clone --bare git@github.com:uchoa/dotfiles $HOME/.dotfiles
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout macos
dotfiles config --local status.showUntrackedFiles no

#-- Download TMUX Plugin Manager
mkdir -p $HOME/.config/tmux/plugins
git clone git@github.com:tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm

