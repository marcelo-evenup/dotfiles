#!/bin/bash
# Refresh VS Code IPC hook in all tmux panes
tmux list-panes -a -F "#{pane_id}" | xargs -I{} tmux send-keys -t {} "export VSCODE_IPC_HOOK_CLI=$(tmux show-environment VSCODE_IPC_HOOK_CLI | cut -d= -f2-)" Enter
