# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias e="exit"
#==== git alias ====
alias gsh="git show"
alias gst="git status"
alias gci="git commit"
alias gdi="git diff"
alias gbr="git branch"
alias gad="git add "
alias gco="git checkout"
alias glog="git log"
alias grs="git reset"
#==================

alias vi="env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim"
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias r="rails"
alias gcc-4.2="gcc"
alias tmux="tmux -2"
alias tlist="tmux list-session"
alias tkill="tmux kill-session"
alias tkill!="tmux kill-server"

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  export LSCOLORS=gxfxcxdxbxegedabagacad
  zstyle ':completion:*' list-colors \
    'di=33' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

## load user .zshrc configuration file
#
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# 補完時に大小文字を区別しない
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1
export NODE_PATH=$HOME/.npm/lib:$PATH
export PATH=$HOME/.nvm/v0.8.4/bin/:/android-sdk-mac_x86/platform-tools:/android-sdk-mac_x86/tools:/bin:/opt/local/bin:/opt/local/sbin/:/usr/local/git/bin/:/usr/local/bin/:$PATH
export MANPATH=$HOME/.npm/man:/opt/local/man:$MANPATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#Titanium builder
alias ti='~/Library/Application\ Support/Titanium/mobilesdk/osx/2.0.1.GA2/iphone/builder.py'

#load nvm
source ~/.nvm/nvm.sh

