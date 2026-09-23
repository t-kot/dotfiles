#!/bin/zsh
# Symlink dotfiles into $HOME. Idempotent: correct links are left alone,
# anything else in the way is moved to ~/.dotfiles-backup/<timestamp>/.
#   ./install.sh            link everything
#   ./install.sh --brew     also run `brew bundle`
set -eu
DOTFILES=${0:A:h}
BACKUP=$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)

# repo path -> link path
links=(
  .zshenv                        ~/.zshenv
  .zprofile                      ~/.zprofile
  .zshrc                         ~/.zshrc
  .tmux.conf                     ~/.tmux.conf
  nvim                           ~/.config/nvim
  git/config                     ~/.config/git/config
  git/ignore                     ~/.config/git/ignore
  mise/config.toml               ~/.config/mise/config.toml
  starship.toml                  ~/.config/starship.toml
  .claude-global/settings.json   ~/.claude/settings.json
  .claude-global/skills          ~/.claude/skills
)

for src dst in $links; do
  src=$DOTFILES/$src
  if [[ -L $dst && ${dst:A} == ${src:A} ]]; then
    continue
  fi
  if [[ -e $dst || -L $dst ]]; then
    mkdir -p $BACKUP
    mv $dst $BACKUP/
    print "backed up $dst -> $BACKUP/"
  fi
  mkdir -p ${dst:h}
  ln -s $src $dst
  print "linked $dst -> $src"
done

if [[ ${1:-} == --brew ]]; then
  brew bundle --file=$DOTFILES/Brewfile
fi

# tmux plugin manager
[[ -d ~/.tmux/plugins/tpm ]] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
