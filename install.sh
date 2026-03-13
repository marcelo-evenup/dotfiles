#!/bin/bash
apt-get update && apt-get install -y tmux

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
