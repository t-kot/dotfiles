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
ln -s ~/dotfiles/.claude-global/settings.json ~/.claude/settings.json
ln -s ~/dotfiles/.claude-global/skills ~/.claude/skills
# Neovim reads nvim/init.vim via absolute path (~/Repository/dotfiles/nvim/)
```

## Reload Commands

- **zsh**: `exec zsh` (or `source ~/.zshrc`)
- **tmux**: `prefix r` (prefix is `C-s`) or `tmux source-file ~/.tmux.conf`
- **Neovim plugins**: `:call dein#update()` (first-time install: `:call dein#install()`)
- **Startup time check**: `time zsh -i -c exit`

## Key Conventions

- `.zshrc.alias` runs `stty -ixon` (no comment there explaining why): this frees `C-s` for the tmux prefix
- Recommended Homebrew packages: `ripgrep`, `fd`, `make` (for telescope-fzf-native build)
