#!/bin/sh
# Claude Code status line: dir  branch/worktree  model  ctx%  5h%
# Reads the session JSON on stdin (https://code.claude.com/docs/en/statusline).
input=$(cat)
field() { printf '%s' "$input" | jq -r "$1 // empty"; }

dir=$(field '.workspace.current_dir')
model=$(field '.model.display_name')
ctx=$(field '.context_window.used_percentage')
five=$(field '.rate_limits.five_hour.used_percentage')
wt=$(field '.worktree.name')
branch=$(git -C "$dir" branch --show-current 2>/dev/null)

out=$(printf '\033[34m%s\033[0m' "${dir##*/}")
[ -n "$branch" ] && out="$out $(printf '\033[32m%s\033[0m' "$branch")"
[ -n "$wt" ] && out="$out $(printf '\033[35m[wt:%s]\033[0m' "$wt")"
[ -n "$model" ] && out="$out · $model"
if [ -n "$ctx" ]; then
  # yellow from 50%, red from 80%: time to /compact or start fresh
  c=32; [ "${ctx%.*}" -ge 50 ] && c=33; [ "${ctx%.*}" -ge 80 ] && c=31
  out="$out · $(printf "\033[${c}mctx %s%%\033[0m" "${ctx%.*}")"
fi
[ -n "$five" ] && out="$out · 5h ${five%.*}%"
printf '%s' "$out"
