# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repo managing zsh, tmux, Neovim, git, mise and Claude Code configuration. The repo lives at `~/Repository/dotfiles` (some files reference that absolute path) and is symlinked into `$HOME` by `install.sh`.

## Setup

```sh
./install.sh          # symlinks (idempotent; conflicting files go to ~/.dotfiles-backup/<ts>/)
./install.sh --brew   # also `brew bundle` from Brewfile
```

The link table lives in `install.sh`. When adding a new config file, add it there and to the docs.

## Layout

- zsh: `.zshenv` → `.zprofile` (env/PATH) → `.zshrc` (interactive). No framework: plugins via antidote (`zsh/plugins.txt`), prompt via starship (`starship.toml`).
- Neovim: `nvim/init.lua` only, plugins via built-in `vim.pack`; `nvim/nvim-pack-lock.json` is committed. Requires Neovim 0.12+.
- git: `git/config` → `~/.config/git/config`. Machine-local identity/credentials stay in `~/.gitconfig` (read later, so it wins).
- Runtimes: mise (`mise/config.toml`) for node/pnpm; Python is managed by uv.
- Claude Code: `.claude-global/settings.json` and `skills/` → `~/.claude/`. Both are gitignored (they hold private repo names / org paths); `settings.example.json` is the tracked, sanitized template — mirror shareable changes (hooks, permissions) into it by hand. Hooks set the tmux window option `@cc_state`, which `.tmux.conf` renders in the status bar.

## Reload Commands

- **zsh**: `exec zsh`
- **tmux**: `prefix r` (prefix is `C-s`); after `brew upgrade tmux` the server must be restarted
- **Neovim plugins**: `:lua vim.pack.update()` then `:write` to confirm
- **Startup time check**: `time zsh -i -c exit` (~70ms baseline)

## Key Conventions

- `.zshrc.alias` runs `stty -ixon`: this frees `C-s` for the tmux prefix
- Aliases must not change the output format of `ls`/`cat`/etc. — Claude Code's shell snapshot inherits them. Add new names (`ll`, `lg`) instead.
- This repo is public: keep private repo names, org paths and secrets out of tracked files.
