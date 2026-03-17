#!/bin/bash
apt-get update && apt-get install -y tmux gh

# Symlink tmux config
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

# Install tmux plugin manager and plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Authenticate GitHub CLI
gh auth login -p ssh
