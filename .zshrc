# Interactive zsh config. Environment/PATH live in .zprofile.
[[ $- != *i* ]] && return

# Repo root, resolved through the ~/.zshrc symlink
DOTFILES=${${(%):-%x}:A:h}

# --- Options ----------------------------------------------------------------
HISTFILE=~/.zsh_history HISTSIZE=50000 SAVEHIST=50000
setopt extended_history share_history hist_ignore_all_dups hist_ignore_space \
  hist_find_no_dups hist_save_no_dups hist_expire_dups_first hist_verify
setopt auto_cd auto_pushd pushd_ignore_dups pushd_silent pushd_to_home cdable_vars
setopt extended_glob interactive_comments rc_quotes long_list_jobs noclobber \
  correct complete_in_word always_to_end no_flow_control no_beep
bindkey -e

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' squeeze-slashes true

# --- Plugins (antidote, static bundle rebuilt when plugins.txt changes) -----
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
_plugins_txt=$DOTFILES/zsh/plugins.txt
_plugins_zsh=${XDG_CACHE_HOME:-$HOME/.cache}/zsh/plugins.zsh
if [[ ! $_plugins_zsh -nt $_plugins_txt ]]; then
  mkdir -p ${_plugins_zsh:h}
  antidote bundle <$_plugins_txt >|$_plugins_zsh
fi
source $_plugins_zsh
unset _plugins_txt _plugins_zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# Turn mouse/focus reporting back off at every prompt. A program that dies
# without cleaning up (e.g. Claude Code or vim over a dropped ssh) leaves it on,
# and every mouse move then types junk like `35;76;1M` into the shell.
_reset_terminal_modes() { print -n '\e[?1000l\e[?1002l\e[?1003l\e[?1006l\e[?1004l' }
precmd_functions+=(_reset_terminal_modes)

# --- Tools ------------------------------------------------------------------
(( $+commands[mise] )) && eval "$(mise activate zsh)"

# fzf: C-t (files), M-c (cd); C-r is taken over by atuin below
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
  export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
  source <(fzf --zsh)
fi

# zoxide: `z <partial dir>` to jump, `zi` for interactive pick
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"

# atuin: C-r full-text history search. Up arrow stays with
# history-substring-search.
(( $+commands[atuin] )) && eval "$(atuin init zsh --disable-up-arrow)"

(( $+commands[starship] )) && eval "$(starship init zsh)"

source $DOTFILES/.zshrc.alias

# Claude Code
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=64000
