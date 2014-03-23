ZSH=$HOME/.oh-my-zsh
ZSH_THEME='rkj'
COMPLETION_WAITING_DOTS="true"
plugins=(git ruby rails gem brew cap)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $HOME/dotfiles/.zshrc.custom

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
