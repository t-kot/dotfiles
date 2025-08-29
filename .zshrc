# Fast, minimal zsh config (interactive shells only)

# Return early for non-interactive shells
[[ $- != *i* ]] && return

# History (fast + useful)
export HISTFILE=${HISTFILE:-$HOME/.zsh_history}
export HISTSIZE=50000
export SAVEHIST=50000
setopt hist_ignore_all_dups share_history inc_append_history

# UI: simple, fast prompt
setopt prompt_subst
PROMPT='%F{green}%n@%m%f %F{blue}%1~%f %# '

# Sensible defaults
setopt auto_cd correct noclobber interactive_comments
setopt no_beep

# Completion (cached, safe, and quick)
zmodload -i zsh/complist
autoload -Uz compinit
_zcompdump_cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh
mkdir -p $_zcompdump_cache_dir
_zcompdump_file=$_zcompdump_cache_dir/zcompdump

if [[ -f $_zcompdump_file(.Nmh+24) ]]; then
  compinit -C -d $_zcompdump_file
else
  compinit -d $_zcompdump_file
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' squeeze-slashes true

# Keybindings
bindkey -e

# PATH helpers (keep minimal; extend as needed)
typeset -Ua path
path=($HOME/bin $path)

# Aliases
if [[ -f $HOME/dotfiles/.zshrc.alias ]]; then
  source $HOME/dotfiles/.zshrc.alias
fi

# Optional: lazy-load fzf keybindings if available (no error if missing)
if [[ -r /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
elif [[ -r /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

