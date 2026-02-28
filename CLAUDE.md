# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repo managing zsh, tmux, and Neovim configuration. Files are symlinked from `~/dotfiles/` to their home-directory locations.

## Symlink Setup

```sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zshrc.alias ~/.zshrc.alias
ln -s ~/dotfiles/.zshrc.ohmyzsh-extra ~/.zshrc.ohmyzsh-extra
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
# Neovim reads nvim/init.vim via absolute path (~/Repository/dotfiles/nvim/)
```

## Reload Commands

- **zsh**: `exec zsh` (or `source ~/.zshrc`)
- **tmux**: `prefix r` (prefix is `C-s`) or `tmux source-file ~/.tmux.conf`
- **Neovim plugins**: `:call dein#update()` (first-time install: `:call dein#install()`)
- **Startup time check**: `time zsh -i -c exit`

## Architecture

### zsh (`~/.zshrc` entry point)
Three-tier framework fallback: oh-my-zsh → Prezto → minimal builtin. Loaded in order:
1. `.zshrc.ohmyzsh-extra` — early PATH (Homebrew), gitstatus cache, Obsidian workarounds, compfix skip
2. Framework init (oh-my-zsh or Prezto)
3. `.p10k.zsh` — Powerlevel10k prompt theme
4. `.zshrc.alias` — aliases and `stty -ixon` (frees `C-s` for tmux prefix)
5. Version managers (`rbenv`, `nodenv`, `pyenv`) — all lazy-loaded via shell function wrappers

### tmux (`.tmux.conf`)
- Prefix: `C-s` (not default `C-b`)
- vi-copy mode with `pbcopy` integration
- Pane split: `C-j` (horizontal), `C-l` (vertical) — inherit current path

### Neovim (`nvim/init.vim`)
Sources four sub-configs in order:
1. `vimrc.dein` — dein plugin manager (cache at `stdpath('data')/dein`, not in repo)
2. `vimrc.colors` — truecolor and colorscheme
3. `vimrc.basic` — options and keymaps (`;`/`:` swapped, `j/k` → `gj/gk`)
4. `vimrc.telescope` — file/buffer picker (`<C-f>` files, `<C-b>` buffers)

Plugin manifests: `nvim/dein.toml` (eager) and `nvim/dein_lazy.toml` (lazy, currently empty).

## Key Conventions

- **EditorConfig** (`.editorconfig`): 2-space indent default; 4-space for js/ts/py/go/as/sol; tabs for Makefile
- `vim` alias points to `nvim`
- Neovim paths in `vimrc.dein` and `init.vim` use absolute `~/Repository/dotfiles/nvim/` paths
- Plugin repos are not tracked in git (`.gitignore` excludes `nvim/dein/`)
- Recommended Homebrew packages: `ripgrep`, `fd`, `make` (for telescope-fzf-native build)
