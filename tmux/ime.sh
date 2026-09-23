#!/bin/sh
# Called from the tmux pane-mode-changed hook:
#   ime.sh <pane_id> <pane_in_mode> <pane_mode>
# Entering copy mode switches the macOS input source to ASCII (tmux option
# @ime-ascii) so y/v/etc. reach tmux directly instead of sitting in the
# Japanese IME's uncommitted text. Leaving restores the previous source.
command -v macism >/dev/null 2>&1 || exit 0
pane=$1 in_mode=$2 mode=$3
ascii=$(tmux show -gqv @ime-ascii)
: "${ascii:=com.apple.keylayout.ABC}"

if [ "$in_mode" = 1 ] && [ "$mode" = copy-mode ]; then
  cur=$(macism)
  if [ "$cur" != "$ascii" ]; then
    tmux set -p -t "$pane" @ime-prev "$cur"
    macism "$ascii"
  fi
else
  prev=$(tmux show -pqv -t "$pane" @ime-prev)
  if [ -n "$prev" ]; then
    tmux set -pu -t "$pane" @ime-prev
    macism "$prev"
  fi
fi
