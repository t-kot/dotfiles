#!/bin/sh
# Called from tmux `prefix c`. If the current pane is running ssh, open the new
# window with the same ssh arguments (re-connects to the same host); otherwise
# open a plain shell in $HOME.
#
# ps prints argv joined by spaces, so the original quoting is gone. The args
# are re-split on whitespace (globbing off) and handed to ssh as separate argv
# entries, never re-parsed by a shell. Only an argument that itself contained
# a space (rare for ssh) comes back split.
pane_pid=$(tmux display-message -p '#{pane_pid}')
ssh_pid=$(pgrep -P "$pane_pid" -x ssh | head -n1)
if [ -n "$ssh_pid" ]; then
  set -f
  # shellcheck disable=SC2046  # word splitting is intended here
  set -- $(ps -o args= -p "$ssh_pid")
  shift # drop "ssh"
  exec tmux new-window zsh -c 'ssh "$@"; exec zsh' zsh "$@"
fi
exec tmux new-window -c "$HOME"
