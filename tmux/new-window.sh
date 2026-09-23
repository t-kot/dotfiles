#!/bin/sh
# Called from tmux `prefix c`. If the current pane is running ssh, open the new
# window with the same ssh arguments (re-connects to the same host); otherwise
# open a plain shell in $HOME.
pane_pid=$(tmux display-message -p '#{pane_pid}')
ssh_pid=$(pgrep -P "$pane_pid" -x ssh | head -n1)
if [ -n "$ssh_pid" ]; then
  ssh_args=$(ps -o args= -p "$ssh_pid" | sed 's/^ssh //')
  exec tmux new-window "ssh $ssh_args; exec zsh"
fi
exec tmux new-window -c "$HOME"
