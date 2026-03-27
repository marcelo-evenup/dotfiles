#!/bin/bash
# Refresh VS Code IPC hook in all tmux panes
tmux list-panes -a -F "#{pane_id}" | xargs -I{} tmux send-keys -t {} "export VSCODE_IPC_HOOK_CLI=$(tmux show-environment VSCODE_IPC_HOOK_CLI | cut -d= -f2-)" Enter

# Authenticate GitHub CLI
if ! gh auth status &>/dev/null; then
  if [ -f /claude/gh-token ]; then
    gh auth login --with-token < /claude/gh-token
  else
    gh auth login -p ssh
    gh auth token > /claude/gh-token
  fi
fi
