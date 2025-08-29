# Fast, framework-aware zsh config (interactive shells only)

# Return early for non-interactive shells
[[ $- != *i* ]] && return

# Load performance extras early (PATH/bootstrap, Obsidian workarounds)
source "$HOME/dotfiles/.zshrc.ohmyzsh-extra" 2>/dev/null || true

# Prefer oh-my-zsh if installed; else Prezto; else minimal fallback
_loaded_framework=none
if [[ -z "$ZSH" ]]; then
  ZSH="$HOME/.oh-my-zsh"
fi
if [[ -d "$ZSH" && -f "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
  _loaded_framework=ohmyzsh
elif [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  _loaded_framework=prezto
else
  # Minimal fallback
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
fi

# Powerlevel10k (optional). Keep near top for instant prompt to work.
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# Keybindings
bindkey -e

# PATH helpers (keep minimal; extend as needed)
typeset -Ua path
path=($HOME/bin $path)

# Aliases
[[ -f $HOME/dotfiles/.zshrc.alias ]] && source $HOME/dotfiles/.zshrc.alias

# Version managers: lazy loaders (work regardless of framework)
export RBENV_ROOT="${RBENV_ROOT:-$HOME/.rbenv}"
export PATH="$RBENV_ROOT/bin:$RBENV_ROOT/shims:$PATH"
if command -v rbenv >/dev/null 2>&1; then
  rbenv() { unset -f rbenv; eval "$(command rbenv init - zsh)"; rbenv "$@"; }
fi

export NODENV_ROOT="${NODENV_ROOT:-$HOME/.nodenv}"
export PATH="$NODENV_ROOT/bin:$NODENV_ROOT/shims:$PATH"
if command -v nodenv >/dev/null 2>&1; then
  nodenv() { unset -f nodenv; eval "$(command nodenv init -)"; nodenv "$@"; }
fi

export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
if command -v pyenv >/dev/null 2>&1; then
  pyenv() { unset -f pyenv; eval "$(command pyenv init -)"; pyenv "$@"; }
fi

# Optional: lazy-load fzf keybindings if available (no error if missing)
if [[ -r /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
elif [[ -r /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
