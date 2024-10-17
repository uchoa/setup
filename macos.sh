#!/bin/zsh

sudo clear # This line is here only for capturing sudo password

### INSTALL HOMEBREW BEFORE ANYTHING

### SECURITY
#-- Install GNU PGP and set it up to store gpg passphrases in keychain
brew install gnupg pinentry-mac
mkdir -m 0700 ~/.gnupg
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" | tee ~/.gnupg/gpg-agent.conf
pkill -TERM gpg-agent

# TERMINAL UTILITIES
brew install zsh-syntax-highlighting zsh-autosuggestions starship fzf bat btop
brew install zk task vit
brew install --cask font-inconsolata-go-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-fira-code-nerd-font

# DEVELOPMENT ENVIRONMENT
brew install wezterm tmux gh neovim ripgrep go gopls luarocks jq hq yq lazygit mitmproxy podman podman-compose podman-tui rust
brew install node deno

# WINDOW MANAGER
brew install --cask nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install borders
brew install --cask alfred

# GUI APPLICATIONS
brew install --cask 1password 1password-cli
brew install --cask whatsapp
brew install --cask hazel
brew install --cask google-drive
brew install --cask libreoffice

### MAC APP STORE APPLICATIONS
#-- Start by installing mas
brew install mas

mas install 937984704  # Amphetamine
mas install 975937182  # Fantastical
mas install 1290358394 # Cardhop
mas install 1289583905 # Pixelmator Pro
mas install 1569813296 # 1Password for Safari
mas install 803453959  # Slack for Desktop

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

#-- Start Aerospace Window Manager
osascript -e 'tell application "System Events" to ¬' \
              -e 'make new login item with properties ¬' \
              -e '{name:"Aerospace", path:"/Applications/AeroSpace.app/", hidden:true}'

brew services start borders
